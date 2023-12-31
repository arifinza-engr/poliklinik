<?php
include("koneksi.php");

// Inisialisasi variabel
$id = $id_dokter = $id_pasien = $tanggal_periksa = $catatan = '';

// Jika form disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $id = $_POST['id'];
  $id_dokter = $_POST['id_dokter'];
  $id_pasien = $_POST['id_pasien'];
  $tanggal_periksa = $_POST['tanggal_periksa'];
  $catatan = $_POST['catatan'];

  $query = "UPDATE periksa SET id_dokter='$id_dokter', id_pasien='$id_pasien', tanggal_periksa='$tanggal_periksa', catatan='$catatan' WHERE id='$id'";

  if ($mysqli->query($query)) {
    header("Location: index.php?page=periksa");
  } else {
    die("Error: " . $query . "<br>" . $mysqli->error);
  }
}

// Cek apakah ada parameter ID di URL
if (isset($_GET['id'])) {
  $id = $_GET['id'];

  // Mengambil data pemeriksaan berdasarkan ID
  $query = "SELECT * FROM periksa WHERE id='$id'";
  $result = mysqli_query($mysqli, $query);

  if ($result && mysqli_num_rows($result) > 0) {
    $data = mysqli_fetch_assoc($result);
    $id_dokter = $data['id_dokter'];
    $id_pasien = $data['id_pasien'];
    $tanggal_periksa = $data['tanggal_periksa'];
    $catatan = $data['catatan'];
  } else {
    die("Data pemeriksaan tidak ditemukan.");
  }
}

// Ambil data dokter dan pasien untuk dropdown
$dokters = mysqli_query($mysqli, "SELECT * FROM dokter");
$pasiens = mysqli_query($mysqli, "SELECT * FROM pasien");
?>

<div class="container mt-4">
  <h3>Edit Pemeriksaan</h3>
  <form method="POST" action="periksa_edit.php">

    <input type="hidden" name="id" value="<?= $id; ?>">

    <div class="mb-3">
      <label for="id_dokter" class="form-label">Dokter</label>
      <select class="form-control" id="id_dokter" name="id_dokter">
        <?php
        while ($dokter = mysqli_fetch_assoc($dokters)) {
          $selected = ($dokter['id'] == $id_dokter) ? "selected" : "";
          echo "<option value='" . $dokter['id'] . "' $selected>" . $dokter['nama'] . "</option>";
        }
        ?>
      </select>
    </div>

    <div class="mb-3">
      <label for="id_pasien" class="form-label">Pasien</label>
      <select class="form-control" id="id_pasien" name="id_pasien">
        <?php
        while ($pasien = mysqli_fetch_assoc($pasiens)) {
          $selected = ($pasien['id'] == $id_pasien) ? "selected" : "";
          echo "<option value='" . $pasien['id'] . "' $selected>" . $pasien['nama'] . "</option>";
        }
        ?>
      </select>
    </div>

    <div class="mb-3">
      <label for="tanggal_periksa" class="form-label">Tanggal Periksa</label>
      <input type="date" class="form-control" id="tanggal_periksa" name="tanggal_periksa" value="<?= $tanggal_periksa; ?>">
    </div>

    <div class="mb-3">
      <label for="catatan" class="form-label">Catatan</label>
      <textarea class="form-control" id="catatan" name="catatan" rows="3"><?= $catatan; ?></textarea>
    </div>


    <button type="submit" class="btn btn-primary">Update</button>
  </form>
</div>