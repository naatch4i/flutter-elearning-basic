import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/subject.dart';
import 'quiz_result_page.dart';

class QuizPage extends StatefulWidget {
  final Subject subject;
  const QuizPage({super.key, required this.subject});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedOption;
  bool answered = false;
  int correctCount = 0;
  final List<bool> results = [];

  void _selectOption(int index) {
    if (answered) return;
    final question = widget.subject.quiz.questions[currentIndex];
    setState(() {
      selectedOption = index;
      answered = true;
      final isCorrect = index == question.correctIndex;
      if (isCorrect) correctCount++;
      results.add(isCorrect);
    });
  }

  void _next() {
    final total = widget.subject.quiz.questions.length;
    if (currentIndex < total - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
        answered = false;
      });
    } else {
      final scorePercent = ((correctCount / total) * 100).round();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultPage(
            subject: widget.subject,
            correct: correctCount,
            total: total,
            scorePercent: scorePercent,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.subject.quiz.questions[currentIndex];
    final total = widget.subject.quiz.questions.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        title: Text('Kuis ${widget.subject.name}'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: (currentIndex + 1) / total,
                          minHeight: 8,
                          backgroundColor: Colors.white,
                          color: widget.subject.colorEnd,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${currentIndex + 1}/$total',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.subject.colorStart,
                        widget.subject.colorEnd,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    question.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ...List.generate(question.options.length, (i) {
                  final isSelected = selectedOption == i;
                  final isCorrectAnswer = i == question.correctIndex;
                  Color bg = Colors.white;
                  Color border = Colors.transparent;
                  Color textColor = AppColors.textDark;
                  if (answered) {
                    if (isCorrectAnswer) {
                      bg = AppColors.success.withOpacity(0.12);
                      border = AppColors.success;
                      textColor = AppColors.success;
                    } else if (isSelected && !isCorrectAnswer) {
                      bg = AppColors.danger.withOpacity(0.12);
                      border = AppColors.danger;
                      textColor = AppColors.danger;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => _selectOption(i),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: bg,
                          border: Border.all(color: border, width: 1.6),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: AppColors.background,
                              child: Text(
                                String.fromCharCode(65 + i),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                question.options[i],
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (answered && isCorrectAnswer)
                              const Icon(
                                Icons.check_circle_rounded,
                                color: AppColors.success,
                                size: 20,
                              ),
                            if (answered && isSelected && !isCorrectAnswer)
                              const Icon(
                                Icons.cancel_rounded,
                                color: AppColors.danger,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                if (answered) ...[
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.lightbulb_rounded,
                          color: AppColors.cardOrangeDark,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            question.explanation,
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text(
                        currentIndex < total - 1
                            ? 'Soal Berikutnya'
                            : 'Lihat Hasil',
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
