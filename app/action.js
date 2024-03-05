"use server";
import conn from "@/database/connection";
import {
  obtenerCsctbedadesid,
  obtenerCsctbedadesidRiesgos,
} from "./utils/rangoEdad";
import { obetnerIdsAndMerge } from "./utils/obtenerId";
import { writeFile } from "fs/promises";
import path, { format } from "path";

//? FUNCIONES DE REGISTRAR INFORMACION

export async function saveFamilia(formData, id) {

  const fechaUnion = formData.fechaUnion == "" ? null : formData.fechaUnion
  const id_jefe =
    id == null
      ? `CURRVAL('public.csctbfamilia_csctbfamiliaid_seq')`
      : id.toString();
  try {
    const text = `INSERT INTO public.csctbfamilia ( 
      csctbparentescoid, 
      cedula_fam, 
      nom_fam, 
      ape_fam, 
      fecha_na_fam,
      anios, 
      meses, 
      dias,
      genero, 
      estado_fam, 
      fecreacion_fam,
      id_jefe_hogar,
      estado_civil,  
      fallecido, 
      informante,
      fecha_union,
      nucleo_familiar
      
      )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8,
       $9, $10, current_timestamp,${id_jefe},$11, $12, $13,$14, $15)
        RETURNING csctbfamiliaid,nom_fam, ape_fam,genero,csctbparentescoid`;

    const values = [
      formData.parentesco,
      formData.cedula,
      formData.nombres,
      formData.apellidos,
      formData.fechaNacimiento,
      formData.anios,
      formData.meses,
      formData.dias,
      formData.genero,
      true,
      formData.estadoCivil,
      formData.fallecido,
      formData.informante,
      fechaUnion,
      formData.nucleoFamiliar,
    ];

    const res = await conn.query(text, values);

    await conn.query(
      `INSERT INTO public.csctbficha(
      csctbfamiliaid, ficha_creacion)
    VALUES ($1, current_timestamp);
    `,
      [res.rows[0].csctbfamiliaid]
    );

    if (formData.genero == "FEMENINO") {
      await conn.query(
        `INSERT INTO 
        public.csctbembarazadas(csctbfamiliaid)
        VALUES ($1); 
        `,
        [res.rows[0].csctbfamiliaid]
      );
    }
    return res.rows;
  } catch (error) {
    //console.log(error);
    return { error: "No se ha podido ingresar sus datos" }; // Lanzar el error nuevamente para que sea manejado por el código que llama a la función
  }
}

export async function saveEnfermedadVacunas(
  vacunas,
  enfermedades,
  id_familia
) {
  const listaIdsVacunas = Object.keys(vacunas)
    .filter((key) => typeof vacunas[key] === "boolean" && vacunas[key])
    .map(Number);

  const listaIdsEnfermedades = enfermedades.map(
    (item) => item.csctbenfermedadid
  );

  let insertVacuna = `
    INSERT INTO public.csctbvacunafamilia(csctbvacunasid, csctbfamiliaid, fecha_cre_vacuna)VALUES
  `;
  for (const id of listaIdsVacunas) {
    insertVacuna += `(${id}, ${id_familia}, current_timestamp),`;
  }
  insertVacuna = insertVacuna.slice(0, -1);

  let insertEnfermedad = `INSERT INTO public.csctbenferfam(csctbenfermedadid, csctbfamiliaid)VALUES`;
  for (const id of listaIdsEnfermedades) {
    insertEnfermedad += `(${id}, ${id_familia}),`;
  }
  insertEnfermedad = insertEnfermedad.slice(0, -1);
  try {
    //console.log([insertEnfermedad, insertVacuna])

    for (let i of [insertEnfermedad, insertVacuna]) {
      var result = await conn.query(i);
    }
    return result.rows;
  } catch (error) {
    console.log(error);
    return { error: "No se ha podido ingresar sus datos" };
  }
}

export async function saveAborto(
  formData,
  id_familia
) {
  try {
    var result = await conn.query(
      `UPDATE public.csctbembarazadas
    SET 
        n_abortos_espontaneos=$1,
        n_abortos_inducidos=$2
    WHERE csctbfamiliaid = $3;`,
      [
        formData.abortosEspontaneos,
        formData.abortosInducidos,
        id_familia,
      ]
    );

    return result.rows;
  } catch (error) {
    console.log(error);
    return { error: "No se ha podido ingresar sus datos" };
  }
}

export async function saveDiagnosticoFamiliar(id_familia) {
  try {
    const result = await conn.query(
      `INSERT INTO csctbdiagnosticofamiliar(
        id_jefe_hogar)
      VALUES ($1);`,
      [id_familia]
    );

    return result.rows;
  } catch (error) {
    console.log(error);
    return { error: "No se podido ingresar tu datos" };
  }
}

