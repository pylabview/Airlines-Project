import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Select from 'react-dropdown-select';
import PassengerDetails from '../passengerdetails/PassengerDetails';
import Datepicker from '../datepicker/Datepicker';
import './BookFlight.css';
import { useNavigate } from 'react-router-dom';

const searchAPI = axios.create({
  baseURL: 'http://localhost:8080',
});

export default function BookFlight() {
  const [airports, setAirports] = useState([]);
  const [departAirport, setDepartAirport] = useState(null);
  const [arriveAirport, setArriveAirport] = useState(null);
  const [singleDate, setSingleDate] = useState(new Date());
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(new Date());
  const [tripType, setTripType] = useState('One-Way');

  let navigate = useNavigate();

  const [passengerDetails, setPassengerDetails] = useState({
    Adult: 1,
    Youth: 0,
    Child: 0,
    Infant: 0,
    cabinClassType: 'Economy',
    checkedLuggage: 0,
    carryOn: 0
  });

  const handleDepartureAirportChange = (selectedDepartAirportOption) => {
    setDepartAirport(selectedDepartAirportOption);
  };

  const handleArriveAirportChange = (selectedArriveAirportOption) => {
    setArriveAirport(selectedArriveAirportOption);
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const result = await searchAPI.get('/airports');
        setAirports(result.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };
    fetchData();
  }, []);

  const departAirportOptions = airports.map((airport) => ({
    value: airport.airportCode,
    label: airport.airportCode
  })).filter(option => !arriveAirport || !arriveAirport[0] || option.value !== arriveAirport[0].value);
  
  const arriveAirportOptions = airports.map((airport) => ({
    value: airport.airportCode,
    label: airport.airportCode
  })).filter(option => !departAirport || !departAirport[0] || option.value !== departAirport[0].value);  

  const onDateChange = ({ singleDate, startDate, endDate, tripType }) => {
    setSingleDate(singleDate);
    setStartDate(startDate);
    setEndDate(endDate);
    setTripType(tripType);
  }

  const handleDetailsChange = (newDetails) => {
    setPassengerDetails(newDetails);
  };

  const handleSearch = async () => {
    if (!departAirport || !arriveAirport || !singleDate || !startDate || !endDate) {
      alert('Please input your search criteria (i.e., departure and an arrival airports, departure and/or return dates.');
      return;
    }

    let params = {};
    if (tripType === 'One-Way') {
      params = {
        departAirport: departAirport?.[0]?.value || null,
        arriveAirport: arriveAirport?.[0]?.value || null,
        singleDate: singleDate
      };
    } else if (tripType === 'Round-Trip') {
      params = {
        departAirport: departAirport?.[0]?.value || null,
        arriveAirport: arriveAirport?.[0]?.value || null,
        startDate: startDate,
        endDate: endDate
      };
    } 

    /* Remove before final delivery */
    console.log('User selections:', {
      DepartureAirport: departAirport?.[0]?.value,
      ArrivalAirport: arriveAirport?.[0]?.value,
      SingleDate: singleDate,
      StartDate: startDate,
      EndDate: endDate,
      TripType: tripType,
      PassengerDetails: passengerDetails
    });
    /* Remove before final delivery */

    try {
      const deltaFlights = await searchAPI.get('/deltaFlights', {params});
      const southwestFlights = await searchAPI.get('/southwestFlights', {params});
      const flights = [...deltaFlights.data, ...southwestFlights.data];

      const stateData = {
        flights: flights,
        passengerDetails: passengerDetails
      };
      const stateDataStr = JSON.stringify(stateData);

      const encodedStateDataStr = encodeURIComponent(stateDataStr);

      navigate(`/ResultsPage?data=${encodedStateDataStr}`);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  return (
    <div className='bookflight_input_container'>
      <PassengerDetails onDetailsChange={handleDetailsChange} />
      <Select
        className='depart_airport_selector'
        clearable
        dropdownPosition='bottom'
        onChange={handleDepartureAirportChange}
        options={departAirportOptions}
        placeholder='Select point of departure...'
        searchable
      />
      <Select
        className='arrive_airport_selector'
        clearable
        dropdownPosition='bottom'
        onChange={handleArriveAirportChange}
        options={arriveAirportOptions}
        placeholder='Select destination...'
        searchable
      />
      <Datepicker
        onDateChange={onDateChange}
      />
      <button className='search_Button' onClick={handleSearch}>
        Search Flights
      </button>
    </div>
  );  
}