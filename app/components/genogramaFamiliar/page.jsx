"use client";
import Genogram from "./Genogram.js";
import { useEffect, useState } from "react";
import {
  getAbortoById,
  getFamiliaEnfermedadById,
} from "@/app/action";

/*
Para generar el familiograma, es necesario establecer las relaciones familiares (parentesco) similar a 
a la base de datos de la ficha familiar.En este caso, el algoritmo se basa en una raíz, que son los padres. 
A partir de aquí, se pueden seguir las relaciones familiares de manera lógica. Los padres tendrían hijos, 
y estos hijos (hermanos), a su vez, podrían tener hijos (nietos, primos) con su pareja (nuera o yerno). 
Sin embargo, existe un caso especial que es el hijastro, que puede ser considerado como hijo o nieto 
dependiendo del contexto familiar.
*/

/*
El algoritmo esta desarrollado para generar una familia de 3 generaciones, padres, hijos y nietos.
*/

/*
A continuación se indica que relacion (parentesco) se usará en base a las simbologías presentadas por el cliente
Formato 2021 para poder generar el familiograma
*/
const relacionesFamiliares = {
  1: "JEFE/A DEL NUCLEO DEL HOGAR", //no
  2: "ESPOSO/A", //no
  3: "CONVIVIENTE", //no
  4: "HIJO/A", //si
  5: "HIJASTRO/A", //si
  6: "PADRE", //si
  7: "MADRE", //si
  8: "SUEGRO/A", 
  9: "YERNO", //si
  10: "NUERA", //si
  11: "NIETO/A", //si
  12: "HERMANO/A", //no
  13: "CUÑADO/A", //no
  14: "ABUELO/A", //no
  15: "TIO/A", //no
  16: "PRIMO/A", //no
  17: "OTRO FAMILIAR", //no
  18: "NO FAMILIAR", //no
  29: "GEMELOS", //si (fue añadido luego)
  30: "MELLIZOS", //si (fue añadido luego)
};


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
