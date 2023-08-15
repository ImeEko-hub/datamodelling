CREATE TABLE dim_Pickup_Dates(
	Pickup_date DATE NOT NULL
	, Year INT NOT NULL
	, Month INT NOT NULL
	, Day INT NOT NULL	
);

ALTER TABLE dim_Pickup_Dates
ADD COLUMN id INT PRIMARY KEY NOT NULL;

ALTER TABLE dim_Pickup_Dates
RENAME id TO Pickup_Dates_id;


CREATE TABLE dim_Return_Dates(
	Return_date DATE NULL
	, Year INT  
	, Month INT 
	, Day INT 
);

ALTER TABLE dim_Return_Dates
ADD COLUMN id INT PRIMARY KEY NOT NULL;


ALTER TABLE dim_Return_Dates  
ALTER COLUMN   
return_date DROP NOT NULL;  

ALTER TABLE dim_Return_Dates
RENAME id TO Return_Dates_id;	


CREATE TABLE dim_Renters(
	Renter_id INT PRIMARY KEY NOT NULL
	, Full_name VARCHAR NOT NULL
	, Email VARCHAR NOT NULL
	, Phone_number VARCHAR NOT NULL	
);


CREATE TABLE dim_Cars(
	Car_id INT PRIMARY KEY NOT NULL
	, Car_model VARCHAR NOT NULL
	, Car_cost_price INT NOT NULL
	, Car_rating DECIMAL (10,2) NOT NULL	
);


CREATE TABLE ft_Car_rentals(
	Renter_id INT REFERENCES dim_Renters(Renter_id)
	, Car_id INT REFERENCES dim_Cars(Car_id)
	, Pickup_Dates_id INT REFERENCES dim_Pickup_Dates(Pickup_Dates_id)
	, Return_Dates_id INT REFERENCES dim_Return_Dates(Return_Dates_id)
	, Return_status VARCHAR NOT NULL
	, Is_Car_Available_For_Rent VARCHAR NOT NULL
	, Price_per_hour INT NOT NULL
	, Total_rent_hours INT NOT NULL
);






INSERT INTO dim_renters(
	renter_id
	, full_name
	, email
	, phone_number
)
VALUES (1, 'Chris Lucas', 'chris.lucas001@mail.co', '345-500-992276');

INSERT INTO dim_renters(
	renter_id
	, full_name
	, email
	, phone_number
)
VALUES (2, 'Ben Reels', 'ben4reel@yahoo.com', '442-211-144566');

INSERT INTO dim_renters(
	renter_id
	, full_name
	, email
	, phone_number
)
VALUES (3, 'Karen Shipsman', 'k.shipsman@yahoo.co.uk', '656-344-343456');

INSERT INTO dim_renters(
	renter_id
	, full_name
	, email
	, phone_number
)
VALUES (4, 'Loren Thomas', 'nowyouknow@email.com', '345-687-989898');
select * from dim_renters;

ALTER TABLE dim_cars
DROP COLUMN car_rating;

ALTER TABLE ft_Car_rentals
ADD COLUMN Car_rating DECIMAL (10,2) NOT NULL;

INSERT INTO dim_cars(
	car_id
	, car_model
	, car_cost_price
)
VALUES (1, 'Toyota Vios 1.5 GAT White Pearl', '38000');

INSERT INTO dim_cars(
	car_id
	, car_model
	, car_cost_price
)
VALUES (2, 'Toyota Yaris 1.3 E MT', '42000');

INSERT INTO dim_cars(
	car_id
	, car_model
	, car_cost_price
)
VALUES (3, 'Toyota FJ Cruiser 4.0 V6', '35000');
select * from dim_cars;

INSERT INTO dim_pickup_dates(
	pickup_date
	, year
	, month
	, day
	, pickup_dates_id
)
VALUES ('2022-10-03', '2022', '10', '03', 1);
select * from dim_pickup_dates;

INSERT INTO dim_pickup_dates(
	pickup_date
	, year
	, month
	, day
	, pickup_dates_id
)
VALUES ('2022-10-03', '2022', '10', '03', 2);

INSERT INTO dim_pickup_dates(
	pickup_date
	, year
	, month
	, day
	, pickup_dates_id
)
VALUES ('2022-10-06', '2022', '10', '06', 3);

INSERT INTO dim_pickup_dates(
	pickup_date
	, year
	, month
	, day
	, pickup_dates_id
)
VALUES ('2022-10-08', '2022', '10', '08', 4);

INSERT INTO dim_pickup_dates(
	pickup_date
	, year
	, month
	, day
	, pickup_dates_id
)
VALUES ('2022-10-08', '2022', '10', '08', 5);


INSERT INTO dim_return_dates(
	return_date
	, year
	, month
	, day
	, return_dates_id
)
VALUES ('2022-10-04', '2022', '10', '04', 1);

INSERT INTO dim_return_dates(
	return_date
	, year
	, month
	, day
	, return_dates_id
)
VALUES ('2022-10-04', '2022', '10', '04', 2);

INSERT INTO dim_return_dates(
	return_date
	, year
	, month
	, day
	, return_dates_id
)
VALUES ('2022-10-06', '2022', '10', '06', 3);

INSERT INTO dim_return_dates(
	return_dates_id
)
VALUES (4);

INSERT INTO dim_return_dates(
	return_date
	, year
	, month
	, day
	, return_dates_id
)
VALUES ('2022-10-09', '2022', '10', '09', 5);
select * from dim_return_dates;


INSERT INTO ft_car_rentals(
	renter_id
	, car_id
	, pickup_dates_id
	, return_dates_id
	, return_status
	, is_car_available_for_rent
	, price_per_hour
	, total_rent_hours
	, car_rating
)
VALUES ('1', '1', '1', '1', 'Returned', 'Yes', '50', '16', '3.5');

INSERT INTO ft_car_rentals(
	renter_id
	, car_id
	, pickup_dates_id
	, return_dates_id
	, return_status
	, is_car_available_for_rent
	, price_per_hour
	, total_rent_hours
	, car_rating
)
VALUES ('2', '2', '2', '2', 'Returned', 'Yes', '42', '20', '5');

INSERT INTO ft_car_rentals(
	renter_id
	, car_id
	, pickup_dates_id
	, return_dates_id
	, return_status
	, is_car_available_for_rent
	, price_per_hour
	, total_rent_hours
	, car_rating
)
VALUES ('3', '3', '3', '3', 'Returned', 'Yes', '25', '5', '5');

INSERT INTO ft_car_rentals(
	renter_id
	, car_id
	, pickup_dates_id
	, return_dates_id
	, return_status
	, is_car_available_for_rent
	, price_per_hour
	, total_rent_hours
	, car_rating
)
VALUES ('4', '2', '4', '4', 'Not_Returned', 'No', '42', '12', '4');

INSERT INTO ft_car_rentals(
	renter_id
	, car_id
	, pickup_dates_id
	, return_dates_id
	, return_status
	, is_car_available_for_rent
	, price_per_hour
	, total_rent_hours
	, car_rating
)
VALUES ('3', '1', '5', '5', 'Returned', 'Yes', '50', '14', '4');