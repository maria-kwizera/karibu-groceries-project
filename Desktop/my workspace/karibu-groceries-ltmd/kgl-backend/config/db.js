const mongoose = require("mongoose");

const cached = global.mongoose || { conn: null, promise: null };
global.mongoose = cached;

async function connectDB(uri) {
  if (!uri) {
    throw new Error("MONGODB_URI is not defined in environment variables");
  }

  if (cached.conn) {
    return cached.conn;
  }

  if (!cached.promise) {
    cached.promise = mongoose.connect(uri, {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }).then((mongooseInstance) => {
      cached.conn = mongooseInstance.connection;
      return cached.conn;
    });
  }

  try {
    return await cached.promise;
  } catch (err) {
    console.error("MongoDB connection failed:", err.message);
    cached.conn = null;
    cached.promise = null;
    throw err;
  }
}

module.exports = { connectDB };
