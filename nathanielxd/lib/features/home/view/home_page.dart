import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/features/home/home.dart';
import 'package:nathanielxd/repositories/resume_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        resumeRepository: context.read<ResumeRepository>(),
      ),
      child: const HomeView(),
    );
  }
}
