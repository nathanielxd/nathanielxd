import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/landing/landing.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LandingCubit(
        resumeRepository: context.read<ResumeRepository>(),
      ),
      child: const LandingView(),
    );
  }
}
