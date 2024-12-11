<?php
    include "database.php";

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand">CPSC 332 Group Project</a>
          <div class="navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.html"
                  >Home</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link active"
                  aria-current="page"
                  href="professors.html"
                  >Professor</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link active"
                  aria-current="page"
                  href="students.html"
                  >Student</a
                >
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <header class="text-center container">
        <p class="display-1">CPSC 332</p>
        <p class="display-6">Student CWID Query</p>
      </header>

        <div class="card mt-5">
          <div class="card-body">
            <h5 class="card-title">Back to Home page</h5>
            <p class="card-text">
              To go back to the main page, click the button below.
            </p>
            <a href="index.html" class="btn btn-primary">Main</a>
          </div>
        </div>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $cwid = filter_input(INPUT_POST, 'cwid', FILTER_SANITIZE_SPECIAL_CHARS);

            // Enter the SQL query here
            // First check if the CWID exists in students table
            $check_student = "SELECT cwid FROM students WHERE cwid = '$cwid'";
            $student_result = mysqli_query($conn, $check_student);

            if (mysqli_num_rows($student_result) > 0) {
                // CWID exists, proceed with course query
                $sql = "SELECT c.course_id, c.course_title, cs.section_number, e.grade 
                    FROM enrollment e
                    JOIN course_sections cs ON e.course_number = cs.course_number
                    JOIN courses c ON cs.course_id = c.course_id
                    WHERE e.cwid = '$cwid'";

                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    echo '<div class="card mt-5">';
                    echo '<div class="card-body">';
                    echo '<h5 class="card-title">Course Information for CWID: ' . htmlspecialchars($cwid) . '</h5>';
                    echo '<table class="table">';
                    echo '<thead><tr><th>Course ID</th><th>Course Title</th><th>Section</th><th>Grade</th></tr></thead>';
                    echo '<tbody>';

                    while($row = mysqli_fetch_assoc($result)) {
                        echo '<tr>';
                        echo '<td>' . htmlspecialchars($row['course_id']) . '</td>';
                        echo '<td>' . htmlspecialchars($row['course_title']) . '</td>';
                        echo '<td>' . htmlspecialchars($row['section_number']) . '</td>';
                        echo '<td>' . htmlspecialchars($row['grade']) . '</td>';
                        echo '</tr>';
                    }

                    echo '</tbody></table>';
                    echo '</div></div>';
                } else {
                    echo '<div class="card mt-5">';
                    echo '<div class="card-body">';
                    echo '<h5 class="card-title">No courses found</h5>';
                    echo '<p class="card-text">No course records found for CWID: ' . htmlspecialchars($cwid) . '</p>';
                    echo '</div></div>';
                }
            } else {
                // CWID not found in database
                echo '<div class="card mt-5">';
                echo '<div class="card-body">';
                echo '<h5 class="card-title">CWID Not Found</h5>';
                echo '<p class="card-text">The CWID you entered is not found in the database.</p>';
                echo '</div></div>';
            }


            mysqli_close($conn);
		}
        ?>

      </div>
  </body>
</html>

