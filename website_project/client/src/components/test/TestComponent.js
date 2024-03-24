import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Select from 'react-dropdown-select';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import airportsData from './airports.json';
import deltaFlightsData from './deltaFlights.json';
import southwestFlightsData from './southwestFlights.json';

export default function TestComponent() {
  const [departAirport, setDepartAirport] = useState(null);
  const [arriveAirport, setArriveAirport] = useState(null);
  const [departDate, setDepartDate] = useState(new Date());

  let navigate = useNavigate();

  const airportOptions = airportsData.map((airport) => ({
    value: airport.airportCode,
    label: airport.airportCode
  }));

  const handleSearch = async () => {
    const data1 = deltaFlightsData.filter(flight => flight.departAirport === departAirport && flight.arriveAirport === arriveAirport && flight.departDate === departDate);
    const data2 = southwestFlightsData.filter(flight => flight.departAirport === departAirport && flight.arriveAirport === arriveAirport && flight.departDate === departDate);

    const allData = [...data1, ...data2];

    const stateData = {
      flights: allData,
    };
    const stateDataStr = JSON.stringify(stateData);

    const encodedStateDataStr = encodeURIComponent(stateDataStr);

    navigate(`/ResultsPage?data=${encodedStateDataStr}`);
  };

  return (
    <div>
      <Select
        options={airportOptions}
        onChange={setDepartAirport}
        placeholder='Select departure airport'
      />
      <Select
        options={airportOptions}
        onChange={setArriveAirport}
        placeholder='Select arrival airport'
      />
      <DatePicker
        selected={departDate}
        onChange={date => setDepartDate(date)}
        dateFormat='yyyy-MM-dd'
      />
      <button onClick={handleSearch}>Search</button>
    </div>
  );
}