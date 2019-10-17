<?php
  $dir = 'sqlite:/data/acars/acars.sqb';
  $dir = "pgsql:host=postgres;port=5432;dbname=acars-server;user=postgres;password=boxel";
  $dbh  = new PDO($dir) or die("cannot open the database");
?>

<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $title ?></title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="/">ACARS</a>
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">Stations</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Tails</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Flights</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Messages</a>
        </li>
      </ul>
    </nav>

    <div id="page">
      <?php echo $content ?>
    </div>
  </body>
</html>
