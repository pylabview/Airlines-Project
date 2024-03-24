import React, { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import { BsFillPersonFill, BsFillLuggageFill } from 'react-icons/bs';
import './PassengerDetails.css';

export default function PassengerDetails({ onDetailsChange }) {
  const [showModal, setShowModal] = useState(false);
  const [selectedCabinClassType, setSelectedCabinClassType] = useState('Economy');
  const [details, setDetails] = useState({
    Adult: 1,
    Youth: 0,
    Child: 0,
    Infant: 0,
    cabinClassType: 'Economy',
    checkedLuggage: 0,
    carryOn: 0
  });
  const iconsize = '18';

  const handleIncrement = (type) => {
    if (type === 'checkedLuggage' || type === 'carryOn') {
      if (details[type] < 5) {
        const newDetails = { ...details, [type]: details[type] + 1 };
        setDetails(newDetails);
        if (typeof onDetailsChange === 'function') {
          onDetailsChange(newDetails);
        }
      }
    } else if (details[type] < 10) {
      const newDetails = { ...details, [type]: details[type] + 1 };
      setDetails(newDetails);
      if (typeof onDetailsChange === 'function') {
        onDetailsChange(newDetails);
      }
    }
  };

  const handleDecrement = (type) => {
    if (details[type] > 0) {
      const newDetails = { ...details, [type]: details[type] - 1 };
      setDetails(newDetails);
      if (typeof onDetailsChange === 'function') {
        onDetailsChange(newDetails);
      }
    }
  };

  const handleCabinClassTypeChange = (type) => {
    setSelectedCabinClassType(type);
    const newDetails = { ...details, cabinClassType: type };
    setDetails(newDetails);
    if (typeof onDetailsChange === 'function') {
      onDetailsChange(newDetails);
    }
  };

  const handleDoneClick = () => {
    setShowModal(false);
  };

  return (
    <div>
      <Button className='passenger_details_button1' onClick={() => setShowModal(true)}>Passenger Details</Button>
      <Modal
        className='modal-sm'
        show={showModal}
        onHide={() => setShowModal(false)}
      >
        <Modal.Header closeButton>
          <Modal.Title className='passenger_details_title'>Passenger Details</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div className='passenger'>
            {['Adult', 'Youth', 'Child', 'Infant'].map((type) => (
              <div style={{position: 'relative'}} key={type}>
                <span>{type}</span>           
                <Button className='passenger_plus' onClick={() => handleIncrement(type)}>
                  <BsFillPersonFill size={iconsize} />
                  +
                </Button>
                <span className='passenger_count'>{details[type]}</span>
                <Button className='passenger_minus' onClick={() => handleDecrement(type)}>
                  <BsFillPersonFill size={iconsize} />
                  -
                </Button>
              </div>
            ))}
          </div>
          <div className='cabin_class'>
            <Button className={`cabin_class_e ${selectedCabinClassType === 'Economy' ? 'selected' : ''}`} onClick={() => handleCabinClassTypeChange('Economy')}>Economy</Button>
            <Button className={`cabin_class_b ${selectedCabinClassType === 'Business' ? 'selected' : ''}`} onClick={() => handleCabinClassTypeChange('Business')}>Business</Button>
            <Button className={`cabin_class_f ${selectedCabinClassType === 'First Class' ? 'selected' : ''}`} onClick={() => handleCabinClassTypeChange('First Class')}>First Class</Button>
          </div>
          <div className='luggage'>
            <div style={{position: 'relative'}}>
              <label>
                Checked Luggage
                <Button className='luggage_plus' onClick={() => handleIncrement('checkedLuggage')}>
                  <BsFillLuggageFill size={iconsize} />
                  +
                </Button>
                <span className='checked_luggage_count'>{details.checkedLuggage}</span>
              </label>
            </div>
            <div style={{position: 'relative'}}>
              <Button className='luggage_minus' onClick={() => handleDecrement('checkedLuggage')}>
                <BsFillLuggageFill size={iconsize} />
                -
              </Button>
            </div>
            <div style={{position: 'relative'}}>
              <label>
                Carry-On
                  <Button className='luggage_plus' onClick={() => handleIncrement('carryOn')}>
                    <BsFillLuggageFill size={iconsize} />
                    +
                  </Button>
                <span className='carry-on_luggage_count'>{details.carryOn}</span>
              </label>
            </div>
            <div style={{position: 'relative'}}>
              <Button className='luggage_minus' onClick={() => handleDecrement('carryOn')}>
                <BsFillLuggageFill size={iconsize} />
                -
              </Button>
            </div>
          </div>
        </Modal.Body>
        <Modal.Footer>
          <Button className='passenger_details_button2' onClick={handleDoneClick}>Done</Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
}