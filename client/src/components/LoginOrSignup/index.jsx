import React from 'react';
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./styles.module.css";
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
const LoginOrSignup = () => {
  return(
      <div class="background">
        <h2 class="line1">The best way to cure covid-19 is to Prevent.</h2>
        <h3 class="line2">Log In or Sign Up for more.</h3> 
        <Link to="/login"><button class="btn1"><h3 class="label">Log In</h3></button></Link>
        <Link to="/signup"><button class="btn2"><h3 class="label">Sign Up</h3></button></Link>    
      </div>
  )
}
export default LoginOrSignup;