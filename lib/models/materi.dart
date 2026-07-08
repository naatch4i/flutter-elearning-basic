class Materi {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String imageUrl;
  final String videoUrl;
  final String durasi; // contoh: "15 menit"

  const Materi({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.imageUrl,
    required this.videoUrl,
    required this.durasi,
  });
}
