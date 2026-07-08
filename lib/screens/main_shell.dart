import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/sidebar.dart';
import 'dashboard_page.dart';
import 'subjects_page.dart';
import 'quizzes_page.dart';
import 'leaderboard_page.dart';
import 'classmates_page.dart';
import 'profile_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final List<Widget> _pages = const [
    DashboardPage(),
    SubjectsPage(),
    QuizzesPage(),
    LeaderboardPage(),
    ClassmatesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final wide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: wide
          ? null
          : AppBar(
              backgroundColor: AppColors.sidebarBg,
              foregroundColor: AppColors.textDark,
              title: const Text('E-Learning Smart'),
            ),
      drawer: wide
          ? null
          : Drawer(
              child: AppSidebar(
                onSelect: (i) {
                  appState.setSidebarIndex(i);
                  Navigator.pop(context);
                },
              ),
            ),
      body: Row(
        children: [
          if (wide) AppSidebar(onSelect: (i) => appState.setSidebarIndex(i)),
          Expanded(child: _pages[appState.selectedSidebarIndex]),
        ],
      ),
    );
  }
}
