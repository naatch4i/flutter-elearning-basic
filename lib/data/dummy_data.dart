import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../models/materi.dart';
import '../models/quiz.dart';
import '../models/student.dart';
import '../theme/app_theme.dart';

String _yt(String q) =>
    'https://www.youtube.com/results?search_query=${Uri.encodeComponent(q)}';
String _img(String seed) => 'https://picsum.photos/seed/$seed/600/400';

final List<Subject> dummySubjects = [
  Subject(
    id: 'bindo',
    name: 'Bahasa Indonesia',
    icon: Icons.menu_book_rounded,
    colorStart: AppColors.cardPink,
    colorEnd: AppColors.cardPinkDark,
    description: 'Kaidah kebahasaan, teks, dan sastra Indonesia.',
    guru: 'Bu Ratna Sari, S.Pd.',
    materiList: [
      Materi(
        id: 'bindo-1',
        title: 'Struktur Teks Eksposisi',
        summary: 'Mengenal tesis, argumentasi, dan penegasan ulang.',
        content:
            'Teks eksposisi adalah teks yang bertujuan menjelaskan atau memaparkan suatu gagasan disertai fakta pendukung. '
            'Struktur teks eksposisi terdiri dari tiga bagian utama: (1) Tesis, yaitu pernyataan pendapat atau sudut pandang penulis '
            'terhadap suatu permasalahan; (2) Rangkaian argumen, berisi alasan-alasan logis dan data/fakta yang memperkuat tesis; '
            '(3) Penegasan ulang, yaitu simpulan yang menguatkan kembali pendapat penulis. Ciri kebahasaan teks eksposisi antara lain '
            'menggunakan kata kerja mental (menyimpulkan, memprediksi), konjungsi kausalitas (karena, sebab, oleh karena itu), dan istilah teknis sesuai topik.',
        imageUrl: _img('bindo1'),
        videoUrl: _yt('materi teks eksposisi bahasa indonesia SMA'),
        durasi: '12 menit',
      ),
      Materi(
        id: 'bindo-2',
        title: 'Puisi: Diksi dan Majas',
        summary: 'Unsur pembangun puisi serta jenis-jenis majas.',
        content:
            'Puisi dibangun oleh unsur intrinsik seperti diksi (pilihan kata), imaji (citraan), majas (gaya bahasa), rima, dan amanat. '
            'Diksi dipilih penyair untuk menimbulkan efek estetis dan makna yang padat. Majas yang sering muncul antara lain metafora '
            '(perbandingan langsung tanpa kata pembanding), personifikasi (benda mati diberi sifat manusia), hiperbola (melebih-lebihkan), '
            'dan simile (perbandingan dengan kata "seperti"/"bagai"). Memahami majas membantu pembaca menafsirkan makna tersirat dalam puisi.',
        imageUrl: _img('bindo2'),
        videoUrl: _yt('majas dan diksi dalam puisi SMA'),
        durasi: '10 menit',
      ),
    ],
    quiz: Quiz(subjectId: 'bindo', questions: [
      QuizQuestion(
        question: 'Bagian teks eksposisi yang berisi pendapat awal penulis disebut...',
        options: ['Tesis', 'Koda', 'Orientasi', 'Resolusi'],
        correctIndex: 0,
        explanation: 'Tesis adalah pernyataan pendapat di awal teks eksposisi.',
      ),
      QuizQuestion(
        question: 'Majas yang membandingkan dua hal menggunakan kata "seperti" atau "bagai" disebut...',
        options: ['Metafora', 'Simile', 'Personifikasi', 'Hiperbola'],
        correctIndex: 1,
        explanation: 'Simile menggunakan kata pembanding eksplisit seperti "seperti" atau "bagai".',
      ),
      QuizQuestion(
        question: 'Konjungsi kausalitas ditunjukkan oleh kata...',
        options: ['Dan', 'Kemudian', 'Karena', 'Atau'],
        correctIndex: 2,
        explanation: '"Karena" menyatakan hubungan sebab-akibat.',
      ),
      QuizQuestion(
        question: 'Unsur puisi yang berkaitan dengan pilihan kata disebut...',
        options: ['Rima', 'Diksi', 'Tipografi', 'Amanat'],
        correctIndex: 1,
        explanation: 'Diksi adalah pemilihan kata oleh penyair.',
      ),
      QuizQuestion(
        question: 'Kalimat "Angin berbisik lembut di telingaku" menggunakan majas...',
        options: ['Simile', 'Hiperbola', 'Personifikasi', 'Ironi'],
        correctIndex: 2,
        explanation: 'Angin diberi sifat manusia (berbisik) sehingga termasuk personifikasi.',
      ),
    ]),
  ),
  Subject(
    id: 'mtk',
    name: 'Matematika',
    icon: Icons.calculate_rounded,
    colorStart: AppColors.primary,
    colorEnd: AppColors.primaryDark,
    description: 'Aljabar, geometri, dan trigonometri dasar.',
    guru: 'Pak Budi Santoso, S.Pd.',
    materiList: [
      Materi(
        id: 'mtk-1',
        title: 'Persamaan Kuadrat',
        summary: 'Bentuk umum, akar-akar, dan rumus ABC.',
        content:
            'Persamaan kuadrat berbentuk ax² + bx + c = 0 dengan a ≠ 0. Akar-akar persamaan dapat dicari dengan pemfaktoran, '
            'melengkapkan kuadrat sempurna, atau rumus ABC: x = (-b ± √(b² - 4ac)) / 2a. Nilai diskriminan D = b² - 4ac menentukan '
            'jenis akar: jika D > 0 akar real berbeda, D = 0 akar kembar (real sama), dan D < 0 akar imajiner (tidak real). '
            'Jumlah akar x1 + x2 = -b/a dan hasil kali akar x1 · x2 = c/a berguna untuk soal tanpa mencari akar secara langsung.',
        imageUrl: _img('mtk1'),
        videoUrl: _yt('persamaan kuadrat rumus ABC matematika SMA'),
        durasi: '15 menit',
      ),
      Materi(
        id: 'mtk-2',
        title: 'Perbandingan Trigonometri',
        summary: 'Sin, cos, tan pada segitiga siku-siku.',
        content:
            'Pada segitiga siku-siku, perbandingan trigonometri sudut θ didefinisikan sebagai: sin θ = sisi depan/sisi miring, '
            'cos θ = sisi samping/sisi miring, tan θ = sisi depan/sisi samping. Nilai-nilai sudut istimewa (0°, 30°, 45°, 60°, 90°) '
            'wajib dihafal karena sering muncul dalam soal. Identitas dasar sin²θ + cos²θ = 1 digunakan untuk menyederhanakan '
            'persamaan trigonometri.',
        imageUrl: _img('mtk2'),
        videoUrl: _yt('perbandingan trigonometri sudut istimewa SMA'),
        durasi: '14 menit',
      ),
    ],
    quiz: Quiz(subjectId: 'mtk', questions: [
      QuizQuestion(
        question: 'Bentuk umum persamaan kuadrat adalah...',
        options: ['ax + b = 0', 'ax² + bx + c = 0', 'ax³ + b = 0', 'a/x + b = 0'],
        correctIndex: 1,
        explanation: 'Persamaan kuadrat memiliki pangkat tertinggi 2.',
      ),
      QuizQuestion(
        question: 'Jika D = b² - 4ac bernilai 0, maka akar persamaan...',
        options: ['Dua akar real berbeda', 'Dua akar kembar', 'Tidak memiliki akar real', 'Tiga akar'],
        correctIndex: 1,
        explanation: 'D = 0 menghasilkan akar kembar (real sama).',
      ),
      QuizQuestion(
        question: 'Nilai sin 30° adalah...',
        options: ['1/2', '√2/2', '√3/2', '1'],
        correctIndex: 0,
        explanation: 'sin 30° = 1/2 (nilai sudut istimewa).',
      ),
      QuizQuestion(
        question: 'Rumus jumlah akar persamaan kuadrat adalah...',
        options: ['x1+x2 = c/a', 'x1+x2 = -b/a', 'x1+x2 = b/a', 'x1+x2 = -c/a'],
        correctIndex: 1,
        explanation: 'Jumlah akar x1 + x2 = -b/a.',
      ),
      QuizQuestion(
        question: 'sin²θ + cos²θ = ...',
        options: ['0', '1', '2', 'tan θ'],
        correctIndex: 1,
        explanation: 'Identitas trigonometri dasar sin²θ + cos²θ = 1.',
      ),
    ]),
  ),
  Subject(
    id: 'inggris',
    name: 'Bahasa Inggris',
    icon: Icons.language_rounded,
    colorStart: AppColors.cardBlue,
    colorEnd: AppColors.cardBlueDark,
    description: 'Grammar, vocabulary, dan teks fungsional.',
    guru: 'Miss Anita Wijaya, S.Pd.',
    materiList: [
      Materi(
        id: 'ing-1',
        title: 'Simple Present & Present Continuous',
        summary: 'Perbedaan penggunaan dan rumus kedua tense.',
        content:
            'Simple Present Tense digunakan untuk kebiasaan, fakta umum, dan jadwal tetap. Rumus: S + V1 (s/es) untuk subjek '
            'tunggal orang ketiga. Contoh: "She studies every night." Present Continuous Tense digunakan untuk aktivitas yang '
            'sedang berlangsung saat ini. Rumus: S + to be (am/is/are) + V-ing. Contoh: "She is studying now." Kata kunci simple '
            'present: always, usually, every day. Kata kunci present continuous: now, right now, at the moment.',
        imageUrl: _img('ing1'),
        videoUrl: _yt('simple present vs present continuous tense English grammar'),
        durasi: '13 menit',
      ),
      Materi(
        id: 'ing-2',
        title: 'Descriptive Text',
        summary: 'Struktur dan ciri kebahasaan teks deskripsi.',
        content:
            'Descriptive text bertujuan menggambarkan suatu objek, tempat, atau orang secara detail agar pembaca seolah dapat '
            'melihat, mendengar, atau merasakan hal yang dideskripsikan. Struktur teks: Identification (pengenalan objek) dan '
            'Description (perincian ciri-ciri objek). Ciri kebahasaan: menggunakan adjective (kata sifat), simple present tense, '
            'dan specific noun (nama objek yang spesifik, misalnya "Borobudur Temple" bukan "a temple").',
        imageUrl: _img('ing2'),
        videoUrl: _yt('descriptive text structure and example English'),
        durasi: '11 menit',
      ),
    ],
    quiz: Quiz(subjectId: 'inggris', questions: [
      QuizQuestion(
        question: 'Rumus Simple Present Tense untuk subjek "She" adalah...',
        options: ['S + V1', 'S + V1(s/es)', 'S + is + V-ing', 'S + V2'],
        correctIndex: 1,
        explanation: 'Subjek orang ketiga tunggal menambahkan s/es pada kata kerja.',
      ),
      QuizQuestion(
        question: '"They ___ playing football now." Kata yang tepat adalah...',
        options: ['is', 'am', 'are', 'be'],
        correctIndex: 2,
        explanation: 'Subjek jamak "They" menggunakan to be "are".',
      ),
      QuizQuestion(
        question: 'Struktur descriptive text terdiri dari...',
        options: ['Orientation - Complication', 'Identification - Description', 'Thesis - Argument', 'General - Specific'],
        correctIndex: 1,
        explanation: 'Descriptive text memiliki Identification dan Description.',
      ),
      QuizQuestion(
        question: 'Kata kunci yang menandakan Present Continuous adalah...',
        options: ['every day', 'usually', 'right now', 'always'],
        correctIndex: 2,
        explanation: '"Right now" menunjukkan kejadian sedang berlangsung.',
      ),
      QuizQuestion(
        question: 'Descriptive text banyak menggunakan...',
        options: ['Adjective', 'Conjunction', 'Preposition only', 'Interjection'],
        correctIndex: 0,
        explanation: 'Adjective adalah kata sifat yang banyak dipakai dalam descriptive text.',
      ),
    ]),
  ),
];

final List<Student> dummyStudents = [
  Student(
    id: 'me',
    name: 'Zeze Alfarizi',
    kelas: 'XI IPA 1',
    avatarEmoji: '🧑🏻‍🎓',
    joinDate: '01-07-2026',
    xp: 640,
    streak: 4,
  ),
];

final List<Student> dummyClassmates = [
  Student(
    id: 'class-1',
    name: 'Alya Putri',
    kelas: 'XI IPA 1',
    avatarEmoji: '👩🏻‍🎓',
    joinDate: '01-07-2026',
    xp: 590,
    streak: 3,
  ),
  Student(
    id: 'class-2',
    name: 'Bima Pratama',
    kelas: 'XI IPA 1',
    avatarEmoji: '👨🏻‍🎓',
    joinDate: '01-07-2026',
    xp: 540,
    streak: 2,
  ),
  Student(
    id: 'class-3',
    name: 'Citra Dewi',
    kelas: 'XI IPA 1',
    avatarEmoji: '👩🏻‍🎓',
    joinDate: '01-07-2026',
    xp: 610,
    streak: 5,
  ),
];
