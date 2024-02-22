import conn from "@/database/connection";
import NextAuth from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";

export const authOptions = {
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        user: { label: "Email", type: "text", placeholder: "jsmith" },
        password: { label: "Password", type: "password", placeholder: "*****" },
      },
      async authorize(credentials, req) {
        const userFound = await conn.query(
          // `SELECT csctbpersonalid, nombresp, apellido_pat, apellido_mat, pass FROM csctbpersonal WHERE cedula = $1 AND pass = $2;`,
          `SELECT csctbpersonalid, nombresp, apellido_pat, apellido_mat, pass FROM csctbpersonal WHERE cedula = $1`,
          // [credentials.user, credentials.password]
          [credentials.user]
        );

        if (!userFound.rows.length) {
          throw new Error("Usuario no encontrado");
        }

        console.log(userFound.rows[0]);

        if (userFound.rows[0].pass !== credentials.password) {
          throw new Error("Contraseña incorrecta");
        }

        // if (!(userFound.rows[0].pass === credentials.password && userFound.rows[0].cedula === credentials.user)) {
        //   throw new Error("Data doesn exist");
        // }
        // if (!(userFound.rows[0].pass == credentials.password)) {
        //   throw new Error("Wrong password");
        // }
        return {
          id: userFound.rows[0].csctbpersonalid,
          name: userFound.rows[0].nombresp,
          email: null,
        };
      },
    }),
  ],
  pages: {
    signIn: "/login",
  },
  callbacks: {
    jwt({ token, trigger, session }) {
      if (trigger === "update") {
        token.email = session.email
      }

      return token;
    },
  },
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
