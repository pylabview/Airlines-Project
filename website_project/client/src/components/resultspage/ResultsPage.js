import { useLocation } from 'react-router-dom';
import Card from 'react-bootstrap/Card';
import 'bootstrap/dist/css/bootstrap.min.css';
import { useEffect, useState } from 'react';

export default function ResultsPage() {
  const location = useLocation();
  const [flights, setFlights] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [passengerDetails, setPassengerDetails] = useState({});
  const resultsPerPage = 10;

  const dataStr = new URLSearchParams(location.search).get('data');

  useEffect(() => {
    if (dataStr) {
      const {
        flights: flightDataFromURL,
        passengerDetails: passengerDetailsFromURL = {}
      } = JSON.parse(decodeURIComponent(dataStr));
      setFlights(flightDataFromURL);
      setPassengerDetails(passengerDetailsFromURL); 
    }
  }, [dataStr]);  
  
  const indexOfLastResult = currentPage * resultsPerPage;
  const indexOfFirstResult = indexOfLastResult - resultsPerPage;
  const currentResults = flights?.slice(indexOfFirstResult, indexOfLastResult);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div>
      <div style={{ backgroundColor: '#f8f9fa', padding: '1rem', marginBottom: '1rem' }}>
        <h2>Passenger Details</h2>
        Adults: {passengerDetails.Adult || 0}<br/>
        Youth: {passengerDetails.Youth || 0}<br/>
        Children: {passengerDetails.Child || 0}<br/>
        Infants: {passengerDetails.Infant || 0}<br/>
        Seat Type: {passengerDetails.cabinClassType}<br/>
        Checked Luggage: {passengerDetails.checkedLuggage || 0}<br/>
        Carry On: {passengerDetails.carryOn || 0}
      </div>
      {currentResults && currentResults.map((flight, index) => (
        <Card key={index} style={{ width: '18rem' }}>
          <Card.Body>
            <Card.Title>Flight Details</Card.Title>
            <Card.Text>
              Depart Airport: {flight.departAirport ? flight.departAirport.airportCode : 'N/A'}<br/>
              Latitude: {flight.departAirport.latitudeDeg}<br/>
              Longitude: {flight.departAirport.longitudeDeg}<br/>
              Arrive Airport: {flight.arriveAirport.airportCode}<br/>
              Latitude: {flight.arriveAirport.latitudeDeg}<br/>
              Longitude: {flight.arriveAirport.longitudeDeg}<br/>
              Depart Date Time: {new Date(flight.departDateTime).toString()}<br/>
              Arrive Date Time: {new Date(flight.arriveDateTime).toString()}<br/>
              Flight Number: {flight.flightNumber}<br/>
            </Card.Text>
          </Card.Body>
        </Card>
      ))}
      <div className='pagination'>
        {flights && [...Array(Math.ceil(flights.length / resultsPerPage)).keys()].map(number => (
          <button key={number} onClick={() => paginate(number + 1)}>
            {number + 1}
          </button>
        ))}
      </div>
    </div>
  );
}