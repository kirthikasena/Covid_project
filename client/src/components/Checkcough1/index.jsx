import im16 from "../../images/im16.png";
import im2 from "../../images/im2.png";
import "./styles.module.css";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
const Checkcough1 = () => {
  return (
    <div class="background">
     <img src={im16} alt="image" class="img1"></img>
     <img src={im2} alt="image" class="img2"></img>
     <p class="line">Please press record , and record your cough</p>
     <Link to="/Checkcough2"><button class="btn"><h3 class="text">Record</h3></button></Link>
    </div>
  );
}

export default Checkcough1;
