# Advanced Counter App
Advanced Counter App adalah aplikasi Flutter yang menyediakan fitur untuk menambah, mengedit, dan mengatur ulang daftar counter. Setiap counter dapat memiliki label, warna, dan nilai tersendiri. Aplikasi ini juga mendukung fitur drag-and-drop untuk mengatur urutan counter.

# Fitur
Tambah counter baru dengan satu klik.
Ubah label counter melalui dialog edit.
Pilih warna counter menggunakan color picker.
Increment, decrement, atau hapus counter.
Atur ulang urutan counter dengan drag-and-drop.
Penyimpanan data counter menggunakan state management berbasis Provider.
Struktur Proyek
Main File (main.dart)
MyApp
Widget utama yang menampilkan aplikasi dengan menggunakan MaterialApp.

# CounterApp
Widget yang menangani logika utama untuk daftar counter, termasuk AppBar, Reorderable ListView, dan kontrol global melalui Provider.

# CounterWidget
Widget individual untuk setiap counter yang mencakup tampilan nilai counter, opsi untuk edit, warna, dan kontrol (increment, decrement, delete).

# ColorPickerDialog
Fitur untuk memilih warna counter dengan menggunakan paket flutter_colorpicker.

# State Management File (global_state.dart)
CounterItem
Model data untuk setiap counter, yang mencakup:

value: Nilai counter (default: 0).
color: Warna counter (default: biru).
label: Label counter (default: "Counter").
GlobalState
Mengelola data counter dengan fitur berikut:

Tambah Counter: Menambah counter baru ke daftar.
Hapus Counter: Menghapus counter dari daftar.
Increment/Decrement Counter: Menambah atau mengurangi nilai counter.
Ganti Warna: Memperbarui warna counter.
Ganti Label: Memperbarui label counter.
Reorder Counter: Mengatur ulang urutan counter dengan drag-and-drop.
# Cara Menggunakan
1. Persiapan Proyek
Pastikan Anda memiliki Flutter terinstal.

Tambahkan dependensi berikut ke dalam file pubspec.yaml:

yaml
Copy code
dependencies:
  provider: ^6.0.5
  flutter_colorpicker: ^1.0.3
Jalankan perintah berikut untuk mengunduh dependensi:

flutter pub get
2. Menjalankan Aplikasi
Jalankan aplikasi dengan:
flutter run
3. Interaksi
Menambah Counter: Klik tombol + di tengah halaman.
Edit Counter: Klik ikon pensil pada counter untuk mengganti label dan warna.
Increment/Decrement: Klik ikon + atau - di setiap counter.
Hapus Counter: Klik ikon tempat sampah pada counter.
Atur Ulang Counter: Tahan dan geser counter untuk mengubah urutannya.


# Dependensi
Flutter Provider
Digunakan untuk state management aplikasi.

Flutter Color Picker
Menyediakan dialog untuk memilih warna secara interaktif.