import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import mobileImage from './components/images/mobile_image.jpg';
import desktopImage from './components/images/desktop_image.jpg';
import CustomNavbar from './components/navbar/CustomNavbar';
import Carousel from './components/carousel/Carousel';
import Home from './components/home/Home';
import BookFlight from './components/bookflight/BookFlight';
import About from './components/about/About';
import Contact from './components/contact/Contact';
import ResultsPage from './components/resultspage/ResultsPage';
import './components/carousel/Carousel.css';

export default function App() {
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);

  const handleResize = () => {
    setIsMobile(window.innerWidth <= 768);
  };

  useEffect(() => {
    window.addEventListener('resize', handleResize);
    return () => {
      window.removeEventListener('resize', handleResize);
    };
  }, []);

  const imageUrl = isMobile ? mobileImage : desktopImage;

  return (
    <Router>
      <div style={{
        backgroundImage: `url('${imageUrl}')`,
        backgroundSize: 'cover',
        height: '100vh',
        color: 'white'
      }}>
        <CustomNavbar />
        {isMobile ? (
          <div>

          </div>
        ) : (
          <div>
            <Carousel />
          </div>
        )}
        <Routes>
          <Route path='/' element={<Home />} />
          <Route path='/home' element={<Home />} />
          <Route path='/bookflight' element={<BookFlight />} />
          <Route path='/about' element={<About />} />
          <Route path='/contact' element={<Contact />} />
          <Route path='/resultspage' element={<ResultsPage />} />
        </Routes>
      </div>
    </Router>
  );
}