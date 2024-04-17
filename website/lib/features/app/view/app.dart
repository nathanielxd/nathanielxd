import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/features/app/view/app_view.dart';
import 'package:nathanielxd/repositories/resume_repository.dart';

class App extends StatelessWidget {
  App({super.key});

  final _resumeRepository =
      ResumeRepository(firebaseStorage: FirebaseStorage.instance);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _resumeRepository,
      child: const AppView(),
    );
  }
}
