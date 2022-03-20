import im13 from "../../images/im13.png";
import im5 from "../../images/im5.png";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./results2.css";

const Results2 = () => {
  return (
    <div class = "re2background">
      
      <img src={im13} alt="image" class="re2img1"></img>
      <img src={im5} alt="image" class="re2img2"></img>
      <p class="re2line1">You have tested Negative!! </p>
      <p class="re2line2">we are pleased to say you are healthy</p>
      
      <nav role="navigation">
  <div id="menuToggle">
     
    <input type="checkbox" />
     
    
    <span></span>
    <span></span>
    <span></span>
     
    
    <ul id="menu">
    <Link to="/Home"><a><li>Home</li></a></Link> <br></br> 
    <Link to="/Login"><a><li>Log In</li></a></Link><br></br>
    <Link to="/Signup"><a><li>Sign up</li></a></Link><br></br>
    <Link to="/Checkcough1"><a><li>Record</li></a></Link><br></br>
    <Link to=""><a><li>Report</li></a></Link>
      
    </ul>
  </div>
</nav>
    </div>
  );
}

export default Results2;