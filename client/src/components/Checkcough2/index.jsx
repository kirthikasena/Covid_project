import im2 from "../../images/im2.png";
import im16 from "../../images/im16.png";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./styles.module.css";

const Checkcough2 = () => {
  return (
    <div class="background">
      <img src={im2} alt="image" class="img1"></img>
      <img src={im16} alt="image" class="img2"></img>
      

    </div>
  );
}

export default Checkcough2;
