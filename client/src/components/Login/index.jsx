import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import styles from "./styles.module.css";


const Login = () => {
	const [data, setData] = useState({ email: "", password: "" });
	const [error, setError] = useState("");

	const handleChange = ({ currentTarget: input }) => {
		setData({ ...data, [input.name]: input.value });
	};
	const navigate = useNavigate();

	const handleSubmit = async (e) => {
		e.preventDefault();
		try {
			const url = "http://localhost:8080/api/auth";
			const { data: res } = await axios.post(url, data);
			// localStorage.setItem("token", res.data);
			localStorage.setItem('token',JSON.stringify(data));
			navigate('/Readandagree');
			// window.location = "/";
		} catch (error) {
			if (
				
				error.response &&
				error.response.status >= 400 &&
				error.response.status <= 500
			) {
				console.log(error);
				setError(error.response.data.message);
				
			}
		}
	};

	return (
		
		
	// <div styles={{ backgroundImage:`url(${Covid_Virus})`,backgroundRepeat:"cover" }}id="main">
	<div className={styles.pagebackground}>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
	<div className={styles.Login}>
		<div className={styles.login_container}>
			<div className={styles.login_form_container}>
				<div className={styles.left}>
				
				</div>
				<div className={styles.right}>
					<form className={styles.form_container} onSubmit={handleSubmit}>
						<h1>Login to Your Account</h1>
						<input
							type="email"
							placeholder="Email"
							name="email"
							onChange={handleChange}
							value={data.email}
							required
							className={styles.input}
						/>
						<input
							type="password"
							placeholder="Password"
							name="password"
							onChange={handleChange}
							value={data.password}
							required
							className={styles.input}
						/>
						{error && <div className={styles.error_msg}>{error}</div>}
						<button type="submit" className={styles.green_btn}>
							Sign In
						</button>
					</form>
				{/* </div> */}
				
					<h1>New Here ?</h1>
					<Link to="/signup">
						<button type="button" className={styles.white_btn}>
							Sign Up
						</button>
						</Link>
					
				</div>
			</div>
		</div>
	</div>
	<nav role="navigation">
  <div id="menuToggle">
     
    <input type="checkbox" />
     
    
    <span></span>
    <span></span>
    <span></span>
     
    
    <ul id="menu">
    
    <Link to="/Login"><a><li>Log In</li></a></Link><br></br>
    <Link to="/Signup"><a><li>Sign up</li></a></Link><br></br>
    <Link to="/Shallowbreath"><a><li>Record</li></a></Link><br></br>
	<Link to="/Home"><a><li>Log out</li></a></Link> <br></br> 
    <Link to=""><a><li>Report</li></a></Link>
      
    </ul>
  </div>
</nav>
	</div>
	
	);
};

export default Login;
