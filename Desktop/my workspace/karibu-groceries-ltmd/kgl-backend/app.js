require("dotenv").config({ path: require("path").join(__dirname, ".env") });
const express = require("express");
const cors = require("cors");
const morgan = require("morgan");
const { withAuthContext } = require("./middleware/auth");
const authRoutes = require("./routes/authRoutes");
const procurementRoutes = require("./routes/procurementRoutes");
const salesRoutes = require("./routes/salesRoutes");
const stockRoutes = require("./routes/stockRoutes");
const creditSalesRoutes = require("./routes/creditSalesRoutes");
const reportRoutes = require("./routes/reportRoutes");

const app = express();

app.use(cors({ origin: process.env.CORS_ORIGIN || "*" }));
app.use(express.json());
app.use(morgan("dev"));
app.use(withAuthContext);

app.use("/api/auth", authRoutes);
app.use("/api/procurements", procurementRoutes);
app.use("/api/sales", salesRoutes);
app.use("/api/credit-sales", creditSalesRoutes);
app.use("/api/stock", stockRoutes);
app.use("/api/reports", reportRoutes);

app.get("/api/health", (_req, res) => {
  res.json({ ok: true, service: "kgl-backend", ts: new Date().toISOString() });
});

app.use((req, res) => {
  res.status(404).json({ message: "Route not found", path: req.originalUrl });
});

app.use((err, _req, res, _next) => {
  console.error(err);
  res.status(500).json({
    message: "Internal server error",
    detail: process.env.NODE_ENV === "production" ? undefined : err.message
  });
});

module.exports = app;
