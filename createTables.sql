USE cs332g1;

CREATE TABLE professor(
    ssn INT(9) PRIMARY KEY,
    f_Name VARCHAR(20),
    l_Name VARCHAR(20),
    street_address VARCHAR(75),
    city VARCHAR(25),
    state VARCHAR(15),
    zip INT(5),
    area_code INT(3),
    tel_number INT(7),
    sex VARCHAR(25),
    title VARCHAR(50),
    salary DECIMAL(5,2),
    college_degrees VARCHAR(100)
);

CREATE TABLE students(
    
);