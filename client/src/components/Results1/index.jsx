import im13 from "../../images/im13.png";
import "./results1.css";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
const Results1 = () => {
  return (
    <div class = "re1background">
      
      <img src={im13} alt="image" class="re1img"></img>
      <p class="re1line1">You have tested positive!! </p>
      <p class="re1line2">We recommand you to take a PCR test</p>
      <Link to=""><button class="re1btn"><h3 class="re1text">Check your progress</h3></button></Link>

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

export default Results1;
