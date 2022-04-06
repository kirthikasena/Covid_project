import { Route, Routes, Navigate } from "react-router-dom";
import Main from "./components/Main";
import LoginOrSignup from "./components/LoginOrSignup";
import Signup from "./components/Singup";
import Login from "./components/Login";
import Home from "./components/Home";
import Readandagree from "./components/Readandagree";
import Checkcough1 from "./components/Checkcough1";
import Checkcough2 from "./components/Checkcough2";
import Checkcough3 from "./components/Checkcough3";
import Checkcough4 from "./components/Checkcough4";
import Checkcough5 from "./components/Checkcough5";
import Checkcough6 from "./components/Checkcough6";
import Shallowbreath from "./components/Shallowbreath";
import Shallowcough from "./components/Shallowcough";
import Heavycough from "./components/Heavycough";
import VowelE from "./components/VowelE";
import VowelO from "./components/VowelO";
import Fastcounting from "./components/Fastcounting";
import Results1 from "./components/Results1";
import Results2 from "./components/Results2";
import Button from 'react-bootstrap/Button';
import Image from 'react-bootstrap/Image';


function App() {
	const user = localStorage.getItem("token");

	return (
		<Routes>
			{user && <Route path="/" exact element={<LoginOrSignup />} />}
			<Route path="/Home" exact element={<Home />} />
			<Route path="/signup" exact element={<Signup />} />
			<Route path="/login" exact element={<Login />} />
			<Route path="/LoginOrSignup" exact element={<LoginOrSignup />} />
			<Route path="/Readandagree" exact element={<Readandagree />} />
			<Route path="/Checkcough1" exact element={<Checkcough1 />} />
			<Route path="/Checkcough2" exact element={<Checkcough2 />} />
			<Route path="/Checkcough3" exact element={<Checkcough3 />} />
			<Route path="/Checkcough4" exact element={<Checkcough4 />} />
			<Route path="/Checkcough5" exact element={<Checkcough5 />} />
			<Route path="/Checkcough6" exact element={<Checkcough6 />} />
			<Route path="/Shallowbreath" exact element={<Shallowbreath />} />
			<Route path="/Shallowcough" exact element={<Shallowcough />} />
			<Route path="/Heavycough" exact element={<Heavycough />} />
			<Route path="/VowelE" exact element={<VowelE />} />
			<Route path="/VowelO" exact element={<VowelO />} />
			<Route path="/Fastcounting" exact element={<Fastcounting />} />
			<Route path="/Results1" exact element={<Results1 />} />
			<Route path="/Results2" exact element={<Results2 />} />
			<Route path="/" element={<Navigate replace to="/Home" />} />
			
		</Routes>
	);
}

export default App;
