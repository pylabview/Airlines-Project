import React from 'react';
import { Link } from 'react-router-dom';
import { Navbar, Nav, Container } from 'react-bootstrap';
import { SiYourtraveldottv } from 'react-icons/si';
import './CustomNavbar.css';

export default function CustomNavbar() {
  return (
    <Navbar className='wpi-atr_navbar' bg='light' expand='lg'>
      <Container className='wpi-atr_navbar_container'>
        <Navbar.Brand href='/Home' aria-label='Home'>
          <SiYourtraveldottv className='wpi-atr_icon' size={32} />
        </Navbar.Brand>
        <Navbar.Toggle aria-controls='basic-navbar-nav' />
        <Navbar.Collapse id='basic-navbar-nav'>
          <Nav className='me-auto'>
            <Link to='/Home'>Home</Link>
            <Link to='/BooKFlight'>Book a Flight</Link>
            <Link to='/About'>About</Link>
            <Link to='/contact'>Contact</Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}