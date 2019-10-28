<?php include 'header.php'; ?>

<div class="container-fluid">

  <div class="row mt-4">
    <div class="col-sm-6">
      <h3>Stations</h3>

      <table class="table table-sm table-bordered">
        <tr>
          <th>ID</th>
          <th>Station</th>
          <th>IP Address</th>
          <th># of Messages</th>
        </tr>
      <?php
        $query = "SELECT a.id, a.ident, a.ip_address, count(b.id) message_count FROM stations a INNER JOIN messages b ON a.id = b.station_id GROUP BY a.id ORDER BY message_count DESC";
        foreach ($dbh->query($query) as $row):
      ?>
        <tr>
          <td><a href="station.php?id=<?php echo $row["id"]; ?>"><?php echo $row["id"]; ?></a></td>
          <td><?php echo $row["ident"]; ?></td>
          <td><?php
            // $ip = explode(':', $row['ip_address'])[0];
            $bits = explode('.', $row['ip_address']);
            echo $bits[0].".x.x.".$bits[3];
          ?></td>
          <td><?php echo $row["message_count"]; ?></td>
        </tr>
      <?php
        endforeach;
      ?>
      </table>
    </div>
    <div class="col-sm-6">
      <h3>About</h3>
      <p>
        This is an ACARS aggregation server. The data here is comprised of volunteer feeders. In order to see
        the roadmap or submit a feature request, <a href="https://trello.com/b/1vq5pHNq/acars-server-public-board">visit the Acars Server Public Trello Board</a>.
      </p>
      <h3>How To Feed</h3>
      <p>
        More data helps us develop this out to be more useful. Send your ACARS and VDL2 traffic.
      </p>
      <h5>ACARS</h5>
      <div>acarsdec (<a href="https://github.com/TLeconte/acarsdec">github</a>)</div>
      <div class="alert alert-info">
        <b>acarsdec</b> -v -o 4 -g 40 <b>-i XX-YYYYZ -j airframes.io:5555</b> -r 0 131.550 131.525 131.725 131.825 130.025 130.425 130.450 131.125
      </div>
      <p>The important stuff is marked in bold.</p>
      <p>
        Your identifier (indicated by the "-i" parameter) can be whatever you want it to be. Our recommendation is to use
        the XX-YYYYZ format, where XX is a two digit representation of your initials or other personal identifier (mine is KE),
        YYYY is the nearest airport to you (mine is KMHR) and Z is the receiver number (in case you have multiple in the same locale).
        You are welcome to add additional identifiers to the end of it (such as -ACARS or -VDL2) to further clarify.
      </p>
      <p>
        Be sure to use the correct values for gain, output (your local terminal), and the frequencies to scan. They may be very
        different from the ones I provide in the example above.
      </p>
    </div>
  </div>

  <h2 class="mt-4">Recent Messages</h2>
  <table class="table table-sm table-bordered">
    <tr>
      <th>Message ID</th>
      <th>Time</th>
      <th>Station ID</th>
      <th>Channel</th>
      <th>Error</th>
      <th>Signal</th>
      <th>Mode</th>
      <th>Ack</th>
      <th>Label</th>
      <th>Block #</th>
      <th>MSG #</th>
    </tr>
  <?php
    $query = "SELECT * from messages ORDER BY timestamp DESC LIMIT 10";
    foreach ($dbh->query($query) as $row)
    {
  ?>
    <tr>
      <td rowspan="2" class="align-middle"><?php echo $row['id']; ?></td>
      <td rowspan="2" class="align-middle"><?php echo $row['timestamp']; ?></td>
      <?php
        $query = "SELECT * FROM stations WHERE id = ".$row['station_id'];
        $station = $dbh->query($query)->fetch();
      ?>
      <td><a href="/station.php?id=<?php echo $station['id']; ?>"><?php echo $station['ident']; ?></a></td>
      <td><?php echo round($row['channel'] / 1000000, 3); ?>&nbsp;MHz</td>
      <td><?php echo $row['error']; ?></td>
      <td><?php echo $row['signal']; ?></td>
      <td><?php echo $row['mode']; ?></td>
      <td><?php echo $row['ack']; ?></td>
      <td><?php echo $row['label']; ?></td>
      <td><?php echo $row['block_id']; ?></td>
      <td><?php echo $row['message_number']; ?></td>
    </tr>
    <tr>
      <td colspan="9" class="over-flow: break-word;"><?php echo $row['text']; ?></td>
    </tr>
  <?php
    }
  ?>
  </table>
</div>

<?php include 'footer.php'; ?>
