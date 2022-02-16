import im13 from "../../images/im13.png";
import "./styles.module.css";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
const Results1 = () => {
  return (
    <div class = "background">
      
      <img src={im13} alt="image" class="img"></img>
      <p class="line1">You have tested positive!! </p>
      <p class="line2">We recommand you to take a PCR test</p>

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

export default Results1;
