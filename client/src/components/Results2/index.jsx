import im13 from "../../images/im13.png";
import im5 from "../../images/im5.png";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./styles.module.css";

const Results2 = () => {
  return (
    <div class = "background">
      
      <img src={im13} alt="image" class="img1"></img>
      <img src={im5} alt="image" class="img2"></img>
      <p class="line1">You have tested Negative!! </p>
      <p class="line2">we are pleased to say you are healthy</p>

      <nav role="navigation">
  <div id="menuToggle">
    
    <input type="checkbox" />
     
    
    <span></span>
    <span></span>
    <span></span>
     
    
    <ul id="menu">
      <a href="#"><li>Log In</li></a>
      <a href="#"><li>Sign up</li></a>
      <a href="#"><li>Record</li></a>
      <a href="#"><li>Report</li></a>
      
    </ul>
  </div>
</nav>
    </div>
  );
}

export default Results2;