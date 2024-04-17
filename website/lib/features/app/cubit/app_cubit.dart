import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/domain/portfolio/portfolio.dart';
import 'package:nathanielxd/domain/resume/resume.dart';

class AppCubit extends Cubit<void> {
  AppCubit({
    required this.resumeRepository,
    required this.portfolioRepository,
  }) : super(null) {
    initialize();
  }

  final ResumeRepository resumeRepository;
  final PortfolioRepository portfolioRepository;

  Future<void> initialize() async {
    // unawaited(portfolioRepository.getMedia());
  }
}
