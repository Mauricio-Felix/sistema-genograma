import { Pool } from "pg";

let conn;

if (!conn) {
  conn = new Pool({
    user: 'postgres',
    password: "1234",
    host: 'localhost',
    port: '5432',
    database: 'cscdb_chambo_local',
    // user: 'postgres',
    // password: "Datatics.2024",
    // host: '181.112.228.13',
    // port: '5432',
    // database: 'cscdb_chambo_gen',
  });
}

export default conn ;
