import axios from "axios";
import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

export default function AddUser() {
  let navigate = useNavigate();

  const [user, setUser] = useState({
    name: "",
    username: "",
    email: "",
  });

  const { name, username, email } = user;

  const onInputChange = (ev) => {
    setUser({ ...user, [ev.target.name]: ev.target.value });
  };

  const onSubmit = async (ev) => {
    ev.preventDefault();
    await axios.post("http://localhost:8080/user", user);
    navigate("/");
  };

  return (
    <div className="container">
      <div className="row">
        <div className="col-md-6 offset-md-3 border rounded p-4 mt-2 shadow">
          <h2 className="text-center m-4">Search for flight!</h2>
          <form onSubmit={(ev) => onSubmit(ev)}>
            <div className="mb-3">
              <label htmlFor="Name" className="form-label">
                Departing Airport
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter Airport"
                name="name"
                value={name}
                onChange={(ev) => onInputChange(ev)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Name" className="form-label">
                Destination Airport
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter destination airport"
                name="username"
                value={username}
                onChange={(ev) => onInputChange(ev)}
              />
            </div>
            <div className="mb-3">
              <label htmlFor="Name" className="form-label">
                Flight#
              </label>
              <input
                type={"text"}
                className="form-control"
                placeholder="Enter enter flight number"
                name="email"
                value={email}
                onChange={(ev) => onInputChange(ev)}
              />
            </div>
            <button type="submit" className="btn btn-outline-primary">
              Search & Add
            </button>
            <Link className="btn btn-outline-danger mx-2" to="/">
              Cancel
            </Link>
          </form>
        </div>
      </div>
    </div>
  );
}
