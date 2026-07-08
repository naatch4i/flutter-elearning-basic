class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class Quiz {
  final String subjectId;
  final List<QuizQuestion> questions;

  const Quiz({required this.subjectId, required this.questions});
}
