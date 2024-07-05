import 'package:flutter/material.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/landing/landing.dart';
import 'package:nathanielxd/theme/style/main_style.dart';

class AppView extends StatelessWidget {
  const AppView({required this.resume, super.key});

  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.theme,
      title: 'Nathaniel Dragusin | Software Engineer',
      home: LandingView(resume: resume),
    );
  }
}
