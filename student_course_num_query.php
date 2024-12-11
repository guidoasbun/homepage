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
        <p class="display-6">Student Course Query</p>
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
            $courseNum = filter_input(INPUT_POST, 'courseNum', FILTER_SANITIZE_SPECIAL_CHARS);
            echo "The course number you entered is: {$courseNum} <br>";
            $query = "
                SELECT 
                    cs.section_number, 
                    cs.classroom, 
                    cs.meeting_days, 
                    CONCAT(cs.start_time, ' - ', cs.end_time) AS meeting_time, 
                    COUNT(e.cwid) AS num_students_enrolled
                FROM 
                    course_sections cs
                LEFT JOIN 
                    enrollment e 
                ON 
                    cs.course_number = e.course_number
                WHERE 
                    cs.course_number = '$courseNum'
                GROUP BY 
                    cs.section_number, cs.classroom, cs.meeting_days, cs.start_time, cs.end_time;
            ";

            $result = mysqli_query($conn, $query);

            if ($result && mysqli_num_rows($result) > 0) {
                echo "<table class='table'>";
                echo "<thead><tr><th>Section</th><th>Classroom</th><th>Meeting Days</th><th>Meeting Time</th><th>Students Enrolled</th></tr></thead><tbody>";

                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>
                    <td>" . htmlspecialchars($row['section_number']) . "</td>
                    <td>" . htmlspecialchars($row['classroom']) . "</td>
                    <td>" . htmlspecialchars($row['meeting_days']) . "</td>
                    <td>" . htmlspecialchars($row['meeting_time']) . "</td>
                    <td>" . htmlspecialchars($row['num_students_enrolled']) . "</td>
                  </tr>";
                }

                echo "</tbody></table>";
            } else {
                echo "<p>No sections found for the course number provided.</p>";
            }

		}

        mysqli_close($conn);
        ?>

      </div>
  </body>
</html>

