const app = require("./app");
const { connectDB } = require("./config/db");
const { ensureDefaultUsers } = require("./services/seedUsers");

const port = Number(process.env.PORT || 4000);

async function start() {
  try {
    console.log("Starting KGL backend server...");
    const isProduction = process.env.NODE_ENV === "production";
    console.log(`Environment: ${isProduction ? 'production' : 'development'}`);

    const mongoUri = process.env.MONGODB_URI;
    const localUri = process.env.MONGODB_URI_LOCAL;
    const selectedUri = isProduction ? mongoUri : (localUri || mongoUri);

    console.log(`MongoDB URI configured: ${!!selectedUri}`);
    if (!selectedUri) {
      throw new Error("No MongoDB URI configured. Set MONGODB_URI (prod) or MONGODB_URI_LOCAL (local).");
    }

    console.log("Connecting to MongoDB...");
    await connectDB(selectedUri);
    console.log("MongoDB connected successfully");

    console.log("Ensuring default users exist...");
    await ensureDefaultUsers();
    console.log("Default users check complete");

    console.log(`Starting server on port ${port}...`);
    app.listen(port, () => {
      console.log(`✅ KGL backend running on http://localhost:${port}`);
      console.log(`Health check: http://localhost:${port}/api/health`);
    });
  } catch (err) {
    console.error("❌ Failed to start server:", err.message);
    console.error("Full error:", err);
    process.exit(1);
  }
}

start();
