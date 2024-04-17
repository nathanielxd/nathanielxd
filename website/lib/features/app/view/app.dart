import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/domain/portfolio/portfolio_repository.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/app/app.dart';

class App extends StatelessWidget {
  App({super.key});

  final _resumeRepository =
      ResumeRepository(firebaseStorage: FirebaseStorage.instance);

  final _portfolioRepository =
      PortfolioRepository(firebaseStorage: FirebaseStorage.instance);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _resumeRepository,
        ),
        RepositoryProvider.value(
          value: _portfolioRepository,
        ),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) => AppCubit(
          resumeRepository: _resumeRepository,
          portfolioRepository: _portfolioRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}
