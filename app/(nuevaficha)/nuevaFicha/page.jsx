"use client";
import Nav from "@/app/components/nav";
import Modal from "@/app/components/modal";
import { useRouter } from "next/navigation";
import { useSession } from "next-auth/react";
import ModalGenerico from "@/app/components/modal/modalGenerico";
import { useState } from "react";

function NuevaFamilia() {
  const { data: session, update } = useSession();

  const router = useRouter();
  const handlePusAgregarPersona = () => {
    router.push("/nuevaFicha/agregarPersona");
  };

  const [modalShow, setModalShow] = useState(false);

  return (
    <div className="w-100 vh-100 d-flex flex-column">
      <Nav></Nav>
      <div
        style={{ height: "90vh" }}
        className=" d-flex justify-content-center align-items-center"
      >
        <div
          style={{ height: "30%", margin: "20px" }}
          className="card text-center"
        >
          <Modal tittle="Para construir de forma correcta un familiograma, se empieza agregando al padre, luego se añade a la madre y 
          los hijos. Si el hijo tiene pareja, se agrega a la esposa como nuera y los hijos como nietos.">
            <div className="d-flex w-50 justify-content-around align-items-center">
              <button
                data-bs-dismiss="modal"
                type="button"
                onClick={handlePusAgregarPersona}
                className="btn btn-primary"
              >
                Entendido
              </button>
            </div>
          </Modal>
          <ModalGenerico
            show={modalShow}
            tittle={
              "¿Esta seguro que no va a ingresar mas familiares a su ficha actual?"
            }
          >
            <div className=" h-25 d-flex justify-content-between mt-2 align-items-center">
              <button
                onClick={() => setModalShow(false)}
                className="btn btn-danger"
              >
                Cancelar
              </button>
              <button
                onClick={() => {
                  setModalShow(false);
                  update({ email: null });
                  router.refresh();
                }}
                className="btn btn-primary mx-2"
              >
                Aceptar
              </button>
            </div>
          </ModalGenerico>
          <div className="card-body d-flex flex-column justify-content-between align-items-center">
            <h3 className="card-title mb-1">Opciones: </h3>
            <button
              type="button"
              className="btn btn-primary "
              data-bs-toggle="modal"
              data-bs-target="#modal-warning"
            >
              Agregar Personas
            </button>
            {session?.user?.email && (
              <button
                type="button"
                onClick={() => setModalShow(true)}
                className="btn btn-warning mt-2"
              >
                Empezar con una nueva familia
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

export default NuevaFamilia;
