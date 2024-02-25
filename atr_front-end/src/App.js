import React from "react";
import "./App.css";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
// eslint-disable-next-line
import Navbar from "./Navbar/Navbar";
import NavbarHook from "./NavbarHook/NavbarHook";
import About from "./Pages/About";
import Home from "./Pages/Home";
import News from "./Pages/News";
import backgroundVideo from './Videos/video1.mp4';

const App = () => {
  return (
    <Router>
      {/*<Navbar />*/}
      <NavbarHook />
      <main className="main-content">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/news" element={<News />} />
          <Route path="/About" element={<About />} />
          {/* Define additional routers as needed*/}
        </Routes>
      </main>
      <div>
        <video autoPlay loop muted>
          <source src = {backgroundVideo} type = 'video/mp4' />
        </video>
      </div>
    </Router>
  );
};

export default App;