export async function saveImagenGenograma(img, id) {
  //const dataURL = await img;
  const currentDate = new Date();
  const formattedDate = currentDate.toISOString().slice(0, 10);
  const filePath = path.join(
    process.cwd(),
    "public/genogramas",
    `${id}_${formattedDate}.svg`
  );
  await writeFile(filePath, img);
  const result = await conn.query(
    `
    INSERT INTO "csctbgenogramas"(
    imagen,  "fecha_add_geno", id_jefe_hogar)
    VALUES ( $1, current_timestamp, $2);
  `,
    [`${id}_${formattedDate}.svg`, id]
  );

  return filePath;
}

//? FUNCIONES PARA EXTRAER INFORMACION

export async function getParentesco() {
  const result = await conn.query(`SELECT csctbparentescoid, nom_parentesco
    FROM public.csctbparentesco;`);
  return result.rows;
}

export async function getVacunas(anios, meses, dias) {
  const rango_edad = obtenerCsctbedadesid(anios, meses, dias);
  const result = await conn.query(
    `SELECT 
      csctbvacunas.csctbvacunasid, 
      csctbedades.rango_edad, 
      csctbvacunas.nom_vacuna
    FROM 
      public.csctbedades, 
      public.csctbvacunas
    WHERE 
      csctbedades.csctbedadesid = csctbvacunas.csctbedadesid and
      csctbvacunas.csctbedadesid = $1
`,
    [rango_edad]
  );

  return result.rows;
}

export async function searchEnfermedades(termino) {
  const text = `
  SELECT 
  csctbenfermedad.csctbenfermedadid, 
  csctbenfermedad.nom_enfermedad, 
  csctbenfermedad.cog_enfermedad
FROM 
  public.csctbenfermedad
WHERE 
  cog_enfermedad LIKE '%' || $1 || '%' OR
  LOWER(nom_enfermedad) LIKE '%' || LOWER($1) || '%'
ORDER BY 
  nom_enfermedad ASC;


  `;
  const values = [termino];
  const result = await conn.query(text, values);

  return result.rows;
}


export async function getFamiliares(accion, termino) {
  var text = "";

  if (accion == 1) {
    text = `SELECT 
    csctbfamilia.csctbfamiliaid,
    csctbfamilia.nom_fam, 
    csctbfamilia.ape_fam, 
    csctbfamilia.genero, 
    csctbfamilia.anios, 
    csctbparentesco.nom_parentesco, 
    csctbfamilia.id_jefe_hogar,
    csctbfamilia.cedula_fam,
    csctbfamilia.estado_civil,
    csctbfamilia.anios,
    csctbfamilia.fallecido,
    csctbfamilia.informante,
    csctbfamilia.nucleo_familiar,
    csctbfamilia.fecha_union


  FROM 
    public.csctbfamilia, 
    public.csctbparentesco

  WHERE 
    csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
    csctbfamilia.id_jefe_hogar = (
	SELECT 
      csctbfamilia.id_jefe_hogar
    FROM 
    
      public.csctbfamilia,
      public.csctbficha

    WHERE 
	csctbfamilia.csctbfamiliaid = csctbficha.csctbfamiliaid and

    csctbficha.csctbfamiliaid = $1 LIMIT 1  
	)
  ORDER BY csctbfamiliaid ASC;
      
  `;

    const result = await conn.query(text, [parseInt(termino)]);
    return result.rows;
  } else if (accion == 2) {
    text = `	
    SELECT 
      csctbfamilia.csctbfamiliaid,
      csctbfamilia.nom_fam, 
      csctbfamilia.ape_fam, 
      csctbfamilia.genero, 
      csctbfamilia.anios, 
      csctbparentesco.nom_parentesco, 
      csctbfamilia.id_jefe_hogar,
      csctbfamilia.cedula_fam,
    csctbfamilia.fallecido
    FROM 
    
      public.csctbfamilia, 
      public.csctbparentesco
    WHERE 
      csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
      csctbfamilia.id_jefe_hogar = (
    SELECT 
      csctbfamilia.id_jefe_hogar
    FROM 
      public.csctbfamilia, 
      public.csctbparentesco
    WHERE 
      csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
      (LOWER(csctbfamilia.nom_fam) LIKE '%' || LOWER($1) || '%' OR 
      LOWER(csctbfamilia.ape_fam) LIKE '%' || LOWER($1) || '%')
      ORDER BY ape_fam ASC LIMIT 1 ) `;
    const result = await conn.query(text, [termino]);
    return result.rows;
  } else {
    text = ` SELECT 
    csctbfamilia.csctbfamiliaid,
    csctbfamilia.nom_fam, 
    csctbfamilia.ape_fam, 
    csctbfamilia.genero, 
    csctbfamilia.anios, 
    csctbparentesco.nom_parentesco, 
    csctbfamilia.id_jefe_hogar,
    csctbfamilia.cedula_fam,
    csctbfamilia.fallecido
  FROM 
  
    public.csctbfamilia, 
    public.csctbparentesco
  WHERE 
    csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid AND
    csctbfamilia.id_jefe_hogar = (
  SELECT 
    csctbfamilia.id_jefe_hogar
  FROM 
    public.csctbfamilia, 
    public.csctbparentesco
  WHERE 
    
    csctbfamilia.cedula_fam = $1 LIMIT 1  )
  `;
    const result = await conn.query(text, [termino]);
    return result.rows;
  }
}

