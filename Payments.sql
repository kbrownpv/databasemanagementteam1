-- Karrington Hall
CREATE TABLE Payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  rental_id INT NOT NULL,
  amount DECIMAL (10,2) NOT NULL CHECK (amount > 0),
  payment_date DATE NOT NULL, 

  -- Foreign Key Constraints
CONSTRAINT fk_payment_user FOREIGN KEY (user_id)
  REFERENCES Users(user_id)
  ON DELETE CASCADE,

CONSTRAINT fk_payment_rental FOREIGN KEY (rental_id) 
  REFERENCES Rentals(rental_id)
  ON DELETE CASCADE
);
