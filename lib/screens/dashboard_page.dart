import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../theme/app_theme.dart';
import '../providers/app_state.dart';
import '../data/dummy_data.dart';
import '../widgets/subject_card.dart';
import '../models/student.dart';
import 'subject_detail_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final student = appState.currentStudent;
    final wide = MediaQuery.of(context).size.width > 1200;

    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Halo, ${student.name.split(' ').first}! Yuk lanjutkan belajarmu 📚',
                            style: const TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primaryLight.withValues(
                          alpha: 0.25,
                        ),
                        child: Text(
                          student.avatarEmoji,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _StatsRow(student: student),
                  const SizedBox(height: 28),
                  const Text(
                    'Mata Pelajaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dummySubjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.95,
                    ),
                    itemBuilder: (context, index) {
                      final subject = dummySubjects[index];
                      return SubjectCard(
                        subject: subject,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubjectDetailPage(subject: subject),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          if (wide)
            Container(
              width: 300,
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Progres Belajar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    ...dummySubjects.take(4).map((s) {
                      final score = student.quizScores[s.id] ?? 0;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(s.icon, size: 16, color: s.colorEnd),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    s.name,
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  '$score%',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            LinearPercentIndicator(
                              lineHeight: 8,
                              percent: score / 100,
                              padding: EdgeInsets.zero,
                              barRadius: const Radius.circular(8),
                              backgroundColor: AppColors.background,
                              progressColor: s.colorEnd,
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    const Text(
                      'Teman Sekelas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    ...dummyClassmates.take(5).map(
                          (c) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 17,
                                  backgroundColor: AppColors.primaryLight
                                      .withValues(alpha: 0.25),
                                  child: Text(
                                    c.avatarEmoji,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        c.name,
                                        style: const TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        c.kelas,
                                        style: const TextStyle(
                                          fontSize: 10.5,
                                          color: AppColors.textGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${c.xp} XP',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final Student student;
  const _StatsRow({required this.student});

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        'Level',
        '${student.level}',
        Icons.military_tech_rounded,
        AppColors.primary,
      ),
      (
        'Total XP',
        '${student.xp}',
        Icons.bolt_rounded,
        AppColors.cardOrangeDark,
      ),
      (
        'Streak',
        '${student.streak} hari',
        Icons.local_fire_department_rounded,
        AppColors.cardPinkDark,
      ),
      (
        'Mapel Selesai',
        '${student.quizScores.length}/${dummySubjects.length}',
        Icons.check_circle_rounded,
        AppColors.cardGreenDark,
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 700 ? 4 : 2;
        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 2.4,
          children: items.map((it) {
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: it.$4.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      it.$3,
                      color: it.$4,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          it.$2,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          it.$1,
                          style: const TextStyle(
                            fontSize: 10.5,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