export async function getFamiliaById(id) {
  const result = await conn.query(
    `SELECT 
    csctbfamilia.cedula_fam, 
    csctbfamilia.nom_fam, 
    csctbfamilia.ape_fam, 
    csctbfamilia.genero, 
    csctbparentesco.csctbparentescoid, 
    csctbparentesco.nom_parentesco,
    csctbfamilia.fecha_na_fam, 
    csctbfamilia.anios, 
    csctbfamilia.meses, 
    csctbfamilia.dias, 
    csctbfamilia.csctbfamiliaid, 
    csctbfamilia.estado_civil,
    csctbfamilia.fallecido,
    csctbfamilia.informante,
    csctbfamilia.nucleo_familiar,
    csctbfamilia.fecha_union
  FROM 
    public.csctbfamilia
    LEFT JOIN public.csctbparentesco ON csctbparentesco.csctbparentescoid = csctbfamilia.csctbparentescoid
  WHERE 
    csctbfamilia.csctbfamiliaid = $1
  order by csctbfamiliaid asc;
  `,
    [id]
  );
  return result.rows;
}

export async function getFamiliaVacunaById(id) {
  const result =
    await conn.query(`SELECT csctbvacunafamiliaid, csctbvacunasid, csctbfamiliaid
	FROM public.csctbvacunafamilia WHERE csctbfamiliaid = ${id};`);
  return result.rows;
}

export async function getFamiliaEnfermedadById(id) {
  const result = await conn.query(
    `SELECT 
csctbenferfam.csctbenfermeriesgoid,
csctbenfermedad.nom_enfermedad, 
csctbenfermedad.csctbenfermedadid,
csctbenfermedad.cog_enfermedad
FROM 
public.csctbenferfam, 
public.csctbenfermedad, 
public.csctbfamilia
WHERE 
csctbenferfam.csctbfamiliaid = csctbfamilia.csctbfamiliaid AND
csctbenferfam.csctbenfermedadid = csctbenfermedad.csctbenfermedadid and 
csctbenferfam.csctbfamiliaid = $1;`,
    [id]
  );
  return result.rows;
}



//Obtiene el id si esta embarazada
export async function getFamiliarEmbarazada(id) {

  const result = await conn.query(
    `SELECT  csctbfamiliaid, n_abortos_espontaneos
      FROM public.csctbembarazadas WHERE csctbfamiliaid= $1 LIMIT 1;
  `,
    [id]
  );
  return result.rows;
}


export async function getAbortoById(id) {
  const result = await conn.query(
    `SELECT 
  csctbembarazadas.csctbembarazadasid, 
  csctbembarazadas.n_abortos_espontaneos, 
  csctbembarazadas.n_abortos_inducidos,
  csctbembarazadas.csctbfamiliaid
FROM 
  public.csctbembarazadas, 
  public.csctbfamilia
WHERE 
  csctbembarazadas.csctbfamiliaid = csctbfamilia.csctbfamiliaid and
  csctbfamilia.csctbfamiliaid = $1 LIMIT 1;
`,
    [id]
  );
  return result.rows;
}

export async function getDiagnosticoFamiliar(id_familia) {
  const result = await conn.query(
    `SELECT csctbdiagnosticoid, tipo_familia,
     ciclo_vital, primer_hijo,
      hijo_edad_preescolar,
       hijo_edad_escolar,
        hijo_edad_adolescente,
         hijo_edad_adulta,
          apgar_familiar,
          id_jefe_hogar,
           observacion
    FROM csctbdiagnosticofamiliar
    WHERE id_jefe_hogar = $1;`,
    [id_familia]
  );
  return result.rows;
}

//? FUNCIONES PARA EDITAR DE INFORMACION

