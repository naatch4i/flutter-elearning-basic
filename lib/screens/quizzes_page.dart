import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../data/dummy_data.dart';
import '../providers/app_state.dart';
import 'quiz_page.dart';

class QuizzesPage extends StatelessWidget {
  const QuizzesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final student = context.watch<AppState>().currentStudent;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kuis Seru 🎮',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            const Text(
              'Uji pemahamanmu dan kumpulkan XP sebanyak-banyaknya!',
              style: TextStyle(color: AppColors.textGrey, fontSize: 13),
            ),
            const SizedBox(height: 24),
            ...dummySubjects.map((s) {
              final score = student.quizScores[s.id];
              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [s.colorStart, s.colorEnd],
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(s.icon, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${s.quiz.questions.length} soal • ${score != null ? "Skor terbaik: $score%" : "Belum dikerjakan"}',
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (score != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          score >= 80
                              ? Icons.emoji_events_rounded
                              : Icons.stars_rounded,
                          color: score >= 80
                              ? Colors.amber
                              : AppColors.primaryLight,
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => QuizPage(subject: s)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: s.colorEnd,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                      ),
                      child: Text(score != null ? 'Ulangi' : 'Mulai'),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
