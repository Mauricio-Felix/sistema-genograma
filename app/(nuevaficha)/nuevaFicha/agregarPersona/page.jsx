import {
  getParentesco,
  saveFamilia
} from "@/app/action";

import IndexEmbarazada from "@/app/components/embarazada";
import InfoPersonal from "@/app/components/infoPersonal";
import Vacuna from "@/app/components/vacunas/vacuna";

export default async function AgregarPersona({ searchParams }) {
  const parentescos = await getParentesco();

  return (
    <>
      <div className="container-fluid vh-100 d-flex flex-column p-3">
        <ul className="nav nav-pills mb-3" id="pills-tab" role="tablist">
          <li className="nav-item" role="presentation">
            <button
              className="nav-link active"
              id="pills-home-tab"
              data-bs-toggle="pill"
              data-bs-target="#pills-home"
              type="button"
              role="tab"
              aria-controls="pills-home"
              aria-selected="true"
            >
              Información Personal
            </button>
          </li>
          <li className="nav-item" role="presentation">
            <button
              className="nav-link"
              id="pills-profile-tab"
              data-bs-toggle="pill"
              data-bs-target="#pills-profile"
              type="button"
              role="tab"
              aria-controls="pills-profile"
              aria-selected="false"
            >
              Vacunas
            </button>
          </li>

          <li className="nav-item" role="presentation">
            <button
              className="nav-link"
              id="pills-embarazada-tab"
              data-bs-toggle="pill"
              data-bs-target="#pills-embarazada"
              type="button"
              role="tab"
              aria-controls="pills-embarazada"
              aria-selected="false"
            >
              Embarazadas
            </button>
          </li>
        </ul>
        <div className="tab-content" id="pills-tabContent">
          <div
            className="tab-pane fade show active"
            id="pills-home"
            role="tabpanel"
            aria-labelledby="pills-home-tab"
            tabIndex="0"
          >
            <InfoPersonal parentescos={parentescos} saveFamilia={saveFamilia}>
              <div className=" h-25 d-flex justify-content-between mt-2 align-items-center">
                <button className="btn btn-danger">Cerrar</button>
                <button type="submit" className="btn btn-primary">
                  Continuar
                </button>
              </div>
            </InfoPersonal>
          </div>
          <div
            className="tab-pane fade"
            id="pills-profile"
            role="tabpanel"
            aria-labelledby="pills-profile-tab"
            tabIndex="0"
          >
            <Vacuna params={searchParams}></Vacuna>
          </div>
          <div
            className="tab-pane fade"
            id="pills-embarazada"
            role="tabpanel"
            aria-labelledby="pills-embarazada-tab"
            tabIndex="0"
          >
            <IndexEmbarazada></IndexEmbarazada>
          </div>
        </div>
      </div>
    </>
  );
}
