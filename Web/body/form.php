<div class="container">
    <div class="card-header">
        <h3>
            <?php if ($mhs['id']) : ?>
                Edit Data Mahasiswa <b><?= $mhs['nama'] ?></b>
                <form method="POST" enctype="multipart/form-data" action="ctrl/edit_data.php">
                    <input type="hidden" name="id" value="<?= $mhs['id'] ?>" />
                <?php else : ?>
                    Buat Data Mahasiswa Baru
                    <form method="POST" enctype="multipart/form-data" action="ctrl/tambah_data.php">
        </h3>
    <?php endif ?>
    </div>
    <div class="card-body">
        <div class="form-group">
            <label>Nama</label>
            <input name="nama" value="<?= $mhs['nama'] ?>" class="form-control">
        </div>
        <div class="form-group">
            <label>NIM</label>
            <input name="nim" value="<?= $mhs['nim'] ?>" class="form-control">
        </div>
        <button class="btn btn-success">Submit</button>
        </form>
    </div>
</div>