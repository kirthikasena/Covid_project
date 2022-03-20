import React from 'react';
import im2 from "../../images/im2.png"; // gives image path
import im9 from "../../images/im9.png";
import im16 from "../../images/im16.png";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./Home.css";



const Home = () => {
  return(
    <div class="container-md">.container-md

    <div class="background">
      
    
     <p class="line1"><b>DefCov</b></p>
     <Link to="/LoginOrSignup"><button class="hbtn"><h2 class="line2">Take a test</h2></button></Link>
     <nav role="navigation">
  <div id="menuToggle">
    
    <input type="checkbox" />
     
    
    <span></span>
    <span></span>
    <span></span>
     
    
    <ul id="menu">
    <Link to="/Login"><a><li>Log In</li></a></Link><br></br>
    <Link to="/Signup"><a><li>Sign up</li></a></Link><br></br>
    <Link to=" "><a><li>Report</li></a></Link>
      
    </ul>
  </div>
</nav>
  </div>
  </div>
  )
}

export default Home;