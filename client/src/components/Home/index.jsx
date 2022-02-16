import React from 'react';
import im2 from "../../images/im2.png"; // gives image path
import im9 from "../../images/im9.png";
import im16 from "../../images/im16.png";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./styles.module.css";

const Home = () => {
  return(
    <div class="background">
      <img src={im9} alt="image" class="img1"></img>
     <img src={im2} alt="image" class="img2"></img>
     <img src={im2} alt="image" class="img3"></img>
    
     <p class="line1">Covid-19 checker</p>
     <Link to="/Readandagree"><button class="btn"><h1 class="line2">Take a test</h1></button></Link>
     <nav role="navigation">
  <div id="menuToggle">
    
    <input type="checkbox" />
     
    
    <span></span>
    <span></span>
    <span></span>
     
    
    <ul id="menu">
      <a href="#"><li>Log In</li></a>
      <a href="#"><li>Sign up</li></a>
      <a href="#"><li>Report</li></a>
      
    </ul>
  </div>
</nav>
  </div>
  )
}

export default Home;