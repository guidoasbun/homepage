USE CPSC332DB;

INSERT INTO professors (ssn, first_Name, last_Name, address_street, address_city, address_state, address_zip, tel_area_code, tel_number, sex, title, salary)
VALUES
    ('123456789', 'John', 'Doe', '123 Main St', 'Irvine', 'CA', '92612', '949', '1234567', 'Male', 'Professor', 90000.00),
    ('234567890', 'Jane', 'Smith', '456 Elm St', 'Los Angeles', 'CA', '90001', '310', '7654321', 'Female', 'Associate Professor', 75000.00),
    ('345678901', 'Alan', 'Brown', '789 Pine St', 'San Diego', 'CA', '92101', '619', '9876543', 'Male', 'Assistant Professor', 60000.00),
    ('456789012', 'Susan', 'Davis', '101 Oak St', 'Fresno', 'CA', '93701', '559', '6543210', 'Female', 'Lecturer', 55000.00),
    ('567890123', 'Michael', 'Lee', '202 Maple St', 'Sacramento', 'CA', '94203', '916', '7654321', 'Male', 'Professor', 92000.00),
    ('678901234', 'Emily', 'Clark', '303 Cherry St', 'San Jose', 'CA', '95112', '408', '8765432', 'Female', 'Lecturer', 58000.00);

INSERT INTO professor_degrees (ssn, degree_name)
VALUES
    ('123456789', 'PhD in Computer Science'),
    ('123456789', 'MSc in Mathematics'),
    ('234567890', 'PhD in Mathematics'),
    ('345678901', 'PhD in Physics'),
    ('456789012', 'MSc in Education'),
    ('567890123', 'PhD in Electrical Engineering'),
    ('567890123', 'MSc in Mechanical Engineering'),
    ('678901234', 'PhD in Chemistry'),
    ('678901234', 'MSc in Biochemistry');


INSERT INTO departments (department_name, department_phone, department_location, department_chair)
VALUES
    ('Computer Science', '9491234567', 'Computer Science', '123456789'),
    ('Mathematics', '3107654321', 'McCarthy Hall', '234567890'),
    ('Physics', '6199876543', 'Engineering', '345678901'),
    ('Engineering', '5596543210', 'Engineering', '567890123');

INSERT INTO courses (course_id, course_title, units, dept_id)
VALUES
    ('CPSC101', 'Introduction to Programming', 3, 1),  -- Computer Science Department
    ('CPSC201', 'Data Structures', 3, 1),              -- Computer Science Department
    ('CPSC301', 'Algorithms', 4, 1),                   -- Computer Science Department
    ('MATH101', 'Calculus I', 4, 2),                   -- Mathematics Department
    ('MATH201', 'Linear Algebra', 3, 2),               -- Mathematics Department
    ('PHYS101', 'Classical Mechanics', 4, 3),          -- Physics Department
    ('PHYS201', 'Quantum Physics', 4, 3),              -- Physics Department
    ('ENGR101', 'Circuit Analysis', 3, 4),             -- Engineering Department
    ('ENGR201', 'Thermodynamics', 4, 4);               -- Engineering Department


-- Insert dummy data into course_prerequisites
INSERT INTO course_prerequisites (course_id, prerequisite_course_id)
VALUES
    ('CPSC201', 'CPSC101'), -- Data Structures requires Introduction to Programming
    ('CPSC301', 'CPSC201'), -- Algorithms requires Data Structures
    ('MATH201', 'MATH101'), -- Linear Algebra requires Calculus I
    ('PHYS101', 'MATH101'), -- Classical Mechanics requires Calculus I
    ('PHYS201', 'PHYS101'), -- Quantum Physics requires Classical Mechanics
    ('ENGR201', 'ENGR101'); -- Thermodynamics requires Circuit Analysis

