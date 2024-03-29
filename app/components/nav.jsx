"use client";

import { useEffect } from "react";
import { useSearchParams, usePathname, useRouter } from "next/navigation";
import Link from "next/link";
function Nav(props) {
  useEffect(() => {
    require("bootstrap/dist/js/bootstrap.bundle.min.js");
  }, []);
  const router = useRouter();

  const seachParams = useSearchParams();
  const pathname = usePathname();
  return (
    <nav className="navbar navbar-expand-lg" style={{ backgroundColor: "#2d2d93" }}>
      <div className="container-fluid">
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
          className="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNavAltMarkup"
          aria-controls="navbarNavAltMarkup"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div className="navbar-nav">
            <Link className="nav-link active" href={"/"} style={{color: "white"}}>
              Inicio
            </Link>
            
          </div>
        </div>
      </div>
    </nav>
  );
}

export default Nav;
