import {
  getFamiliaEmbarazadaById, //similar a getAbortoById
  // getRiesgosObstetricos,
  insertEmbarazadaAndRiesgoObstetricos, //similar a saveAborto
  // getFamiliaEmbarazadaRiesgoById,

  getAbortoById,
  saveAborto
} from "@/app/action";
import Embarazada from "./embarazada";

async function IndexEmbarazada({ data, id_familia }) {
  //console.log(data);
  // const result = await getVacunas(16);
  // const [embarazadaById] = await getFamiliaEmbarazadaById(id_familia);
  const [embarazadaById] = await getAbortoById(id_familia);
  //console.log(embarazadaById)

  // const riesgosEmbarazo = await  getFamiliaEmbarazadaRiesgoById(embarazadaById.csctbembarazadasid)
   
  return (
    <div className="container-fluid">
      <Embarazada
        data={data}
        saveAborto={saveAborto}
        embarazadaById={embarazadaById}
      ></Embarazada>
    </div>
  );
}
export default IndexEmbarazada;
