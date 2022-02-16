import "./styles.module.css";
import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
const Readandagree = () => {
  return (
    <div class="background">
      <div class="vector">
      <h4 >Please Read the terms and conditions before continuing.</h4>
        <p class="p"><h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
          Ornare nunc hendrerit lectus pellentesque dui sem rutrum. Porta duis turpis duis aliquam. 
          Mollis justo sed libero nunc dictum sit urna. Enim et turpis et id massa nunc. 
          Proin semper sit pulvinar etiam donec.</h5></p>
          <input type="checkbox" id="check" name="ckeck" ></input>
  <label for="check">I have read the terms and conditions and I Agree.</label><br></br>
          
  <Link to="/Checkcogh1"><button class="btn"><h3 class="text">continue</h3></button></Link>
      
      </div>
  </div>
  );
}

export default Readandagree;
