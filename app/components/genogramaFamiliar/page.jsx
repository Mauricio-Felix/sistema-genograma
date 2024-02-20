"use client";
import Genogram from "./Genogram.js";
import Explain from "./Explain.js";
import { useEffect, useState } from "react";
import {
  // getFamiliaEmbarazadaById,
  getAbortoById,
  getFamiliaEnfermedadById,
} from "@/app/action";


//para dibujar el arbol familiar debo sacar las relacciones de aqui pero como el algoritmo se basa
// en una raiz es decir papa y mama (por algo es arbol familiar) entonces por simple logica empezarian por los
//padres luego si tienen hermano esos padres tienen hijos los hijos de los hijos tienen hijos y asi
// se supone que si los padres tienen 4 hijos esos hijos son hermanos
const relacionesFamiliares = {
  1: "JEFE/A DEL NUCLEO DEL HOGAR", //Por que poner esto? no le veo el sentido
  2: "ESPOSO/A", //se supone que si tienen hijos estan casados
  3: "CONVIVIENTE", //queda fuera del arbol por que no tiene asignado padres en comun
  4: "HIJO/A",
  5: "HIJASTRO/A",
  6: "PADRE",
  7: "MADRE",
  8: "SUEGRO/A", //queda fuera del arbol por que no tiene asignado padres en comun
  9: "YERNO", //queda fuera del arbol por que no tiene asignado padres en comun
  10: "NUERA", //queda fuera del arbol por que no tiene asignado padres en comun
  11: "NIETO/A",
  12: "HERMANO/A",
  13: "CUÑADO/A", //queda fuera del arbol por que no tiene asignado padres en comun
  14: "ABUELO/A",
  15: "TIO/A",
  16: "PRIMO/A",
  17: "OTRO FAMILIAR", //queda fuera del arbol por que no tiene asignado padres en comun
  18: "NO FAMILIAR",
  29: "GEMELOS",
  30: "MELLIZOS",
};

// Ejemplo de acceso a la descripción de una relación por su número
// "JEFE/A DEL NUCLEO DEL HOGAR"

function obetnerEtiquetas(dato) {
  const resultado = [];

  dato.forEach((enfermedad) => {
    const codigo = enfermedad.cog_enfermedad;

    resultado.push(codigo);

  });
  return resultado;
}

