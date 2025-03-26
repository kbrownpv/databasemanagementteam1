-- SARAH LAMAR
CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each rental record
    device_id INT,                             -- ID of the device being rented
    user_id INT,                               -- ID of the user renting the device
    rental_date DATE NOT NULL,                 -- Date when the rental started (required field)
    return_date DATE NULL,                     -- Date when the rental ended (nullable, can be left empty)
    is_returned BOOLEAN DEFAULT FALSE,         -- Flag indicating whether the device has been returned (default is false)
    rental_status VARCHAR(50) NOT NULL,        -- Current status of the rental (e.g., 'Pending', 'Completed')
    comments VARCHAR(255) NULL,                -- Additional comments about the rental (nullable)
    notes VARCHAR(500) NULL,                   -- Optional additional notes (nullable, up to 500 characters)
    FOREIGN KEY (device_id) REFERENCES Devices(device_id),  -- Link to the Devices table
    FOREIGN KEY (user_id) REFERENCES Users(user_id)         -- Link to the Users table
);
