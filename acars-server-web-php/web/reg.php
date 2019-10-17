<?php require_once 'layout.php'; ?>

<h1>
  <?php echo $_GET["registration"]; ?>
</h1>

<h2>Flights</h2>
<table class="table table-sm table-bordered">
  <tr>
    <th>ID</th>
    <th>Flight</th>
    <th>Created</th>
    <th>Updated</th>
  </tr>
<?php
  $query =  "SELECT * FROM Flights WHERE Registration = \"{$_GET["registration"]}\"";
  foreach ($dbh->query($query) as $row)
  {
?>
  <tr>
    <td><a href="/flight.php?id=<?php echo $row[0]; ?>"><?php echo $row[0]; ?></a></td>
    <td><?php echo $row[2]; ?></td>
    <td><?php echo $row[3]; ?></td>
    <td><?php echo $row[4]; ?></td>
  </tr>
<?php
  }
  $dbh = null;
?>
</table>

