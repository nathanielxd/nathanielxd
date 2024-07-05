import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/app/app.dart';
import 'package:yaml/yaml.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final resume = Resume.fromMap(
    jsonDecode(
      jsonEncode(
        loadYaml(
          await rootBundle.loadString('assets/resume.yaml'),
        ),
      ),
    ) as Map<String, dynamic>,
  );

  runApp(App(resume: resume));
}
