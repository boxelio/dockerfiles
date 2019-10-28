<?php include 'header.php'; ?>

<h1>Airframes</h1>

<table class="table table-sm table-bordered">
  <tr>
    <th>Tail</th>
    <th># Flights</th>
  </tr>
<?php
  $query = "SELECT * FROM airframes ORDER BY tail ASC";
  foreach ($dbh->query($query) as $row)
  {
?>
  <tr>
    <td><a href="/reg.php?airframe_id=<?php echo $row['id']; ?>"><?php echo $row['tail']; ?></a></td>
    <?php
      $query = "SELECT COUNT(*) FROM flights WHERE airframe_id = ".$row['id'];
      $count = $dbh->query($query)->fetch()[0];
    ?>
    <td><?php echo $count; ?></td>
  </tr>
<?php
  }
?>
</table>

<?php include 'footer.php'; ?>
