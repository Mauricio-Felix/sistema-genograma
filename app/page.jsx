"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";
import Modal from "./components/modal";
import { signOut } from "next-auth/react";

export default function Home() {
  useEffect(() => {
    require("bootstrap/dist/js/bootstrap.bundle.min.js");
  }, []);
  const router = useRouter();

  const handleAgregarPersona = () => {
    router.push("/nuevaFicha");
    router.refresh();
  };
  const handleBuscarPersona = () => {
    router.push("/buscarFicha");
    router.refresh();
  };

  return (
    <div className="w-100 vh-100 d-flex flex-column">
      <nav className="navbar" style={{ backgroundColor: "#2d2d93" }}>
        <div className="w-100 d-flex h-100 mx-2 justify-content-between align-items-center">
          <a
            className="navbar-brand d-flex justify-content-between align-items-center"
            href="#"
          >
            <img
              src="./logomsp2.png"
              // src="./icon-192x192.png"
              alt="Logo"
              width="250"
              height="70"
              className="d-inline-block align-text-top"
            />
          </a>
          <button
            type="button"
            class="btn btn-outline-warning"
            onClick={() => signOut()}
          >
            Cerrar Sesión
          </button>
          {/* <div style={{ cursor: "pointer" }} onClick={() => signOut()}>
            Cerrar Sesión
          </div> */}
        </div>
      </nav>
      <div
        style={{ height: "90vh" }}
        className=" d-flex justify-content-center align-items-center"
      >
        <div
          style={{ height: "60%", margin: "20px" }}
          className="card text-center"
        >
          <Modal tittle="¿Desea crear una nueva familia?">
            <div className="d-flex w-50 justify-content-around align-items-center">
              <button
                data-bs-dismiss="modal"
                type="button"
                onClick={handleAgregarPersona}
                className="btn btn-primary"
              >
                Aceptar
              </button>
              <button
                type="button"
                className="btn btn-danger mx-2"
                data-bs-dismiss="modal"
              >
                Cancelar
              </button>
            </div>
          </Modal>
          <img
            style={{ width: "80%", height: "25%" }}
            src="./logomsp3.png"
            // src="./icon-192x192.png"
            className="m-auto"
            alt="..."
          />

          <div className="card-body d-flex flex-column justify-content-between align-items-center">
            <h3 className="card-title mb-1">Opciones Familiograma</h3>
            <button
              type="button"
              className="btn btn-primary "
              data-bs-toggle="modal"
              data-bs-target="#modal-warning"
            >
              Nueva Familia
            </button>
            <button
              onClick={handleBuscarPersona}
              type="button"
              className="btn btn-primary"
            >
              Buscar Familia
            </button>
            <button
              onClick={() => window.open('https://drive.google.com/file/d/1GywQNVmN5OLe2oSyxqddjPWBukk1vSaP/view', '_blank')}f
              type="button"
              className="btn btn-warning"
            >
              Ver video tutorial
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
