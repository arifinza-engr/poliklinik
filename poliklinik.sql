-- Membuat database poliklinik dan mengaktifkan database tersebut

CREATE DATABASE IF NOT EXISTS poliklinik;
USE poliklinik;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 03 Okt 2023 pada 17.01
-- Versi server: 5.7.39
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_hp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `nomor_hp`) VALUES
(1, 'Dr. Ahmad', 'Jl. Merdeka No.1', '0812-3456-7890'),
(2, 'Dr. Siti', 'Jl. Raya Bogor No.2', '0812-3456-7891'),
(3, 'Dr. Budi', 'Jl. Anggrek No.3', '0812-3456-7892'),
(4, 'Dr. Rina', 'Jl. Melati No.4', '0812-3456-7893'),
(5, 'Dr. Agus', 'Jl. Sederhana No.5', '0812-3456-7894'),
(6, 'Dr. Lia', 'Jl. Damai No.6', '0812-3456-7895'),
(7, 'Dr. Dodi', 'Jl. Sejahtera No.7', '0812-3456-7896'),
(8, 'Dr. Riri', 'Jl. Kebangsaan No.8', '0812-3456-7897'),
(9, 'Dr. Adi', 'Jl. Kemakmuran No.9', '0812-3456-7898'),
(10, 'Dr. Mira', 'Jl. Persatuan No.10', '0812-3456-7899');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_hp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `nomor_hp`) VALUES
(1, 'Ali Bin Abi', 'Jalan Raya No. 10, Jakarta', '+628112345678'),
(2, 'Fatimah Az Zahra', 'Jalan Terusan No. 20, Bandung', '+628987654321'),
(3, 'Hasan Bin Ali', 'Jalan Diponegoro No. 5, Surabaya', '+628567891234'),
(4, 'Husain Bin Ali', 'Jalan Sukajadi No. 11, Bali', '+628234567890'),
(5, 'Zainab Binti Ali', 'Jalan Pahlawan No. 9, Yogyakarta', '+628345678912');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `id` int(10) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal_periksa` datetime NOT NULL,
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `periksa`
--

INSERT INTO `periksa` (`id`, `id_pasien`, `id_dokter`, `tanggal_periksa`, `catatan`) VALUES
(1, 1, 1, '2023-10-01 10:00:00', 'Pemeriksaan rutin'),
(2, 2, 1, '2023-10-01 11:00:00', 'Gejala flu'),
(3, 3, 2, '2023-10-02 10:15:00', 'Pusing dan mual'),
(4, 4, 3, '2023-10-02 11:15:00', 'Sakit perut kronis'),
(5, 5, 1, '2023-10-03 10:30:00', 'Pemeriksaan mata dan penglihatan');


--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;