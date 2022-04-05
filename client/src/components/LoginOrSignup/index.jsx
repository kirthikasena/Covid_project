import React from 'react';
import { useState } from "react";
import im14 from "../../images/im14.png";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import "./LoginOrSignup.css";
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
const LoginOrSignup = () => {
  return(
      <div class="lsbackground">
        <h2 class="lsline1">The best way to cure covid-19 is to Prevent.</h2>
        <h3 class="lsline2">Log In or Sign Up for more.</h3> 
        <Link to="/login"><button class="lsbtn1"><h3 class="label">Log In</h3></button></Link>
        <Link to="/signup"><button class="lsbtn2"><h3 class="label">Sign Up</h3></button></Link>    
      </div>
  )
}
export default LoginOrSignup; 