"use client";
import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { updateFamiliaById, updateFamiliaEmbarazadaById } from "@/app/action";
import { useParams, usePathname, useRouter } from "next/navigation";

export default function InfoPersonal(props) {
  const { refresh, push } = useRouter();
  const params = useParams();
  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
  } = useForm();
  const { parentescos, datosFamiliar, data } = props;

  const [isembarazada, setisembarazada] = useState(data.embarazo);
  const onSubmit = handleSubmit(async (data) => {
    const resul = await updateFamiliaById(data, params.id);
    // console.log(resul);
    if (resul.error) {
      console.log(resul.error);
    } else {
      //refresh();
      const tabs = document.querySelectorAll(".nav-link");
      const content = document.querySelectorAll(".tab-pane");

      var indexTab = 0;
      const activeTabIndex = tabs.forEach((tab, index) => {
        if (tab.classList.contains("active")) {
          indexTab = index;
        }
      });

      tabs[indexTab].classList.remove("active");
      tabs[indexTab + 1].classList.add("active");
      content[indexTab].classList.remove("active", "show");
      content[indexTab + 1].classList.add("active", "show");
    }
  });

  const embarazoNull = async () => {
    if (watch("genero") == "FEMENINO") {
      await updateFamiliaEmbarazadaById(
        {
          fechaUltimaMenstruacion: null,
          fechaUltimaMenstruacion: null,
          fechaProbableDeParto: null,
          controlMenos20: null,
          controlMas20: null,
          antecedentesPatologicos: null,
          semanasGestacion: null,
          gestas: null,
          partos: null,
          abortosEspontaneos: null,
          cesarias: null,
          abortosInducidos: null,
        },
        params.id
      );
    }
  };

  useEffect(() => {
    //setValue("embarazada", "true");
    if (watch("embarazada") == undefined) {
      controlEmbarazada(isembarazada);
    } else {
      controlEmbarazada(watch("embarazada"));
    }
    //console.log(watch("embarazada"))

    if (watch("embarazada") == "false") {
      // console.log("nada")
      embarazoNull().then(() => {
        //console.log("listo")
        refresh();
      });
    }
  }, [watch("embarazada"), isembarazada]);

  const controlEmbarazada = (control) => {
    const embarazadaTab = document.getElementById("pills-embarazada-tab");
    //console.log("yaaaaaaaa")
    document.querySelectorAll(".nav-link").forEach(function (tab, index) {
      tab.addEventListener("shown.bs.tab", function (event) {
        // Obtener el id del tab activo
        var activeTabIndex = index;
        //console.log("Estás en la pestaña con índice:", activeTabIndex);
      });
    });
    //console.log(control)
    if (control == true || control == "true") {
      //console.log("ya");
      //console.log(embarazadaTab)
      //embarazadaTab.classList.remove('active', "show");;
      embarazadaTab.style.display = "";
    } else {
      embarazadaTab.style.display = "none";

      // embarazoNull();
    }
  };

  return (
    <div className="container-fluid">
      <div className="d-flex justify-content-center">
        <p className="fw-bold fs-4">
          Información Personal:{" "}
          {datosFamiliar.nom_fam + " " + datosFamiliar.ape_fam}
        </p>
      </div>
      <form onSubmit={onSubmit}>
        <div className="row">
          <div className="col">
            <label className="form-label"><h5>Nombres</h5></label>

            <input
              {...register("nombres", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio",
                },
                value: datosFamiliar.nom_fam,
              })}
              type="text"
              className="form-control"
            />
            {errors.nombres && (
              <p class="text-danger">{errors.nombres.message}</p>
            )}
          </div>
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            {" "}
            <label className="form-label"><h5>Apellidos</h5></label>
            <input
              {...register("apellidos", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                value: datosFamiliar.ape_fam,
              })}
              type="text"
              className="form-control"
            />
            {errors.apellidos && (
              <p class="text-danger">{errors.apellidos.message}</p>
            )}
          </div>
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            {" "}
            <label className="form-label"><h5>Cédula</h5></label>
            <input
              {...register("cedula", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                maxLength: 10,
                value: datosFamiliar.cedula_fam,
              })}
              type="number"
              className="form-control"
            />
            {errors.cedula && (
              <p class="text-danger">{errors.cedula.message}</p>
            )}
          </div>
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <div className="d-flex justify-content-between">
              <div className="w-50" style={{ marginRight: "3px" }}>
                <label className="form-label"><h5>Fecha de Nacimiento</h5></label>
                <input
                  {...register("fechaNacimiento", {
                    required: {
                      value: true,
                      message: "Este campo es obligatorio.",
                    },
                    value: new Date(datosFamiliar.fecha_na_fam)
                      .toISOString()
                      .split("T")[0],
                    validate: (value) => {
                      const fechaNacimiento = new Date(value);
                      const fechaActual = new Date();
                      // Verificar si la fecha de nacimiento es en el futuro
                      if (fechaNacimiento > fechaActual) {
                        return false;
                      }

                      // Resto de la lógica de validación aquí (si es necesario)

                      return true; // Si la fecha de nacimiento es válida
                    },
                    onChange: () => {
                      var fechaNacimientoStr = watch("fechaNacimiento");
                      var fechaNacimiento = new Date(fechaNacimientoStr);

                      var fechaActual = new Date();
                      var diferenciaTiempo =
                        fechaActual.getFullYear() -
                        fechaNacimiento.getFullYear();
                      var meses = fechaNacimiento.getMonth();
                      var dias = fechaNacimiento.getDate();
                      var anos = diferenciaTiempo;
                      setValue("anios", anos);
                      setValue("meses", meses);
                      setValue("dias", dias);
                    },
                  })}
                  type="date"
                  className="form-control"
                />
              </div>
              <div className="d-flex w-50 justify-content-around align-items-end">
                <div className="">
                  <label className="form-label"><h5>Años</h5></label>
                  <input
                    {...register("anios", {
                      value: datosFamiliar.anios,
                    })}
                    disabled
                    className="form-control form-control"
                    type="text"
                  />
                </div>

                <div className="mx-1">
                  <label className="form-label"><h5>Meses</h5></label>
                  <input
                    {...register("meses", { value: datosFamiliar.meses })}
                    disabled
                    className="form-control form-control"
                    type="text"
                  />
                </div>
                <div className="">
                  <label className="form-label"><h5>Días</h5></label>
                  <input
                    {...register("dias", { value: datosFamiliar.dias })}
                    disabled
                    className="form-control form-control"
                    type="text"
                  />
                </div>
              </div>
            </div>
            {errors.fechaNacimiento && (
              <p class="text-danger">{errors.fechaNacimiento.message}</p>
            )}
          </div>
        </div>

        <div className="row mt-2">
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <label className="form-label"><h5>Género</h5></label>
            <select
              {...register("genero", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                value: datosFamiliar.genero,
                validate: (value) => value !== "",
              })}
              className="form-select"
              aria-label="Default select example"
            >
              <option value="">Seleccione la opcion</option>
              <option value="MASCULINO">Masculino</option>
              <option value="FEMENINO">Femenino</option>
            </select>
            {errors.genero && (
              <p class="text-danger">{errors.genero.message}</p>
            )}
          </div>

          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            {watch("genero") == "FEMENINO" ? (
              <>
                <label id="embarazada" className="form-label">
                  <h5>Está embarazada</h5>
                </label>
                <div id="embarazada">
                  <div className="form-check form-check-inline">
                    <input
                      {...register("embarazada", {
                        onChange: (e) => {
                          setValue("embarazada", e.target.value);
                          setisembarazada(e.target.value == "true");
                        },
                      })}
                      className="form-check-input"
                      type="radio"
                      value="true"
                      checked={isembarazada == true}
                    />
                    <label className="form-check-label">Si</label>
                  </div>
                  <div className="form-check form-check-inline">
                    <input
                      {...register("embarazada", {
                        onChange: (e) => {
                          setValue("embarazada", e.target.value);

                          setisembarazada(e.target.value == "true");
                        },
                      })}
                      className="form-check-input"
                      type="radio"
                      value="false"
                      checked={isembarazada == false}
                    />
                    <label className="form-check-label">No</label>
                  </div>
                </div>
              </>
            ) : null}
          </div>

          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <label className="form-label"><h5>Parentesco</h5></label>
            <select
              {...register("parentesco", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                value: datosFamiliar.csctbparentescoid,

                validate: (value) => value !== "",
              })}
              className="form-select"
              aria-label="Default select example"
            >
              <option value="">Seleccione la opción</option>
              {parentescos.map((parentesco) => (
                <option
                  key={parentesco.csctbparentescoid}
                  value={parentesco.csctbparentescoid}
                >
                  {parentesco.nom_parentesco}
                </option>
              ))}
            </select>
            {errors.parentesco && (
              <p class="text-danger">{errors.parentesco.message}</p>
            )}
          </div>

          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <label className="form-label"><h5>Estado Civil</h5></label>
            <select
              {...register("estadoCivil", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                value: datosFamiliar.estado_civil,

                validate: (value) => value !== "",
              })}
              className="form-select"
              aria-label="Default select example"
            >
              <option value="">Seleccione la opcion</option>
              <option value="CASADO/A">Casado/a</option>
              <option value="UNION LIBRE SEPARADADOS">
                {" "}
                Union Libre Separados
              </option>
              <option value={"UNIÓN LIBRE"}>Union Libre</option>
              <option value={"SEPARACIÓN"}>Separado/a</option>
              <option value={"DIVORCIO"}>Divorciado/a</option>
              <option value={"UNIÓN CONSANGUÍNEA"}>Union Consaguinea</option>
              <option value={"SOLTERO/A"}>Soltero/a</option>
            </select>
            {errors.estadoCivil && (
              <p class="text-danger">{errors.estadoCivil.message}</p>
            )}
          </div>
        </div>

        <div className="row mt-2">
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <div className="d-flex justify-content-between">
              <div className="w-50" style={{ marginRight: "3px" }}>
                {watch("estadoCivil") !== "SOLTERO/A" ? (
                  <>
                    <label className="form-label">
                      <h5>Fecha de Union</h5>
                    </label>

                    <input
                      {...register("fechaUnion", {
                        required: {
                          value: true,
                          message: "Este campo es obligatorio",
                        },
                        value: new Date(datosFamiliar.fecha_union)
                          .toISOString()
                          .split("T")[0],
                        validate: (value) => {
                          console.log(value);
                          if (value == "") {
                            return true;
                          }
                          const fechaNacimiento = new Date(value);
                          const fechaActual = new Date();

                          // Verificar si la fecha de nacimiento es en el futuro
                          if (fechaNacimiento > fechaActual) {
                            return false;
                          }

                          // Resto de la lógica de validación aquí (si es necesario)

                          return true; // Si la fecha de nacimiento es válida
                        },
                      })}
                      type="date"
                      className="form-control"
                    />
                    {errors.fechaUnion && (
                      <p className="text-danger">{errors.fechaUnion.message}</p>
                    )}
                  </>
                ) : null}
              </div>
            </div>
          </div>

          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            {" "}
            <label className="form-label">
              <h5>Fallecido</h5>
            </label>
            <div>
              <div className="form-check form-check-inline">
                <input
                  {...register("fallecido", {})}
                  className="form-check-input"
                  type="radio"
                  value={true}
                  defaultChecked={datosFamiliar.fallecido == true}
                />
                <label className="form-check-label">Si</label>
              </div>

              <div className="form-check form-check-inline">
                <input
                  {...register("fallecido", {})}
                  className="form-check-input"
                  type="radio"
                  value={false}
                  defaultChecked={datosFamiliar.fallecido == false}
                />
                <label className="form-check-label">No</label>
              </div>
            </div>
          </div>
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            {" "}
            <label className="form-label">
              <h5>Informante</h5>
            </label>
            <div>
              <div className="form-check form-check-inline">
                <input
                  {...register("informante", {})}
                  className="form-check-input"
                  type="radio"
                  value="true"
                  defaultChecked={datosFamiliar.informante == true}
                />
                <label className="form-check-label">Si</label>
              </div>
              <div className="form-check form-check-inline">
                <input
                  {...register("informante")}
                  className="form-check-input"
                  type="radio"
                  value="false"
                  defaultChecked={datosFamiliar.informante == false}
                />
                <label className="form-check-label">No</label>
              </div>
            </div>
          </div>
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            {" "}
            <label className="form-label">
              <h5>Pertenece al nucleo familiar</h5>
            </label>
            <div>
              <div className="form-check form-check-inline">
                <input
                  {...register("nucleoFamiliar", {})}
                  className="form-check-input"
                  type="radio"
                  value="true"
                  defaultChecked={datosFamiliar.nucleo_familiar == true}
                />
                <label className="form-check-label">Si</label>
              </div>
              <div className="form-check form-check-inline">
                <input
                  {...register("nucleoFamiliar")}
                  className="form-check-input"
                  type="radio"
                  value="false"
                  defaultChecked={datosFamiliar.nucleo_familiar == false}
                />
                <label className="form-check-label">No</label>
              </div>
            </div>
          </div>
        </div>

        <div className=" h-25 d-flex justify-content-between mt-2 align-items-center">
          <button
            type="button"
            onClick={() => push("/buscarFicha/")}
            className="btn btn-danger"
          >
            Cerrar
          </button>
          <button type="submit" className="btn btn-primary">
            Actualizar y continuar
          </button>
        </div>
      </form>
    </div>
  );
}
