const mongoose = require("mongoose");

const ResultSchema = new mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    probability: {
      type: Number
    },
  },
  {
    timestamps: true,
  }
);



const Result = mongoose.model("result",ResultSchema);
module.exports = { Result};