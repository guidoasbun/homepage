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
        <p class="display-6">Professor Course and Section Query</p>
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
            $sectionNum = filter_input(INPUT_POST, 'sectionNum', FILTER_SANITIZE_SPECIAL_CHARS);

            $query = "
                SELECT 
                    grade, 
                    COUNT(*) AS grade_count
                FROM 
                    enrollment 
                JOIN 
                    course_sections 
                ON 
                    enrollment.course_number = course_sections.course_number
                WHERE 
                    course_sections.course_number = '$courseNum'
                    AND course_sections.section_number = '$sectionNum'
                GROUP BY 
                    grade;
            ";

            $result = mysqli_query($conn, $query);

            if ($result) {
                echo "<table class='table'>";
                echo "<thead><tr><th>Grade</th><th>Count</th></tr></thead><tbody>";

                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr><td>" . htmlspecialchars($row['grade']) . "</td><td>" . htmlspecialchars($row['grade_count']) . "</td></tr>";
                }

                echo "</tbody></table>";
            } else {
                echo "Error executing query: " . mysqli_error($conn);
            }

		}

        mysqli_close($conn);
        ?>

      </div>
  </body>
</html>