function mapearDatosGenograma(datos) {
  const genoData = [];
  const genoDataMap = [];
  const padres = [];
  const hijos = [];
  const nietos = [];

  // Función para obtener o crear un nodo en el genograma
  function obtenerCrearNodo(
    id,
    nombre,
    genero,
    codigo,
    estado_civil,
    anios,
    fallecido,
    abortosEspontaneos,
    abortosInducidos
  ) {
    let nodo = genoData.find((n) => n.key === id);
    if (!nodo) {
      //var deaht =
      if (abortosEspontaneos !== undefined && abortosInducidos !== undefined) {
        nodo = {
          key: id,
          n: nombre,
          // m: null,
          // f: null,
          // ux: null,
          a: [fallecido == true ? "S" : ""],
          ec: estado_civil,
          anios: anios,
          s: genero == "FEMENINO" ? "F" : "M",
          codigo: codigo,
          abortosEspontaneos,
          abortosInducidos,
        };
      } else {
        nodo = {
          key: id,
          n: nombre,
          // m: null,
          // f: null,
          // ux: null,
          a: [fallecido == true ? "S" : ""],
          ec: estado_civil,
          anios: anios,
          s: genero == "FEMENINO" ? "F" : "M",
          codigo: codigo,
        };
      }
      genoData.push(nodo);
    }
    return nodo;
  }

  // Mapear datos a genograma
  var father;
  var mother;
  var nodo_embarazada;
  //console.log(datos)
  datos.forEach((dato, index) => {
    const {
      csctbfamiliaid,
      nom_fam,
      genero,
      codigo,
      estado_civil,
      anios,
      fallecido,
      abortosEspontaneos,
      abortosInducidos,
      nucleo_familiar,
      fecha_union,
    } = dato;

    const nodo = obtenerCrearNodo(
      csctbfamiliaid,
      nom_fam,
      genero,
      codigo,
      estado_civil,
      anios,
      fallecido,
      abortosEspontaneos,
      abortosInducidos
    );

    //padre

    if (
      dato.nom_parentesco == relacionesFamiliares[6] &&
      dato.genero == "MASCULINO"
    ) {
      //hijo

      nodo.ux = datos.find(
        (persona) => persona.nom_parentesco == relacionesFamiliares[7]
      )?.csctbfamiliaid;
      nodo.s = "M";
      padres.push(nodo);
    }

    //hijos
    else if (dato.nom_parentesco == relacionesFamiliares[4]) {
      //const padreMadre = dato.genero === "MASCULINO" ? "m" : "f";
      //nodo[padreMadre] = dato.csctbfamiliaid;
      nodo.f = datos.find(
        (persona) => persona.nom_parentesco == relacionesFamiliares[6]
      )?.csctbfamiliaid;
      nodo.m = datos.find(
        (persona) => persona.nom_parentesco == relacionesFamiliares[7]
      )?.csctbfamiliaid;
      nodo.s = dato.genero == "MASCULINO" ? "M" : "F";
      hijos.push(dato);
    }
    //madre
    else if (
      dato.nom_parentesco == relacionesFamiliares[7] &&
      dato.genero == "FEMENINO"
    ) {
      nodo.s = "F";
    }
    //nieto
    else if (dato.nom_parentesco == relacionesFamiliares[11]) {
      if (hijos[hijos.length - 1].nom_parentesco === relacionesFamiliares[9]) {
        nodo.f = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        //nodo.h = nodo.s == "M" ? "M" : "F";
      } else if (
        hijos[hijos.length - 1].nom_parentesco === relacionesFamiliares[10]
      ) {
        nodo.f = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        //nodo.h = nodo.s == "M" ? "hijastro" : "hijastra";
      }
    }
    //Nnuera
    else if (dato.nom_parentesco == relacionesFamiliares[10]) {
      nodo.vir = hijos[hijos.length - 1].csctbfamiliaid;
      hijos.push(dato);
    }
    //hierno
    else if (dato.nom_parentesco == relacionesFamiliares[9]) {
      nodo.ux = hijos[hijos.length - 1].csctbfamiliaid;
      hijos.push(dato);
    }

    //hijastro
    else if (dato.nom_parentesco == relacionesFamiliares[5]) {
      // hijastro
      if (hijos[hijos.length - 1]?.nom_parentesco === relacionesFamiliares[9]) {
        nodo.f = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";
        nodo.h = nodo.s == "M" ? "hijastro" : "hijastra";
      } else if (
        hijos[hijos.length - 1]?.nom_parentesco === relacionesFamiliares[10]
      ) {
        nodo.f = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        nodo.h = nodo.s == "M" ? "hijastro" : "hijastra";
      } else {
        nodo.f = datos.find(
          (persona) => persona.nom_parentesco == relacionesFamiliares[6]
        )?.csctbfamiliaid;
        nodo.m = datos.find(
          (persona) => persona.nom_parentesco == relacionesFamiliares[7]
        )?.csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        nodo.h = nodo.s == "M" ? "hijastro" : "hijastra";

        hijos.push(dato);
      }
    }

    //gemelos y mellizos
    else if (
      dato.nom_parentesco == relacionesFamiliares[29] ||
      dato.nom_parentesco == relacionesFamiliares[30]
    ) {
      if (hijos[hijos.length - 1]?.nom_parentesco === relacionesFamiliares[9]) {
        nodo.f = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        nodo.t = "d";
      } else if (
        hijos[hijos.length - 1]?.nom_parentesco === relacionesFamiliares[10]
      ) {
        nodo.f = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        nodo.t = "d";
      } else {
        nodo.f = datos.find(
          (persona) => persona.nom_parentesco == relacionesFamiliares[6]
        )?.csctbfamiliaid;
        nodo.m = datos.find(
          (persona) => persona.nom_parentesco == relacionesFamiliares[7]
        )?.csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

        nodo.t = "d";
        hijos.push(dato);
      }
    }

    //console.log(dato.abortosEspontaneos)
    
    //console.log(dato.abortosInducidos)
    if (dato.abortosInducidos !== undefined) {
     // console.log(dato.abortosInducidos)
      if (dato.nom_parentesco == relacionesFamiliares[4]) {
        //.log(dato.abortosInducidos, dato.nom_parentesco);

        for (let index = 0; index < dato.abortosInducidos; index++) {
          var nodo_aborto = {
            key: index,
            f: dato.csctbfamiliaid + 1,
            m: dato.csctbfamiliaid,
            s: "INDUCIDO",
          };
          genoDataMap.push(nodo_aborto);
        }

        father = dato.csctbfamiliaid + 1;
        mother = dato.csctbfamiliaid;

        //nodo.s = "embarazada";
        //nodo.h = nodo.s == "M" ? "M" : "F";
      } else if (dato.nom_parentesco === relacionesFamiliares[10]) {
        //console.log("nuera")
        //console.log(dato.abortosInducidos, dato.nom_parentesco);

        for (let index = 0; index < dato.abortosInducidos; index++) {
          var nodo_aborto = {
            key: index,
            m: hijos[hijos.length - 1].csctbfamiliaid,
            f: hijos[hijos.length - 2].csctbfamiliaid,
            s: "INDUCIDO",
          };
          genoDataMap.push(nodo_aborto);
        }
        father = hijos[hijos.length - 2].csctbfamiliaid;
        mother = hijos[hijos.length - 1].csctbfamiliaid;
      } else {
        //console.log("hijo")
        //console.log(dato.abortosInducidos, dato.nom_parentesco);

        for (let index = 0; index < dato.abortosInducidos; index++) {
          console.log(index)
          var nodo_aborto = {
            key: index,
            m: nodo.key,
            f: datos.find(
              (persona) => persona.nom_parentesco == relacionesFamiliares[6]
            )?.csctbfamiliaid,
            s: "INDUCIDO",
          };
          genoDataMap.push(nodo_aborto);
        }

        father = nodo.key;
        mother = datos.find(
          (persona) => persona.nom_parentesco == relacionesFamiliares[6]
        )?.csctbfamiliaid;
        //nodo.s = "embarazada";
      }
    }
    if (dato.abortosEspontaneos !== undefined) {
      console.log(dato.abortosEspontaneos)
      //console.log(dato.abortosEspontaneos);

      if (dato.nom_parentesco == relacionesFamiliares[4]) {
        for (let index = 0; index < dato.abortosEspontaneos; index++) {
          var nodo_aborto = {
            key: index,
            f: dato.csctbfamiliaid + 1,
            m: dato.csctbfamiliaid,
            s: "ESPONTÁNEO",
          };
          genoDataMap.push(nodo_aborto);
        }

        father = dato.csctbfamiliaid + 1;
        mother = dato.csctbfamiliaid;
        //nodo.s = "embarazada";
        //nodo.h = nodo.s == "M" ? "M" : "F";
      } else if (dato.nom_parentesco === relacionesFamiliares[10]) {
        //console.log(dato)

        for (let index = 0; index < dato.abortosEspontaneos; index++) {
          var nodo_aborto = {
            key: index,
            m: hijos[hijos.length - 1].csctbfamiliaid,
            f: hijos[hijos.length - 2].csctbfamiliaid,
            s: "ESPONTÁNEO",
          };
          genoDataMap.push(nodo_aborto);
        }

        father = hijos[hijos.length - 2].csctbfamiliaid;
        mother = hijos[hijos.length - 1].csctbfamiliaid;
        //nodo.s = "embarazada";

        //nodo.h = nodo.s == "M" ? "hijastro" : "hijastra";
      } else {
        //console.log("hijo")

        for (let index = 0; index < dato.abortosEspontaneos; index++) {
          var nodo_aborto = {
            key: index,
            m: nodo.key,
            f: datos.find(
              (persona) => persona.nom_parentesco == relacionesFamiliares[6]
            )?.csctbfamiliaid,
            s: "ESPONTÁNEO",
          };
          genoDataMap.push(nodo_aborto);
        }
        (father = datos.find(
          (persona) => persona.nom_parentesco == relacionesFamiliares[6]
        )?.csctbfamiliaid),
          (mother = nodo.key);

        //nodo.s = "embarazada";
      }

      nodo_embarazada = {
        key: Math.floor(Math.random() * 10),
        m: mother,
        f: father,
        s: "embarazada",
      };
      genoDataMap.push(nodo_embarazada);
    }

    if (dato.informante) {
      nodo.a.push("AP");
    }

    if (dato.nucleo_familiar) {
      nodo.a.push("NF");
    }

    if (dato.fecha_union != null) {
      const fecha = new Date(dato.fecha_union); // Convertir la cadena de texto a un objeto Date
      const anio = fecha.getFullYear();
      nodo.fu = anio;
    }

    //console.log(nodo)
    genoDataMap.push(nodo);
  });

  return genoDataMap;
}

