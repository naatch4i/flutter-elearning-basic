import 'package:flutter/material.dart';
import '../models/student.dart';
import '../data/dummy_data.dart';

class AppState extends ChangeNotifier {
  final Student currentStudent = Student(
    id: 'me',
    name: 'Zeze Alfarizi',
    kelas: 'XI IPA 1',
    avatarEmoji: '🧑🏻‍🎓',
    joinDate: '01-07-2026',
    xp: 640,
    streak: 4,
  );

  final List<Student> classmates = dummyClassmates;

  int selectedSidebarIndex = 0;

  void setSidebarIndex(int index) {
    selectedSidebarIndex = index;
    notifyListeners();
  }

  int recordQuizResult(String subjectId, int scorePercent, int totalQuestions) {
    final prevBest = currentStudent.quizScores[subjectId] ?? 0;
    int xpGained = 0;
    if (scorePercent > prevBest) {
      final delta = scorePercent - prevBest;
      xpGained = (delta * totalQuestions ~/ 10).clamp(5, 100);
      currentStudent.xp += xpGained;
      currentStudent.quizScores[subjectId] = scorePercent;
    } else {
      xpGained = 5;
      currentStudent.xp += xpGained;
    }
    currentStudent.streak += 1;
    notifyListeners();
    return xpGained;
  }

  List<Student> get leaderboard {
    final all = [currentStudent, ...classmates];
    all.sort((a, b) => b.xp.compareTo(a.xp));
    return all;
  }
}
