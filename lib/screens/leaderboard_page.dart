import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/app_state.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final board = appState.leaderboard;
    final medalColors = [
      Colors.amber,
      const Color(0xFFB0B0C0),
      const Color(0xFFCD7F32)
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Papan Peringkat 🏆',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            const Text('Siapa yang paling rajin belajar minggu ini?',
                style: TextStyle(color: AppColors.textGrey, fontSize: 13)),
            const SizedBox(height: 24),
            ...List.generate(board.length, (i) {
              final s = board[i];
              final isMe = s.id == appState.currentStudent.id;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: isMe ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 4)),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 28,
                      child: i < 3
                          ? Icon(Icons.emoji_events_rounded,
                              color: medalColors[i], size: 22)
                          : Text('${i + 1}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: isMe
                                      ? Colors.white
                                      : AppColors.textGrey)),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          (isMe ? Colors.white : AppColors.primaryLight)
                              .withOpacity(0.25),
                      child: Text(s.avatarEmoji,
                          style: const TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(isMe ? '${s.name} (Kamu)' : s.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.5,
                                  color: isMe
                                      ? Colors.white
                                      : AppColors.textDark)),
                          Text(s.kelas,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: isMe
                                      ? Colors.white70
                                      : AppColors.textGrey)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.bolt_rounded,
                            size: 16,
                            color:
                                isMe ? Colors.white : AppColors.cardOrangeDark),
                        const SizedBox(width: 4),
                        Text('${s.xp} XP',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color:
                                    isMe ? Colors.white : AppColors.textDark)),
                      ],
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
