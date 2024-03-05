"use client";
import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { useRouter, useParams } from "next/navigation";
import ModalFinalizar from "@/app/components/modal/modalFinalizar";
import {
  updateAbortoById,

} from "@/app/action";

export default function Embarazada({
  embarazadaById,
  data,
}) {
  const { params } = useParams();
  const [modalShowFinalizar, setModalShowFinalizar] = useState(false);
  const router = useRouter();
  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
  } = useForm();

  useEffect(() => {
    router.refresh();
  }, [embarazadaById.n_abortos_espontaneos]);

  const onSubmit = handleSubmit(async (data) => {
    const result = await updateAbortoById(data, embarazadaById.csctbfamiliaid);

    if (result.error) {
      console.log(result.error);
    } else {
      router.refresh();
      const tabs = document.querySelectorAll(".nav-link");
      const content = document.querySelectorAll(".tab-pane");

      setModalShowFinalizar(true);
    }
  });
  return (
    <form onSubmit={onSubmit}>
      <ModalFinalizar
        show={modalShowFinalizar}
        tittle={`A Finalizado la Actualizacion de: ${data.nombre} como ${data.parentesco}`}
      >
        <div className=" h-25 d-flex justify-content-between mt-2 align-items-center">
          <button
            onClick={() => {
              setModalShowFinalizar(false);
              router.push("/buscarFicha/");
            }}
            className="btn btn-primary mx-2"
          >
            Continuar
          </button>
        </div>
      </ModalFinalizar>
     
      <div className="row my-2">
        <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
          {" "}
          <label className="form-label">N abortos Inducidos </label>
          <input
            {...register("abortosInducidos", {
              required: {
                value: true,
                message: "Ingrese",
              },
              value: embarazadaById.n_abortos_inducidos,
              maxLength: 10,
            })}
            type="number"
            className="form-control"
          />
        </div>
        <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
          <label className="form-label">N abortos Espontaneo </label>
          <input
            {...register("abortosEspontaneos", {
              required: {
                value: true,
                message: "Ingrese",
              },
              value: embarazadaById.n_abortos_espontaneos,
              maxLength: 10,
            })}
            type="number"
            className="form-control"
          />
        </div>
      </div>
      <div className=" h-25 d-flex justify-content-between mt-2 align-items-center">
        <button
          onClick={() => router.push("/buscarFicha")}
          type="button"
          className="btn btn-danger"
        >
          Cerrar
        </button>
        <button type="submit" className="btn btn-primary">
          Actualizar y finalizar
        </button>
      </div>
    </form>
  );
}
