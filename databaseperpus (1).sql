-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Apr 2026 pada 17.28
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseperpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `password` varchar(25) NOT NULL,
  `no_tlp` int(13) NOT NULL,
  `sebagai` enum('admin','petugas') NOT NULL,
  `kode_admin` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama_admin`, `password`, `no_tlp`, `sebagai`, `kode_admin`) VALUES
(1, 'Azis', '123', 896, 'admin', '1'),
(2, 'yuda', '111', 21, 'petugas', '2'),
(3, 'Ajuan', '123', 7896, 'admin', 'admin2'),
(4, 'Halo', '111', 34567, 'admin', 'admin3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `cover` varchar(255) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` date NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `buku_deskripsi` text NOT NULL,
  `isi_buku` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`cover`, `id_buku`, `kategori`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `jumlah_halaman`, `buku_deskripsi`, `isi_buku`) VALUES
('69d0b60727ff3.png', 'BK0001', 'Informatika', 'Sejarah Komputer', 'Galih wicaksono', 'Davit media', '2026-04-04', 200, 'Sejarah mengenai komputer', 'isi laporan sudah di revisi.pdf'),
('69d0b671e7e12.jpg', 'BK0002', 'Filsafat', 'Tempat PKL', 'Firman', 'Abed Nego', '2026-03-19', 120, 'Cerita tentang tempat pkl', 'PITOOOO aaaaaaa.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_buku`
--

INSERT INTO `kategori_buku` (`kategori`) VALUES
('Filsafat'),
('Informatika'),
('Novel'),
('Sains');

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `nisn` int(11) NOT NULL,
  `kode_member` varchar(12) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `tgl_pendaftaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`nisn`, `kode_member`, `nama`, `password`, `jenis_kelamin`, `kelas`, `jurusan`, `no_tlp`, `tgl_pendaftaran`) VALUES
(6798, 'mem03', 'yuda', '$2y$10$11I4bOz3/n8klV.IkW3ulu5QtrfFkBKkBJceY1dEsdPuBg5CZSez2', 'Laki laki', 'XII', 'Desain Pemodelan Informasi Bangunan', '0876543', '2026-04-04'),
(12345643, 'mem04', 'bravy', '$2y$10$GuNGD1rKE0EQnPmVjDDGJ.BK74dAwqr05zB/s/yV3193tyWaTwNUi', 'Laki laki', 'XI', 'Desain Pemodelan Informasi Bangunan', '0876543', '2026-04-05'),
(12345678, 'mem01', 'tio', '$2y$10$BIv1VLzm/77ymI1X/8Sqg.JO4oHkcJNWHQwuYYJWR248ZzbAInt7e', 'Laki laki', 'XI', 'Teknik Tenaga Listrik', '087654321', '2026-04-04'),
(23456781, 'mem02', 'jeni', '$2y$10$3ehYZffp3DU/X/JjVWc52O6QBN3xNFXg8EF2Le8JT8QNRip5WjHaS', 'Perempuan', 'XI', 'Teknik Komputer Jaringan', '0987653', '2026-04-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `nisn` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `bukti_transaksi` varchar(50) NOT NULL,
  `addres_norek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_buku`, `nisn`, `nama_admin`, `tgl_peminjaman`, `tgl_pengembalian`, `status`, `harga`, `bukti_transaksi`, `addres_norek`) VALUES
(9, 'BK0001', 12345678, 'yuda', '2026-04-04', '2026-04-09', 'Konfirmasi', 5000, 'laju.jpg', '9'),
(10, 'BK0002', 12345678, 'yuda', '2026-04-05', '2026-04-06', 'Konfirmasi', 1250, 'laju.jpg', '10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`kategori`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`nisn`,`kode_member`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
