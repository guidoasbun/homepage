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
        <p class="display-6">Professor SSN Query</p>
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
            if(($_SERVER["REQUEST_METHOD"] == "POST")) {
              $ssn = filter_input(INPUT_POST, 'ssn', FILTER_SANITIZE_SPECIAL_CHARS);

                if ($ssn !== null) {
                    $ssn = str_replace("-", "", $ssn);
                    $sql = "SELECT title, classroom, meeting_days, beginning_days, beginning_time, ending_time
                            FROM sections
                            JOIN course ON sec_course_num = course_no
                            JOIN professors ON prof_ssn = professor.ssn
                            WHERE prof_ssn = 'ssn';
                            ";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "Course: " . $row["title"];
                        }
                    }


                }
            }

                mysqli_close($conn);

        ?>

      </div>
  </body>
</html>

