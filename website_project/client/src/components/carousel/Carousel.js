import React from 'react';
import Carousel from 'react-bootstrap/Carousel';
import carousel_image1 from '../images/carousel_image1.jpg';
import carousel_image2 from '../images/carousel_image2.jpg';
import carousel_image3 from '../images/carousel_image3.jpg';
import carousel_image4 from '../images/carousel_image4.jpg';
import carousel_image5 from '../images/carousel_image5.jpg';
import carousel_image6 from '../images/carousel_image6.jpg';
import carousel_image7 from '../images/carousel_image7.jpg';
import carousel_image8 from '../images/carousel_image8.jpg';
import carousel_image9 from '../images/carousel_image9.jpg';
import './Carousel.css';

export default function TripCarousel() {
  const data1 = [
    { title: 'Paris', image: carousel_image1 },
    { title: 'Liguria', image: carousel_image2 },
    { title: 'Porto', image: carousel_image3 }
  ];

  const data2 = [
    { title: 'Valencia', image: carousel_image4 },
    { title: 'Budapest', image: carousel_image5 },
    { title: 'Bora Bora', image: carousel_image6 }
  ];

  const data3 = [
    { title: 'Maui', image: carousel_image7 },
    { title: 'Mauldives', image: carousel_image8 },
    { title: 'St. Lucia', image: carousel_image9 }
  ];

  const renderCarousel = (data, idx) => (
    <Carousel key={idx} className={idx}>
      {data.map((item, idx) => (
        <Carousel.Item key={idx}>
          <img
            className='d-block w-100'
            src={item.image}
            alt={item.title}
          />
          <Carousel.Caption>
            <div className='slide_title_container'>
              <h3>{item.title}</h3>
            </div>
          </Carousel.Caption>
        </Carousel.Item>
      ))}
    </Carousel>
  );

  return (
    <div className='carousel_container'>
      <div className='left_carousel'>
        {renderCarousel(data1, 1)}
      </div>
      <div className='center_carousel'>
        {renderCarousel(data2, 2)}
      </div>
      <div className='right_carousel'>
        {renderCarousel(data3, 3)}
      </div>
    </div>
  );
}