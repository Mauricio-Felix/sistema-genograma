"use client";
import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import ModalFinalizar from "../modal/modalFinalizar";
export default function Embarazada({ saveAborto }) {
  const { data: session } = useSession();
  const [modalShowFinalizar, setModalShowFinalizar] = useState(false);
  const router = useRouter();

  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
  } = useForm();

  const onSubmit = handleSubmit(async (data) => {
    const id_familia = session.user.email.id_familia;
    const result = await saveAborto(data, id_familia);
    if (result.error) {
      console.log(result.error);
    } else {
      const tabs = document.querySelectorAll(".nav-link");
      const content = document.querySelectorAll(".tab-pane");

      setModalShowFinalizar(true);
    }
  });
  return (
    <form onSubmit={onSubmit}>
      <ModalFinalizar
        show={modalShowFinalizar}
        tittle={`A Finalizado el registro de: ${session?.user?.email?.nombre} como ${session?.user?.email?.parentesco}`}
      >
        <div className=" h-25 d-flex justify-content-between mt-2 align-items-center">
          <button
            onClick={() => {
              setModalShowFinalizar(false);
              router.refresh();
              router.push("/buscarFicha/");
            }}
            className="btn btn-primary mx-2"
          >
            Aceptar
          </button>
        </div>
      </ModalFinalizar>
      <div className="row mb-3">
        <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
          {" "}
          <label className="form-label">
            <h5>N abortos Inducidos</h5>{" "}
          </label>
          <input
            {...register("abortosInducidos", {
              required: {
                value: true,
                message: "Ingrese",
              },
              maxLength: 2,
            })}
            type="number"
            className="form-control"
          />
        </div>
        <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
          <label className="form-label">
            <h5>N abortos espontaneos</h5>
          </label>
          <input
            {...register("abortosEspontaneos", {
              required: {
                value: true,
                message: "Ingrese",
              },
              maxLength: 2,
            })}
            type="number"
            className="form-control"
          />
        </div>
      </div>

      <div className=" h-25 d-flex justify-content-end mt-2 align-items-center">
        <button type="submit" className="btn btn-primary">
          Guardar y finalizar
        </button>
      </div>
    </form>
  );
}
