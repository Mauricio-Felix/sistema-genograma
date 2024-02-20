import { saveAborto } from "@/app/action";
import Embarazada from "./embarazada";

async function IndexEmbarazada({ params }) {
  return (
    <div className="container-fluid">
      <Embarazada saveAborto={saveAborto}></Embarazada>
    </div>
  );
}
export default IndexEmbarazada;
