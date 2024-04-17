import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/features/resume/resume.dart';
import 'package:nathanielxd/repositories/resume_repository.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResumeCubit(
        resumeRepository: context.read<ResumeRepository>(),
      ),
      child: const ResumeView(),
    );
  }
}
