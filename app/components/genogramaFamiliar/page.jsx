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
A continuación se indica los parentescos que se usarán en la aplicación
*/
const relacionesFamiliares = {
  1: "JEFE/A DEL NUCLEO DEL HOGAR", // no
  2: "ESPOSO/A", // no
  3: "CONVIVIENTE", // no
  4: "HIJO/A", // si
  5: "HIJASTRO/A", // si
  6: "PADRE", // si
  7: "MADRE", // si
  8: "SUEGRO/A", // no
  9: "YERNO", // si
  10: "NUERA", // si
  11: "NIETO/A", // si
  12: "HERMANO/A", // no
  13: "CUÑADO/A", // no
  14: "ABUELO/A", // no
  15: "TIO/A", // no
  16: "PRIMO/A", // no
  17: "OTRO FAMILIAR", // no
  18: "NO FAMILIAR", // no
  29: "GEMELOS", // si
  30: "MELLIZOS", // si
};

//  Esta función recorre el array y devuelve un nuevo array con los códigos de enfermedad de cada objeto.
function obetnerEtiquetas(dato) {
  const resultado = [];

  dato.forEach((enfermedad) => {
    const codigo = enfermedad.cog_enfermedad;

    resultado.push(codigo);

  });
  return resultado;
}

//? Esta función recibe un array de datos (datos) y realiza varias operaciones para mapear estos datos a un genograma
function mapearDatosGenograma(datos) {
  /*Estos arrays se utilizan para almacenar información sobre los nodos del genograma y las relaciones 
  entre ellos */
  const genoData = [];
  const genoDataMap = [];
  const padres = [];
  const hijos = [];
  const nietos = [];

  /*
  Esta función se utiliza para obtener un nodo del genograma si ya existe o crear uno nuevo si no existe. 
  Toma varios parámetros para definir las propiedades del nodo
  */
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
      if (abortosEspontaneos !== undefined && abortosInducidos !== undefined) {
        nodo = {
          key: id,
          n: nombre,
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

  /*
  Se recorre el array datos utilizando el método forEach para procesar cada dato y mapearlo a 
  un nodo en el genograma
  */
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
    } = dato;
    /*
    Para cada dato en datos, se extraen las propiedades necesarias (como csctbfamiliaid, nom_fam, genero, etc.) 
    y se llama a la función obtenerCrearNodo para obtener o crear un nodo en el genograma con esas propiedades.
    */
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

    /*
      Dependiendo del tipo de relación familiar (nom_parentesco), se asignan diferentes propiedades al nodo. 
      Por ejemplo, si el tipo de relación es "Padre", se agrega el nodo a la lista de padres; si es "Hijo", 
      se asigna el padre y la madre del nodo; si es "Madre", se marca el nodo como una mujer, etc.
    */

    // Padre

    if (
      dato.nom_parentesco == relacionesFamiliares[6] &&
      dato.genero == "MASCULINO"
    ) {
      // Hijo

      nodo.ux = datos.find(
        (persona) => persona.nom_parentesco == relacionesFamiliares[7]
      )?.csctbfamiliaid;
      nodo.s = "M";
      padres.push(nodo);
    }

    // Hijos
    else if (dato.nom_parentesco == relacionesFamiliares[4]) {
      nodo.f = datos.find(
        (persona) => persona.nom_parentesco == relacionesFamiliares[6]
      )?.csctbfamiliaid;
      nodo.m = datos.find(
        (persona) => persona.nom_parentesco == relacionesFamiliares[7]
      )?.csctbfamiliaid;
      nodo.s = dato.genero == "MASCULINO" ? "M" : "F";
      hijos.push(dato);
    }
    // Madre
    else if (
      dato.nom_parentesco == relacionesFamiliares[7] &&
      dato.genero == "FEMENINO"
    ) {
      nodo.s = "F";
    }
    // Nieto
    else if (dato.nom_parentesco == relacionesFamiliares[11]) {
      if (hijos[hijos.length - 1].nom_parentesco === relacionesFamiliares[9]) {
        nodo.f = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

      } else if (
        hijos[hijos.length - 1].nom_parentesco === relacionesFamiliares[10]
      ) {
        nodo.f = hijos[hijos.length - 2].csctbfamiliaid;
        nodo.m = hijos[hijos.length - 1].csctbfamiliaid;
        nodo.s = dato.genero == "MASCULINO" ? "M" : "F";

      }
    }
    // Nuera
    else if (dato.nom_parentesco == relacionesFamiliares[10]) {
      nodo.vir = hijos[hijos.length - 1].csctbfamiliaid;
      hijos.push(dato);
    }
    // Hierno
    else if (dato.nom_parentesco == relacionesFamiliares[9]) {
      nodo.ux = hijos[hijos.length - 1].csctbfamiliaid;
      hijos.push(dato);
    }

    // Hijastros
    else if (dato.nom_parentesco == relacionesFamiliares[5]) {
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

    // Gemelos y mellizos
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

    /*
      Si el dato tiene información sobre abortos espontáneos (abortosEspontaneos) o abortos inducidos 
      (abortosInducidos), se crean nodos adicionales en el genograma para representar estos eventos, 
      y se añaden al array genoDataMap.
    */

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
      }

      nodo_embarazada = {
        key: Math.floor(Math.random() * 10),
        m: mother,
        f: father,
        s: "embarazada",
      };
      genoDataMap.push(nodo_embarazada);
    }

    /*
      Se agregan etiquetas adicionales al nodo si el dato indica que es un informante (informante), 
      pertenece al núcleo familiar (nucleo_familiar), o tiene una fecha de unión (fecha_union).
    */

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

    /*
      Finalmente, el nodo se agrega al array genoDataMap, que se utiliza para almacenar todos los nodos del genograma
    */
    genoDataMap.push(nodo);
  });
  /*
    Una vez que se procesan todos los datos, la función retorna el array genoDataMap, 
    que contiene todos los nodos del genograma y sus relaciones.
  */
  return genoDataMap;
}

/*
   Este componente muestra un genograma familiar, tiliza el estado local y el efecto secundario 
   useEffect para obtener información adicional sobre cada familiar, como enfermedades y abortos. 
   Luego, muestra el genograma con los datos obtenidos o un mensaje de carga si aún no se han 
   obtenido los datos
*/

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
