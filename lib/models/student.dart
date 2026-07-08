class Student {
  final String id;
  final String name;
  final String kelas;
  final String avatarEmoji;
  final String joinDate;
  int xp;
  int streak;
  final Map<String, int> quizScores; // subjectId -> skor terbaik (0-100)

  Student({
    required this.id,
    required this.name,
    required this.kelas,
    required this.avatarEmoji,
    required this.joinDate,
    this.xp = 0,
    this.streak = 0,
    Map<String, int>? quizScores,
  }) : quizScores = quizScores ?? {};

  int get level => (xp / 200).floor() + 1;
  double get levelProgress => (xp % 200) / 200;
}
