import { useState, useEffect, startTransition } from 'react';
import DatePicker from 'react-datepicker';
import { registerLocale } from 'react-datepicker';
import enGB from 'date-fns/locale/en-GB';
import 'react-datepicker/dist/react-datepicker.css';
import '../datepicker/Datepicker.css';

registerLocale('en-GB', enGB);

export default function Datepicker({ onDateChange = () => {} }) {
  const [singleDate, setSingleDate] = useState(new Date());
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(new Date());
  const [toggle, setToggle] = useState(false);
  const tripType = toggle ? 'Round-Trip' : 'One-Way';

  useEffect(() => {
    onDateChange({ singleDate, startDate, endDate, tripType });
  }, [singleDate, startDate, endDate, tripType, onDateChange]);

  const handleSingleDateChange = (date) => {
    startTransition(() => {
      setSingleDate(date);
    });
  };

  const handleStartDateChange = ([selectedStartDate, selectedEndDate]) => {
    startTransition(() => {
      setStartDate(selectedStartDate);
      setEndDate(selectedEndDate);
    });
  };

  return (
    <div>
      <button className='datepicker_toggle_button' onClick={() => startTransition(() => setToggle(!toggle))}>
        {toggle ? 'Round-Trip' : 'One-Way'}
      </button>
      <div className='datepicker_container'>
        {toggle ? (
          <div>
            <DatePicker
              dateFormat={'yyyy-MM-dd'}
              endDate={endDate}
              isClearable
              locale='en-GB'
              minDate={new Date('2022-12-26')}
              maxDate={new Date('2023-01-05')}
              onChange={handleStartDateChange}
              placeholderText='Departure date...'
              selected={startDate}
              selectsRange
              startDate={startDate}
            />
          </div>
        ) : (
          <div>
            <DatePicker
              className='singleDate'
              dateFormat={'yyyy-MM-dd'}
              isClearable
              onChange={handleSingleDateChange}
              minDate={new Date('2022-12-26')}
              maxDate={new Date('2023-01-05')}
              placeholderText='Departure date...'
              selected={singleDate}
            />{' '}
          </div>
        )}
      </div>
    </div>
  );
}