-- Karrington Hall
-- Creates the Payments Table to store Payment data
CREATE TABLE Payments (
  -- Unique ID for each payment (auto-incremented primary key) 
  payment_id INT AUTO_INCREMENT PRIMARY KEY, 

  -- ID of the user making the payment (must exit in User Table)
  user_id INT NOT NULL,

  -- ID of the rental associated with the payment (must exit in Rentals Table)
  rental_id INT NOT NULL,

  -- Amount paid; uses DECMIAL to store dollars and cents must be greater than or equal to 0
  amount DECIMAL (10,2) NOT NULL CHECK (amount >= 0),

  -- Date when the payment was made
  payment_date DATE NOT NULL, 

-- Foreign Key: user_id must match an existing user in the Users table
CONSTRAINT fk_payment_user FOREIGN KEY (user_id)
  REFERENCES Users(user_id)
  -- If a user is deleted, also delete their payments
  ON DELETE CASCADE,

-- Foreign Key: rental_id must match an existing rental in the Rentals Table
CONSTRAINT fk_payment_rental FOREIGN KEY (rental_id) 
  REFERENCES Rentals(rental_id)
  -- If a rental is deleted, also delete related payments
  ON DELETE CASCADE
);
