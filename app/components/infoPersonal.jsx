"use client";
import { useEffect } from "react";
import { useForm } from "react-hook-form";
import { useSession } from "next-auth/react";
import { useRouter } from "next/navigation";
import { saveDiagnosticoFamiliar } from "../action";

export default function InfoPersonal(props) {
  const { data: session, update } = useSession();
  const { refresh } = useRouter();

  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors },
  } = useForm();

  const { parentescos, saveFamilia } = props;

  const onSubmit = handleSubmit(async (data) => {
    const resul = await saveFamilia(data, session.user.email?.id);

    if (resul.error) {
      console.log(resul.error);
    } else {
      const { anios, meses, dias } = data;
      if (session.user.email?.id == null) {
        update({
          email: {
            anios,
            meses,
            dias,
            id: resul[0].csctbfamiliaid,
            id_familia: resul[0].csctbfamiliaid,
            genero: watch("genero"),
            parentesco: parentescos.find(
              (item) => item.csctbparentescoid === resul[0].csctbparentescoid
            ).nom_parentesco,
            nombre: resul[0].nom_fam + " " + resul[0].ape_fam,
            embarazada: watch("embarazada"),
          },
        });
        console.log(resul[0].csctbfamiliaid);
        const insert = await saveDiagnosticoFamiliar(resul[0].csctbfamiliaid);
        insert?.error ? console.log(insert.error) : null;
      } else {
        update({
          email: {
            anios,
            meses,
            dias,
            id: session.user.email.id,
            id_familia: resul[0].csctbfamiliaid,
            genero: watch("genero"),
            parentesco: parentescos.find(
              (item) => item.csctbparentescoid === resul[0].csctbparentescoid
            ).nom_parentesco,
            nombre: resul[0].nom_fam + " " + resul[0].ape_fam,
            embarazada: watch("embarazada"),
          },
        });
      }

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

  useEffect(() => {
    controlEmbarazada(watch("embarazada"));
  }, [watch("embarazada")]);

  const controlEmbarazada = (control) => {
    const embarazadaTab = document.getElementById("pills-embarazada-tab");

    document.querySelectorAll(".nav-link").forEach(function (tab, index) {
      tab.addEventListener("shown.bs.tab", function (event) {
        // Obtener el id del tab activo
        var activeTabIndex = index;
        console.log("Estás en la pestaña con índice:", activeTabIndex);
      });
    });
    if (control == "true") {
      //embarazadaTab.classList.remove('active', "show");;
      embarazadaTab.style.display = "";
    } else {
      embarazadaTab.style.display = "none";
    }
  };

  return (
    <div className="container-fluid">
      <div className="d-flex justify-content-center">
        <p className="fw-bold fs-4">Informacion Personal</p>
      </div>
      <form onSubmit={onSubmit}>
        <div className="row mb-3">
          <div className="col">
            <label className="form-label">
              <h5>Nombres</h5>
            </label>

            <input
              {...register("nombres", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio",
                },
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
            <label className="form-label">
              <h5>Apellidos</h5>
            </label>
            <input
              {...register("apellidos", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
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
            <label className="form-label">
              <h5>Cédula</h5>
            </label>
            <input
              {...register("cedula", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                maxLength: 10,
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
                <label className="form-label">
                  <h5>Fecha de Nacimiento</h5>
                </label>
                <input
                  {...register("fechaNacimiento", {
                    required: {
                      value: true,
                      message: "Este campo es obligatorio.",
                    },
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
                  <label className="form-label">
                    <h5>Años</h5>
                  </label>
                  <input
                    {...register("anios", {})}
                    disabled
                    className="form-control form-control"
                    type="text"
                  />
                </div>

                <div className="mx-1">
                  <label className="form-label">
                    <h5>meses</h5>
                  </label>
                  <input
                    {...register("meses", {})}
                    disabled
                    className="form-control form-control"
                    type="text"
                  />
                </div>
                <div className="">
                  <label className="form-label">
                    <h5>Dias</h5>
                  </label>
                  <input
                    {...register("dias", {})}
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

        <div className="row mb-3">
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <label className="form-label">
              <h5>Género</h5>
            </label>
            <select
              {...register("genero", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
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
                  <h5>Esta Embarazada</h5>
                </label>
                <div id="embarazada">
                  <div className="form-check form-check-inline">
                    <input
                      {...register("embarazada")}
                      className="form-check-input"
                      type="radio"
                      value="true"
                    />
                    <label className="form-check-label">Si</label>
                  </div>
                  <div className="form-check form-check-inline">
                    <input
                      {...register("embarazada")}
                      className="form-check-input"
                      type="radio"
                      value="false"
                    />
                    <label className="form-check-label">No</label>
                  </div>
                </div>
              </>
            ) : null}
          </div>

          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <label className="form-label">
              <h5>Parentesco</h5>
            </label>
            <select
              {...register("parentesco", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
                validate: (value) => value !== "",
              })}
              className="form-select"
              aria-label="Default select example"
            >
              <option value="">Seleccione la opcion</option>
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
            <label className="form-label">
              <h5>Estado Civil</h5>
            </label>
            <select
              {...register("estadoCivil", {
                required: {
                  value: true,
                  message: "Este campo es obligatorio.",
                },
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

        <div className="row mb-3">
          <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
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
                    validate: (value) => {
                      if (value === "") {
                        return true;
                      }
                      const fechaNacimiento = new Date(value);
                      const fechaActual = new Date();
                      if (fechaNacimiento > fechaActual) {
                        return false;
                      }
                      return true;
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
          {/* <div className="col-sm-12 col-md-6 col-lg-4 col-xl-3">
            <div className="d-flex justify-content-between">
              <div className="w-50" style={{ marginRight: "3px" }}>
                <label className="form-label">
                  <h5>Fecha de Union</h5>
                </label>
                <input
                  {...register("fechaUnion", {
                    required: {
                      value: true,
                      message: "Este campo es obligatorio.",
                    },
                    validate: (value) => {

                      if (value == "") {
                        console.log(value);
                        return true;
                      }

                      const fechaNacimiento = new Date(value);
                      const fechaActual = new Date();

                      // Verificar si la fecha de nacimiento es en el futuro
                      if (fechaNacimiento > fechaActual) {
                        return false;
                      }

                      // Resto de la lógica de validación aquí (si es necesario)
                      //console.log(value)
                      return true; // Si la fecha de nacimiento es válida
                    },
                  })}
                  type="date"
                  className="form-control"
                />
              </div>
            </div>
          </div> */}

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
                  value="true"
                />
                <label className="form-check-label">Si</label>
              </div>
              <div className="form-check form-check-inline">
                <input
                  {...register("fallecido")}
                  className="form-check-input"
                  type="radio"
                  value="false"
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
                />
                <label className="form-check-label">Si</label>
              </div>
              <div className="form-check form-check-inline">
                <input
                  {...register("informante")}
                  className="form-check-input"
                  type="radio"
                  value="false"
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
                />
                <label className="form-check-label">Si</label>
              </div>
              <div className="form-check form-check-inline">
                <input
                  {...register("nucleoFamiliar")}
                  className="form-check-input"
                  type="radio"
                  value="false"
                />
                <label className="form-check-label">No</label>
              </div>
            </div>
          </div>
        </div>

        {props.children}
      </form>
    </div>
  );
}
