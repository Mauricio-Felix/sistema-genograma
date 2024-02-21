import { Pool } from "pg";

let conn;

if (!conn) {
  conn = new Pool({
    user: 'postgres',
    password: "1234",
    host: 'localhost',
    port: '5432',
    database: 'cscdb_chambo_local',
  });
}

export default conn ;