const MostrarGenograma = ({ familiares, idFamilia }) => {
  //console.log(familiares)

  const [familiarEtiquetado, setfamiliiarEtiquetado] = useState([]);
  useEffect(() => {
    const getEnfermedades = async () => {
      return await Promise.all(
        familiares.map(async (familiar) => {
          const data = await getFamiliaEnfermedadById(familiar.csctbfamiliaid);
          const etiquetas = obetnerEtiquetas(data);
          const isEmbarazada = await getAbortoById(
            familiar.csctbfamiliaid
          );
          // console.log(isEmbarazada[0])
          if (isEmbarazada[0]?.n_abortos_espontaneos != null) {
            //console.log(isEmbarazada);
            return {
              ...familiar,
              codigo: etiquetas,
              abortosEspontaneos: isEmbarazada[0].n_abortos_espontaneos,
              abortosInducidos: isEmbarazada[0].n_abortos_inducidos,
            };
          } else {
            return { ...familiar, codigo: etiquetas };
          }
        })
      );
    };
    getEnfermedades().then((data) => {
      setfamiliiarEtiquetado(mapearDatosGenograma(data));
    });
  }, []);
 
  return (
    <div>
      {familiarEtiquetado.length > 0 ? (
        <Genogram idFamilia={idFamilia} Genogram={familiarEtiquetado} />
      ) : (
        <div className="w-100 vh-100 align-items-center d-flex justify-content-center">
          <div className="text-center d-flex flex-column">
            <center>
              <div className="spinner-border text-primary" role="status">
                <span className="visually-hidden">Loading...</span>
              </div>
              <div>Cargando Genograma</div>
            </center>
          </div>
        </div>
      )}
    </div>
  );
};

export default MostrarGenograma;
