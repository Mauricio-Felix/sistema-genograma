import {
  getAbortoById,
  saveAborto
} from "@/app/action";
import Embarazada from "./embarazada";

async function IndexEmbarazada({ data, id_familia }) {

  const [embarazadaById] = await getAbortoById(id_familia);
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
