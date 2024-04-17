import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/domain/portfolio/portfolio.dart';
import 'package:nathanielxd/features/portfolio/portfolio.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PortfolioCubit(
        portfolioRepository: context.read<PortfolioRepository>(),
      ),
      child: const PortfolioView(),
    );
  }
}