export async function updateFamiliaById(formData, id) {
  try {
    const text = `UPDATE public.csctbfamilia
    SET 
      csctbparentescoid = $1, 
      cedula_fam = $2, 
      nom_fam = $3, 
      ape_fam = $4, 
      fecha_na_fam = $5,
      anios = $6, 
      meses = $7, 
      dias = $8,
      genero = $9, 
      estado_fam = $10, 
      fecreacion_fam = current_timestamp,
      estado_civil = $11,
      fallecido = $12,
      informante = $13,
      nucleo_familiar = $14,
      fecha_union = $15
    WHERE csctbfamiliaid = ${id}`;

    const values = [
      formData.parentesco,
      formData.cedula,
      formData.nombres,
      formData.apellidos,
      formData.fechaNacimiento,
      formData.anios,
      formData.meses,
      formData.dias,
      formData.genero,
      true,
      formData.estadoCivil,
      formData.fallecido,
      formData.informante,
      formData.nucleoFamiliar,
      formData.fechaUnion,
    ];
    const res = await conn.query(text, values);

    return res.rows;
  } catch (error) {
    console.log(error);
    return { error: "no se actualizaron los datos" };
  }
}

export async function updateVacunas(
  accion,
  id_vacuna,
  id_familia,
  id_vacunaFamilia
) {
  try {
    if (accion) {
      const result = await conn.query(
        `INSERT INTO public.csctbvacunafamilia
      (csctbvacunasid, csctbfamiliaid, fecha_cre_vacuna)VALUES($1,$2,current_timestamp)
      `,
        [id_vacuna, id_familia]
      );
      return result.rows;
    } else {
      const result = await conn.query(
        `DELETE FROM public.csctbvacunafamilia
      WHERE csctbvacunafamiliaid = $1
      `,
        [id_vacunaFamilia]
      );
      return result.rows;
    }
  } catch (error) {
    console.log(error);
    return { error: "no se actualizaron sus datos" };
  }
}

export async function updateEnfermdad({
  accion,
  id_enfermedad,
  id_familia,
  id_enfermedadFamilia,
}) {
  try {
    if (accion) {
      const result = await conn.query(
        `INSERT INTO public.csctbenferfam(
           csctbenfermedadid, csctbfamiliaid)
          VALUES ($1, $2);
      `,
        [id_enfermedad, id_familia]
      );
      return result.rows;
    } else {
      const result = await conn.query(
        `DELETE FROM public.csctbenferfam
        WHERE  csctbenfermeriesgoid = $1
      `,
        [id_enfermedadFamilia]
      );
      return result.rows;
    }
  } catch (error) {
    console.log(error);
    return { error: "no se actualizaron sus datos" };
  }
}

export async function updateFamiliaEmbarazadaById(formData, id_familia) {
  try {
    const result = await conn.query(
      `UPDATE public.csctbembarazadas
    SET 
      fecha_menstruacion=$1,
      fecha_parto=$2,
      control_menos20=$3,
        control_mas20=$4,
        ante_patologicos=$5, 
        semanas_gestacion=$6, 
        gestas=$7, 
        partos=$8, 
        n_abortos_espontaneos=$9,
        cesarias=$10,
        n_abortos_inducidos=$11
    WHERE csctbfamiliaid = $12;`,
      [
        formData.fechaUltimaMenstruacion,
        formData.fechaProbableDeParto,
        formData.controlMenos20,
        formData.controlMas20,
        formData.antecedentesPatologicos,
        formData.semanasGestacion,
        formData.gestas,
        formData.partos,
        formData.abortosEspontaneos,
        formData.cesarias,
        formData.abortosInducidos,
        id_familia,
      ]
    );
    return result.rows;
  } catch (error) {
    console.log(error);
    return { error: "no se han podido actualizar tus datos" };
  }
}

export async function updateAbortoById(formData, id_familia) {
  try {
    const result = await conn.query(
      `UPDATE public.csctbembarazadas
    SET 
        n_abortos_espontaneos=$1,
        n_abortos_inducidos=$2
    WHERE csctbfamiliaid = $3;`,
      [
        formData.abortosEspontaneos,
        formData.abortosInducidos,
        id_familia,
      ]
    );
    return result.rows;
  } catch (error) {
    console.log(error);
    return { error: "no se han podido actualizar tus datos" };
  }
}

export async function updateDiagnosticoFamiliar(data, id_familia) {
  try {
    const result = await conn.query(
      `UPDATE public.csctbdiagnosticofamiliar
      SET  
      tipo_familia=$1, 
      ciclo_vital=$2,
       primer_hijo=$3, 
      hijo_edad_preescolar=$4, 
      hijo_edad_escolar=$5, 
      hijo_edad_adolescente=$6, 
      hijo_edad_adulta=$7, 
      apgar_familiar=$8,
      observacion = $9
      WHERE id_jefe_hogar = $10;`,
      [
        data.tipoFamilia,
        data.cicloVital,
        data.primerHijo,
        data.hijoEdadPreescolar,
        data.hijoEdadEscolar,
        data.hijoEdadAdolescente,
        data.hijoEdadAdulta,
        data.apgarFamiliar,
        data.observacion,

        id_familia,
      ]
    );

    return result.rows;
  } catch (error) {
    console.log(error);
    return { error: "No se podido ingresar tu datos" };
  }
}






