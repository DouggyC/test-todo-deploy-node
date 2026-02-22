import pkg from 'pg';
const { Pool } = pkg;

const DB = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT),
  ssl: { rejectUnauthorized: false }, // recommended for AWS RDS
});

// Test connection immediately
(async () => {
  try {
    await DB.connect(); // tries to connect
    console.log('✅ Successfully connected to the database');
  } catch (err) {
    console.error('❌ Failed to connect to the database:', err);
  }
})();

export default DB;