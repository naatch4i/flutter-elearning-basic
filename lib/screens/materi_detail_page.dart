import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/materi.dart';
import '../models/subject.dart';

class MateriDetailPage extends StatelessWidget {
  final Materi materi;
  final Subject subject;
  const MateriDetailPage({
    super.key,
    required this.materi,
    required this.subject,
  });

  Future<void> _openVideo() async {
    final uri = Uri.parse(materi.videoUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        title: Text(subject.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    materi.imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.15),
                  ),
                  InkWell(
                    onTap: _openVideo,
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: subject.colorEnd,
                        size: 34,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: _openVideo,
                icon: const Icon(Icons.ondemand_video_rounded, size: 16),
                label: Text('Tonton Video Materi (${materi.durasi})'),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              materi.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              materi.summary,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                materi.content,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.7,
                  color: AppColors.textDark,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
