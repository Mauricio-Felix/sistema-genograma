import { Pool } from "pg";

let conn;

if (!conn) {
  conn = new Pool({
    user: 'postgres',
    password: "1234",
    host: 'localhost',
    port: '5432',
    database: 'fichav31',
  });
}

export default conn ;
