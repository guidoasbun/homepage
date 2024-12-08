DROP DATABASE CPSC332DB;
CREATE DATABASE CPSC332DB;
USE CPSC332DB;

CREATE TABLE professors (
    ssn CHAR(9) PRIMARY KEY ,
    first_Name VARCHAR(50),
    last_Name VARCHAR(50),
    address_street VARCHAR(100),
    address_city VARCHAR(50),
    address_state VARCHAR(2),
    address_zip CHAR(5),
    tel_area_code CHAR(3),
    tel_number CHAR(7),
    sex VARCHAR(25),
    title VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE professor_degrees (
    degree_id INT PRIMARY KEY AUTO_INCREMENT,
    ssn VARCHAR(9) NOT NULL,
    degree_name VARCHAR(100) NOT NULL ,
    FOREIGN KEY (ssn) REFERENCES professors(ssn)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    department_phone VARCHAR(10),
    department_location VARCHAR(100),
    department_chair VARCHAR(9),
    FOREIGN KEY (department_chair) REFERENCES professors(ssn) ON DELETE SET NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_title VARCHAR(100) NOT NULL UNIQUE,
    units INT(2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(department_id)
);

CREATE TABLE course_prerequisites (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    prerequisite_course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (prerequisite_course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE textbooks (
    isbn CHAR(13) PRIMARY KEY ,
    title VARCHAR(100) NOT NULL ,
    edition VARCHAR(50)
);

CREATE TABLE course_textbooks (
    course_id INT NOT NULL,
    isbn CHAR(13) NOT NULL,
    PRIMARY KEY (course_id, isbn),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (isbn) REFERENCES textbooks(isbn)
);

CREATE TABLE course_sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    section_number INT NOT NULL ,
    classroom VARCHAR(50),
    seats INT(3) NOT NULL,
    meeting_days VARCHAR(50),
    start_time TIME,
    end_time TIME,
    professor CHAR(9),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (professor) REFERENCES professors(ssn)
);

CREATE TABLE students (
    cwid CHAR(9) PRIMARY KEY,
    first_Name VARCHAR(50) NOT NULL,
    last_Name VARCHAR(20) NOT NULL,
    address_street VARCHAR(100),
    address_city VARCHAR(50),
    address_state VARCHAR(2),
    address_zip CHAR(5),
    telephone_area_code CHAR(3),
    telephone_number CHAR(7),
    major_dept INT NOT NULL ,
    FOREIGN KEY (major_dept) REFERENCES departments(department_id)
);

CREATE TABLE student_minors (
    cwid CHAR(9) NOT NULL,
    minor_dept_id INT,
    PRIMARY KEY (cwid, minor_dept_id),
    FOREIGN KEY (cwid) REFERENCES students(cwid),
    FOREIGN KEY (minor_dept_id) REFERENCES departments(department_id)
);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    cwid CHAR(9) NOT NULL,
    section_id INT NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (cwid) REFERENCES students(cwid) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES course_sections(section_id) ON DELETE CASCADE
);
