const path = require("path");
const serverless = require("serverless-http");
require("dotenv").config({ path: path.join(__dirname, "..", "kgl-backend", ".env") });

const app = require("../kgl-backend/app");
const { connectDB } = require("../kgl-backend/config/db");
const { ensureDefaultUsers } = require("../kgl-backend/services/seedUsers");

let initPromise;
async function init() {
  if (initPromise) return initPromise;
  const uri = process.env.MONGODB_URI;
  if (!uri) {
    throw new Error("MONGODB_URI must be set in environment variables.");
  }

  initPromise = (async () => {
    await connectDB(uri);
    await ensureDefaultUsers();
  })();

  return initPromise;
}

const handler = serverless(app);

module.exports = async (req, res) => {
  await init();
  return handler(req, res);
};
