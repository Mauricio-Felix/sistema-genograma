"use client";
import { useForm } from "react-hook-form";
import { signIn } from "next-auth/react";
import { useRouter } from "next/navigation";
import { useState } from "react";

function LoginUser() {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const router = useRouter();
  const [errorMessage, setErrorMessage] = useState(null);

  const onSubmit = handleSubmit(async (data) => {
    const { username, password } = data;
    const result = await signIn("credentials", {
      user: username,
      password,
      redirect: false,
    });
    if (result.error) {
      setErrorMessage(result.error);
      setTimeout(() => {
        setErrorMessage(null);
      }, 5000);
    } else {
      router.push("/");
      router.refresh();
    }
  });
  return (
    <div className="container-fluid vh-100 d-flex justify-content-center align-items-center ">
      <div
        style={{ height: "80%", margin: "20px" }}
        className="card text-center"
      >
        <img
          style={{ width: "100%", height: "40%" }}
          src="./logomsp.png"
          className="m-auto"
          alt="..."
        />

        <div className="card-body">
          <h3 className="card-title mb-4">Sistema Familiograma</h3>
          <form onSubmit={onSubmit}>
            {errorMessage && (
              <div className="alert alert-danger" role="alert">
                {errorMessage}
              </div>
            )}
            
            {errors.username && (
              <span className="alert alert-warning">
                {" "}
                {errors.username.message}
              </span>
            )}
            <div className="mb-2">
              <input
                type="text"
                className="form-control"
                placeholder="Su cédula"
                {...register("username", {
                  required: {
                    value: true,
                    message: "Ingrese el usuario",
                  },
                })}
              />
              <label className="form-label">Usuario </label>
            </div>
            {errors.password && (
              <span className="alert alert-warning">
                {" "}
                {errors.password.message}
              </span>
            )}
            <div className="mb-2">
              <input
                type="password"
                className="form-control"
                placeholder="Password"
                {...register("password", {
                  required: {
                    value: true,
                    message: "Ingrese su password",
                  },
                })}
              />
              <label className="form-label">Contraseña</label>
            </div>
            <button className="btn btn-primary">Iniciar Sesión</button>
          </form>
        </div>
      </div>
    </div>
  );
}

export default LoginUser;
