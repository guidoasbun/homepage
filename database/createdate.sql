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


INSERT INTO courses (course_title, units, dept_id)
VALUES
    ('Introduction to Programming', 3, 1),
    ('Data Structures', 3, 1),
    ('Algorithms', 4, 1),
    ('Calculus I', 4, 2),
    ('Linear Algebra', 3, 2),
    ('Classical Mechanics', 4, 3),
    ('Quantum Physics', 4, 3),
    ('Circuit Analysis', 3, 4);

INSERT INTO course_prerequisites (id, course_id, prerequisite_course_id)
VALUES
    (1, 2, 1), -- Data Structures requires Introduction to Programming
    (2, 3, 2), -- Algorithms requires Data Structures
    (3, 5, 4), -- Linear Algebra requires Calculus I
    (4, 6, 5), -- Classical Mechanics requires Linear Algebra
    (5, 7, 6), -- Quantum Physics requires Classical Mechanics
    (6, 8, 5); -- Circuit Analysis requires Linear Algebra


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
    (1, '9780134093413'), -- Introduction to Programming requires "Introduction to Programming with Java"
    (2, '9780134685991'), -- Data Structures requires "Data Structures and Algorithm Analysis in Java"
    (2, '9780262033848'), -- Data Structures also requires "Introduction to Algorithms"
    (3, '9780262033848'), -- Algorithms requires "Introduction to Algorithms"
    (4, '9780321570567'), -- Calculus I requires "Calculus: Early Transcendentals"
    (5, '9780321997056'), -- Linear Algebra requires "Linear Algebra and Its Applications"
    (6, '9781107189638'), -- Classical Mechanics requires "Classical Mechanics"
    (7, '9780470050995'), -- Quantum Physics requires "Quantum Mechanics: Concepts and Applications"
    (8, '9780195117074'), -- Circuit Analysis requires "Electrical Engineering: Principles and Applications"
    (8, '9780134743356'), -- Circuit Analysis also requires "Fundamentals of Electric Circuits"
    (2, '9781492037255'), -- Data Structures also uses "Python for Data Science"
    (3, '9781492037255'); -- Algorithms also uses "Python for Data Science"


INSERT INTO course_sections (course_id, section_number, classroom, seats, meeting_days, start_time, end_time, professor)
VALUES
    (1, 101, 'CS101', 30, 'MWF', '09:00:00', '10:15:00', '123456789'), -- Introduction to Programming, taught by John Doe
    (1, 102, 'CS102', 25, 'TTh', '11:00:00', '12:15:00', '678901234'), -- Introduction to Programming, taught by Emily Clark
    (2, 103, 'CS103', 30, 'MWF', '13:00:00', '14:15:00', '234567890'), -- Data Structures, taught by Jane Smith
    (2, 104, 'CS201', 35, 'MWF', '08:00:00', '09:15:00', '123456789'), -- Data Structures, taught by John Doe
    (3, 105, 'CS202', 40, 'TTh', '10:30:00', '11:45:00', '234567890'), -- Algorithms, taught by Jane Smith
    (4, 106, 'C301', 20, 'MWF', '15:00:00', '16:15:00', '345678901'), -- Calculus I, taught by Alan Brown
    (4, 107, 'C302', 25, 'TTh', '14:00:00', '15:15:00', '345678901'), -- Calculus I, taught by Alan Brown
    (5, 108, 'D401', 30, 'MWF', '11:00:00', '12:15:00', '456789012'), -- Linear Algebra, taught by Susan Davis
    (6, 109, 'D402', 25, 'TTh', '13:00:00', '14:15:00', '567890123'), -- Classical Mechanics, taught by Michael Lee
    (7, 110, 'E501', 40, 'MWF', '09:30:00', '10:45:00', '567890123'), -- Quantum Physics, taught by Michael Lee
    (8, 111, 'E502', 20, 'TTh', '15:30:00', '16:45:00', '678901234'), -- Circuit Analysis, taught by Emily Clark
    (8, 112, 'E503', 25, 'MWF', '14:00:00', '15:15:00', '678901234'); -- Circuit Analysis, taught by Emily Clark


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


INSERT INTO enrollment (enrollment_id, cwid, section_id, grade)
VALUES
    (1, '134578943', 1, 'A'),
    (2, '287654321', 2, 'B+'),
    (3, '987654320', 3, 'C'),
    (4, '453267891', 4, 'A-'),
    (5, '572894165', 5, 'B'),
    (6, '394751286', 6, 'C+'),
    (7, '826371459', 7, 'B-'),
    (8, '562834791', 8, 'C-'),
    (9, '978216543', 1, 'D+'),
    (10, '482916738', 2, 'D'),
    (11, '192837465', 3, 'D-'),
    (12, '362948571', 4, 'F'),
    (13, '725891643', 5, 'A+'),
    (14, '936274815', 6, 'B+'),
    (15, '583729461', 7, 'B'),
    (16, '491728365', 8, 'A'),
    (17, '134578943', 2, 'C+'),
    (18, '287654321', 3, 'A'),
    (19, '987654320', 4, 'A-'),
    (20, '453267891', 5, 'B-'),
    (21, '572894165', 6, 'C'),
    (22, '394751286', 7, 'A'),
    (23, '826371459', 8, 'D'),
    (24, '562834791', 1, 'B+'),
    (25, '978216543', 2, 'A-'),
    (26, '482916738', 3, 'F'),
    (27, '192837465', 4, 'B+'),
    (28, '362948571', 5, 'C-'),
    (29, '725891643', 6, 'A'),
    (30, '936274815', 7, 'D-'),
    (31, '583729461', 8, 'C'),
    (32, '491728365', 1, 'A'),
    (33, '134578943', 3, 'A+'),
    (34, '287654321', 4, 'C+'),
    (35, '987654320', 5, 'B'),
    (36, '453267891', 6, 'A-'),
    (37, '572894165', 7, 'C'),
    (38, '394751286', 8, 'B-'),
    (39, '826371459', 1, 'D'),
    (40, '562834791', 2, 'F');
