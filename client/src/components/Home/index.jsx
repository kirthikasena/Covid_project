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
      
   
     <p class="Hline1"><b>DefCov</b></p>
     <h1 class="Hline2"><b>The best way to cure covid-19 is to Prevent.</b></h1>
     <Link to="/login"><button class="hbtn1"><h3 class="label">Log In</h3></button></Link>
        <Link to="/signup"><button class="hbtn2"><h3 class="label">Sign Up</h3></button></Link> 
        
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