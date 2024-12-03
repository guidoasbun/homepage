CREATE TABLE professors (
    CONSTRAINT professor_id PRIMARY KEY (ssn),
    ssn char(9) UNIQUE,
    f_Name VARCHAR(20),
    l_Name VARCHAR(20),
    address_street VARCHAR(75),
    address_city VARCHAR(25),
    address_state VARCHAR(30),
    address_zip CHAR(5),
    tel_area_code CHAR(3),
    tel_number CHAR(7),
    sex VARCHAR(25),
    title VARCHAR(50),
    salary DECIMAL(8,2)
);

CREATE TABLE college_degrees (
    ssn char(9) NOT NULL,
    degree_name VARCHAR(100) PRIMARY KEY NOT NULL,
    CONSTRAINT college_degrees PRIMARY KEY (ssn, degree_name),
    FOREIGN KEY (ssn) REFERENCES professors(ssn)
);

CREATE TABLE department (
    dept_id VARCHAR(4) PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) UNIQUE,
    dept_tel VARCHAR(10),
    dept_building VARCHAR(100),
    dept_chair INT,
    FOREIGN KEY (dept_chair) REFERENCES professors(professor_id)
);

CREATE TABLE textbook (
    isbn INT PRIMARY KEY,
    text_title VARCHAR(40),
    author_fn VARCHAR(20),
    author_ln VARCHAR(20),
    coauthor_fn VARCHAR(20),
    coauthor_ln VARCHAR(20)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_title VARCHAR(40),
    textbook_name VARCHAR(40),
    unit INT,
    isbn INT(13),
    dept INT,
    FOREIGN KEY (isbn) REFERENCES textbook(isbn),
    FOREIGN KEY (dept) REFERENCES department(dept_id)
);

CREATE TABLE course_prerequisites (
    course_id INT,
    prereq_course_id INT,
    PRIMARY KEY (course_id, prereq_course_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prereq_course_id) REFERENCES course(course_id)
);

CREATE TABLE course_sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    section_number INT,
    sec_building VARCHAR(25),
    sec_classroom INT,
    seat_max INT,
    meeting_day VARCHAR(50),
    start_time TIME,
    end_time TIME,
    professor INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (professor) REFERENCES professors(professor_id)
);

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    cwid CHAR(9) UNIQUE,
    f_Name VARCHAR(20),
    l_Name VARCHAR(20),
    address_street VARCHAR(75),
    address_city VARCHAR(25),
    address_state VARCHAR(15),
    address_zip INT,
    tel_area_code CHAR(3),
    tel_number CHAR(7),
    major_dept INT,
    FOREIGN KEY (major_dept) REFERENCES department(dept_id)
);

CREATE TABLE SMinors (
    student_id INT,
    dept_id INT,
    PRIMARY KEY (student_id, dept_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    section_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (section_id) REFERENCES course_sections(section_id)
);

CREATE TABLE college_degrees (
    degree_id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT,
    degree_name VARCHAR(100),
    institution VARCHAR(100),
    year_awarded INT,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);