import 'package:flutter/material.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/app/app.dart';

class App extends StatelessWidget {
  const App({required this.resume, super.key});

  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return AppView(resume: resume);
  }
}