INSERT INTO textbooks (isbn, title, edition)
VALUES
    ('9780134093413', 'Introduction to Programming with Java', '4th'),
    ('9780262033848', 'Introduction to Algorithms', '3rd'),
    ('9780134685991', 'Data Structures and Algorithm Analysis in Java', '3rd'),
    ('9780321570567', 'Calculus: Early Transcendentals', '10th'),
    ('9780321997056', 'Linear Algebra and Its Applications', '5th'),
    ('9781107189638', 'Classical Mechanics', '2nd'),
    ('9780470050995', 'Quantum Mechanics: Concepts and Applications', '2nd'),
    ('9780195117074', 'Electrical Engineering: Principles and Applications', '6th'),
    ('9780134743356', 'Fundamentals of Electric Circuits', '6th'),
    ('9781492037255', 'Python for Data Science', '2nd');

INSERT INTO course_textbooks (course_id, isbn)
VALUES
('CPSC101', '9780134093413'), -- Introduction to Programming with Java
('CPSC201', '9780134685991'), -- Data Structures and Algorithm Analysis in Java
('CPSC201', '9780262033848'), -- Introduction to Algorithms
('CPSC301', '9780262033848'), -- Introduction to Algorithms
('MATH101', '9780321570567'), -- Calculus: Early Transcendentals
('MATH201', '9780321997056'), -- Linear Algebra and Its Applications
('PHYS101', '9781107189638'), -- Classical Mechanics
('PHYS201', '9780470050995'), -- Quantum Mechanics: Concepts and Applications
('ENGR101', '9780195117074'), -- Electrical Engineering: Principles and Applications
('ENGR101', '9780134743356'), -- Fundamentals of Electric Circuits
('ENGR201', '9780134743356'); -- Fundamentals of Electric Circuits (also used in Circuit Analysis)


INSERT INTO course_sections (course_number, course_id, section_number, classroom, seats, meeting_days, start_time, end_time, professor)
VALUES
    -- CPSC101 (Intro to Programming) has 3 sections
    ('10453', 'CPSC101', '01', 'Room A101', 30, 'MWF', '09:00:00', '10:15:00', '123456789'),
    ('20398', 'CPSC101', '02', 'Room A102', 25, 'TTh', '11:00:00', '12:15:00', '234567890'),
    ('30157', 'CPSC101', '03', 'Room A103', 28, 'MWF', '14:00:00', '15:15:00', '345678901'),

    -- CPSC201 (Data Structures) has 2 sections
    ('39842', 'CPSC201', '01', 'Room B201', 35, 'MWF', '13:00:00', '14:15:00', '345678901'),
    ('40891', 'CPSC201', '02', 'Room B202', 35, 'TTh', '15:30:00', '16:45:00', '123456789'),

    -- MATH101 (Calculus I) has 3 sections due to high demand
    ('50219', 'MATH101', '01', 'Room B202', 40, 'TTh', '10:30:00', '11:45:00', '456789012'),
    ('61234', 'MATH101', '02', 'Room C301', 20, 'MWF', '15:00:00', '16:15:00', '567890123'),
    ('71235', 'MATH101', '03', 'Room C302', 35, 'TTh', '13:00:00', '14:15:00', '234567890'),

    -- PHYS101 (Classical Mechanics) has 2 sections
    ('78234', 'PHYS101', '01', 'Room C302', 25, 'TTh', '14:00:00', '15:15:00', '678901234'),
    ('79234', 'PHYS101', '02', 'Room C303', 25, 'MWF', '10:30:00', '11:45:00', '345678901'),

    -- Single sections for upper division courses
    ('89213', 'PHYS201', '01', 'Room D401', 30, 'MWF', '11:00:00', '12:15:00', '123456789'),
    ('90123', 'ENGR101', '01', 'Room E501', 20, 'TTh', '15:30:00', '16:45:00', '234567890'),
    ('11234', 'ENGR201', '01', 'Room E502', 25, 'MWF', '14:00:00', '15:15:00', '678901234');


