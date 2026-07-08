import 'package:flutter/material.dart';
import 'materi.dart';
import 'quiz.dart';

class Subject {
  final String id;
  final String name;
  final IconData icon;
  final Color colorStart;
  final Color colorEnd;
  final String description;
  final String guru; // nama guru pengampu
  final List<Materi> materiList;
  final Quiz quiz;

  const Subject({
    required this.id,
    required this.name,
    required this.icon,
    required this.colorStart,
    required this.colorEnd,
    required this.description,
    required this.guru,
    required this.materiList,
    required this.quiz,
  });

  int get totalMateri => materiList.length;
}
