<?php
    include 'database.php';

        // Define a function to validate the SSN format
        function isValidSSN($ssn) {
          // SSN format: 3 digits, a dash, 2 digits, a dash, 4 digits
          return preg_match("/^\d{3}-\d{2}-\d{4}$/", $ssn);
      }
  
      $ssnError = "";
  
      if ($_SERVER["REQUEST_METHOD"] == "POST") {
          $ssn = $_POST['ssn'];
          
          if (!isValidSSN($ssn)) {
              $ssnError = "Please enter a valid SSN in the format XXX-XX-XXXX.";
          } else {
              // Process valid SSN, e.g., save to the database or perform other actions
              // ...

          }
        }




    mysqli_close($conn);


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
                  href="professors.php"
                  >Professor</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link active"
                  aria-current="page"
                  href="students.php"
                  >Student</a
                >
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <header class="text-center container">
        <p class="display-1">Professor</p>
        <p class="display-6">This is the professor console</p>
      </header>

      <div class="container">

      <div class="container">

        <div class="card mt-5">
          <div class="card-body">
            <h5 class="card-title">Back to Home page</h5>
            <p class="card-text">
              To go back to the main page, click the button below.
            </p>
            <a href="index.html" class="btn btn-primary">Main</a>
          </div>
        </div>

        <div class="card mt-5">
            <div class="card-body">
                <h5 class="card-title">To list the titles, classrooms, meeting days and time</h5>
                <form action="<?php htmlspecialchars($_SERVER["PHP_SELF"]) ?>" method="post">
                  <div class="row mb-3">
                    <div class="col-md-6">
                      <label for="exampleInputSSN" class="form-label">Enter the Social Security number in format XXX-XX-XXXX</label>
                      <input 
                        type="text" 
                        class="form-control" 
                        id="ssn" 
                        name="ssn" 
                        pattern="\d{3}-\d{2}-\d{4}" 
                        title="Format: XXX-XX-XXXX" 
                        required>
                    </div>
                  </div>
                  <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                </form>

                <!-- TODO: Input PHP code here -->
               <?php

                if(($_SERVER["REQUEST_METHOD"] == "POST")) {
                  $ssn = filter_input(INPUT_POST, 'ssn', FILTER_SANITIZE_SPECIAL_CHARS);
                  
                  $ssn = str_replace("-", "", $ssn);

                  // Enter the SQL query here











                  echo $ssn;
                }elseif(empty($ssn)) {
                  echo "Please enter a valid SSN in the format XXX-XX-XXXX.";
                }
                ?>

            </div>
        </div>

        <div class="card mt-5">
            <div class="card-body">
                <h5 class="card-title">To see the count of how many students got each grade</h5>
                <form>
                  <div class="row mb-3">
                    <div class="col-md-6">
                      <label for="exampleInputCourseNum" class="form-label">Enter the Course Number</label>
                      <input type="text" class="form-control" id="exampleInputCourseNum" >
                    </div>
                    <div class="col-md-6">
                      <label for="exampleInputSectionNum" class="form-label">Enter the Section Number</label>
                      <input type="text" class="form-control" id="exampleInputSectionNum" >
                    </div>
                  </div>
                  <button type="submit" class="btn btn-primary">Submit</button>
                </form>


                <!-- TODO: Input PHP code here -->



            </div>
        </div>

      </div>
    </div>
  </body>
</html>
