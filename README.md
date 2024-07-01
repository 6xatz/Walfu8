## Mata Kuliah

Sebagai proyek akhir: [8] Basis Data | Universitas Pelita Bangsa.

## Laporan Praktikum

- Bagian 1: Membuat Tabel untuk Praktikum 6, 7, dan 8

  > silahkan restore **_[Praktikum 6] 10-06-2024.sql_**.

  <p align="left">
    <img src="/ss/ERD.jpg" width="800">
  </p>

### Pertanyaan dari Praktikum 8

1. Menampilkan Nama Karyawan yang Berada di Departemen yang Dipimpin oleh Manajer dengan Nama 'Rika':
```sql
SELECT d.id_departemen, d.manajer_nik, m.nama, k.nama
FROM karyawan k
JOIN departemen d ON k.id_departemen = d.id_departemen
JOIN karyawan m ON d.manajer_nik = m.nik
WHERE m.nama = 'Rika';
```

2. Menampilkan Nama Proyek yang dikerjakan oleh Karyawan dari Departemen 'RnD':
```sql
SELECT k.nik, k.nama AS nama_karyawan, p.nama AS nama_proyek
FROM proyek p
JOIN proyek_detail pd ON p.id_proyek = pd.id_proyek
JOIN karyawan k ON pd.nik = k.nik
JOIN departemen d ON k.id_departemen = d.id_departemen
WHERE d.nama = 'RnD';
```

3. Menampilkan Nama Karyawan yang Terlibat dalam Lebih dari Satu Proyek:
```sql
SELECT p.id_proyek, p.nama AS nama_proyek, k.nama
FROM karyawan k
JOIN proyek_detail pd ON k.nik = pd.nik
JOIN proyek p ON pd.id_proyek = p.id_proyek
WHERE k.nama IN (
    SELECT k2.nama
    FROM karyawan k2
    JOIN proyek_detail pd2 ON k2.nik = pd2.nik
    GROUP BY k2.nama
    HAVING COUNT(DISTINCT pd2.id_proyek) > 1
);
```

4. Menampilkan Nama Proyek yang melibatkan Karyawan terbanyak:
```sql
SELECT p.nama AS nama_proyek, COUNT(pd.nik) AS jumlah_karyawan
FROM proyek p
JOIN proyek_detail pd ON p.id_proyek = pd.id_proyek
GROUP BY p.nama
ORDER BY jumlah_karyawan DESC
LIMIT 1;
```

5. Menampilkan Nama Proyek yang Diikuti oleh Karyawan dengan Gaji Pokok
Kurang dari 3 Juta:
```sql
SELECT p.nama AS nama_proyek, k.nama AS nama_karyawan, g.gaji_pokok
FROM proyek p
JOIN proyek_detail pd ON p.id_proyek = pd.id_proyek
JOIN karyawan k ON pd.nik = k.nik
JOIN karyawan g ON k.nik = g.nik
WHERE g.gaji_pokok < 3000000
GROUP BY p.nama, k.nama
ORDER BY p.nama;
```

  <p align="left">
    <img src="/ss/Result.jpg" width="600">
  </p>

## Documentation

All associated resources. are licensed under the [MIT License](https://mit-license.org/).
