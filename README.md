# 📚 E-Learning Smart

Aplikasi web e-learning berbasis **Flutter (Dart)** dengan tema ungu soft. Dibuat untuk Tugas Besar Mobile/Web Programming.

## ✨ Fitur

- **Dashboard** — ringkasan Level, XP, Streak, progres belajar, dan daftar mata pelajaran.
- **9 Mata Pelajaran lengkap**: Bahasa Indonesia, Matematika, Bahasa Inggris — masing-masing punya **materi teks lengkap + gambar + link video pembelajaran**.
- **Kuis interaktif** per mata pelajaran (5 soal pilihan ganda), dengan feedback benar/salah, penjelasan jawaban, dan skor akhir.
- **Sistem XP & Level** — skor kuis dikonversi menjadi XP, level siswa naik otomatis.
- **Papan Peringkat (Leaderboard)** — membandingkan XP dengan teman sekelas.
- **Profil Siswa** — data siswa, level, XP, dan riwayat nilai kuis per mapel.
- **Teman Sekelas** — daftar profil siswa lain yang tergabung di kelas.
- Logo & branding "E-Learning Smart" dengan skema warna ungu soft.

## 🛠️ Struktur Folder

```
elearning_smart/
├── lib/
│   ├── main.dart                  # entry point
│   ├── theme/app_theme.dart       # warna & tema
│   ├── models/                    # Subject, Materi, Quiz, Student
│   ├── data/dummy_data.dart       # data 9 mapel + materi + soal kuis
│   ├── providers/app_state.dart   # state management (Provider)
│   ├── widgets/                   # Sidebar, Logo, SubjectCard
│   └── screens/                   # Dashboard, Subjects, Quiz, Profile, dst
├── pubspec.yaml
└── analysis_options.yaml
```

## 🚀 Cara Menjalankan di VS Code

### 1. Install Flutter SDK
Jika belum ada, download di https://docs.flutter.dev/get-started/install lalu pastikan `flutter doctor` tidak ada error fatal (khusus untuk **Flutter Web**, cukup pastikan Chrome terpasang).

### 2. Buat proyek Flutter kosong lalu timpa dengan file ini
Karena paket ini hanya berisi source code (`lib/`, `pubspec.yaml`), kamu perlu membuat kerangka proyek Flutter terlebih dahulu agar folder `web/`, `android/`, dll ikut ter-generate:

```bash
flutter create elearning_smart
```

Lalu **salin/timpa** folder `lib/`, file `pubspec.yaml`, dan `analysis_options.yaml` dari ZIP ini ke dalam folder `elearning_smart` hasil `flutter create` (timpa file yang sudah ada).

### 3. Buka di VS Code
```bash
cd elearning_smart
code .
```
Install extension **Flutter** dan **Dart** di VS Code (jika belum ada) melalui tab Extensions.

### 4. Install dependencies
```bash
flutter pub get
```

### 5. Jalankan sebagai Web App
```bash
flutter run -d chrome
```
Atau tekan **F5** di VS Code (pilih device "Chrome").

### 6. (Opsional) Build untuk deployment
```bash
flutter build web
```
Hasil build ada di folder `build/web`, siap di-hosting ke Firebase Hosting, Netlify, Vercel, atau GitHub Pages.

## 📦 Dependencies

| Package | Kegunaan |
|---|---|
| `provider` | State management (XP, skor kuis, siswa aktif) |
| `google_fonts` | Font Poppins untuk tampilan modern |
| `url_launcher` | Membuka link video materi di tab baru |
| `percent_indicator` | Progress bar & circular indicator XP |
| `fl_chart` | Cadangan untuk visualisasi data (opsional dikembangkan) |

## 📝 Catatan Pengembangan Lanjutan

- Materi saat ini berupa **teks + gambar (network image) + link video YouTube** (dummy data). Untuk produksi nyata, sambungkan ke **Firebase Firestore/Storage** agar guru bisa upload materi & video sendiri (mengikuti arsitektur `elearning_v2` yang pernah dibuat sebelumnya).
- Skor kuis & XP saat ini disimpan di memori (hilang saat refresh). Untuk persistensi, tambahkan `shared_preferences` (lokal) atau Firebase Auth + Firestore (multi-user, role Siswa/Guru/Admin).
- Video pembelajaran memakai link pencarian YouTube sebagai placeholder — ganti `videoUrl` di `lib/data/dummy_data.dart` dengan link video asli sesuai kebutuhan.

Selamat mengerjakan, semoga lancar! 🎓
