import { Route, Routes, Navigate } from "react-router-dom";
import Main from "./components/Main";
import LoginOrSignup from "./components/LoginOrSignup";
import Signup from "./components/Singup";
import Login from "./components/Login";
import Home from "./components/Home";
import Readandagree from "./components/Readandagree";
import Checkcough1 from "./components/Checkcough1";
import Checkcough2 from "./components/Checkcough2";
import Results1 from "./components/Results1";
import Results2 from "./components/Results2";
import Report from "./components/Report";

function App() {
	const user = localStorage.getItem("token");

	return (
		<Routes>
			{user && <Route path="/" exact element={<Main />} />}
			<Route path="/LoginOrSignup" exact element={<LoginOrSignup />} />
			<Route path="/signup" exact element={<Signup />} />
			<Route path="/login" exact element={<Login />} />
			
			<Route path="/" element={<Navigate replace to="/login" />} />
			<Route path="/Home" exact element={<Home />} />
			<Route path="/Readandagree" exact element={<Readandagree />} />
			<Route path="/Checkcough1" exact element={<Checkcough1 />} />
			<Route path="/Checkcough2" exact element={<Checkcough2 />} />
			<Route path="/Results1" exact element={<Results1 />} />
			<Route path="/Results2" exact element={<Results2 />} />
			<Route path="/Readandagree" exact element={<Readandagree />} />
			
		</Routes>
	);
}

export default App;