INSERT INTO students (cwid, first_Name, last_Name, address_street, address_city, address_state, address_zip, telephone_area_code, telephone_number, major_dept)
VALUES
    ('134578943', 'Alice', 'Brown', '101 Maple St', 'Irvine', 'CA', '92612', '949', '1234567', 1), -- Computer Science
    ('287654321', 'Bob', 'Smith', '102 Oak St', 'Los Angeles', 'CA', '90001', '310', '2345678', 2), -- Mathematics
    ('987654320', 'Charlie', 'Davis', '103 Pine St', 'San Diego', 'CA', '92101', '619', '3456789', 3), -- Physics
    ('453267891', 'Diana', 'Evans', '104 Elm St', 'Fresno', 'CA', '93701', '559', '4567890', 4), -- Engineering
    ('572894165', 'Edward', 'Green', '105 Cedar St', 'Sacramento', 'CA', '94203', '916', '5678901', 1), -- Computer Science
    ('394751286', 'Fiona', 'Harris', '106 Birch St', 'San Jose', 'CA', '95112', '408', '6789012', 2), -- Mathematics
    ('826371459', 'George', 'Ingram', '107 Spruce St', 'Irvine', 'CA', '92612', '949', '7890123', 3), -- Physics
    ('562834791', 'Hannah', 'Johnson', '108 Redwood St', 'Los Angeles', 'CA', '90001', '310', '8901234', 4), -- Engineering
    ('978216543', 'Ian', 'Kelly', '109 Cypress St', 'San Diego', 'CA', '92101', '619', '9012345', 1), -- Computer Science
    ('482916738', 'Jill', 'Martin', '110 Chestnut St', 'Sacramento', 'CA', '94203', '916', '0123456', 2), -- Mathematics
    ('192837465', 'Kevin', 'Nelson', '111 Hickory St', 'San Jose', 'CA', '95112', '408', '1234567', 3), -- Physics
    ('362948571', 'Laura', 'Owens', '112 Aspen St', 'Fresno', 'CA', '93701', '559', '2345678', 4), -- Engineering
    ('725891643', 'Michael', 'Perez', '113 Dogwood St', 'Irvine', 'CA', '92612', '949', '3456789', 1), -- Computer Science
    ('936274815', 'Nina', 'Quinn', '114 Alder St', 'Los Angeles', 'CA', '90001', '310', '4567890', 2), -- Mathematics
    ('583729461', 'Oscar', 'Reed', '115 Willow St', 'San Diego', 'CA', '92101', '619', '5678901', 3), -- Physics
    ('491728365', 'Paula', 'Smith', '116 Elm St', 'Sacramento', 'CA', '94203', '916', '6789012', 4); -- Engineering

INSERT INTO enrollment (cwid, course_number, grade) VALUES
    -- Enrollments in CPSC101 sections
    ('134578943', '10453', 'A'),    -- Section 01
    ('287654321', '20398', 'B+'),   -- Section 02
    ('987654320', '30157', 'B'),    -- Section 03
    ('453267891', '10453', 'A-'),   -- Section 01

    -- Enrollments in CPSC201 sections
    ('572894165', '39842', 'B'),    -- Section 01
    ('394751286', '40891', 'C+'),   -- Section 02
    ('826371459', '39842', 'B-'),   -- Section 01
    ('134578943', '39842', 'A+'),

    -- Enrollments in MATH101 sections
    ('562834791', '50219', 'C-'),   -- Section 01
    ('978216543', '61234', 'B+'),   -- Section 02
    ('482916738', '71235', 'A-'),   -- Section 03
    ('192837465', '50219', 'B'),    -- Section 01

    -- Enrollments in PHYS101 sections
    ('362948571', '78234', 'B+'),   -- Section 01
    ('725891643', '79234', 'A'),    -- Section 02

    -- Enrollments in other courses (single sections)
    ('936274815', '89213', 'B+'),   -- PHYS201 Section 01
    ('583729461', '90123', 'B'),    -- ENGR101 Section 01
    ('491728365', '11234', 'A');    -- ENGR201 Section 01

