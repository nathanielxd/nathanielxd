import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathanielxd/domain/portfolio/portfolio.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit({
    required this.portfolioRepository,
  }) : super(PortfolioLoading()) {
    if (portfolioRepository.currentPortfolio == null ||
        portfolioRepository.currentMedia.isEmpty) {
      initialize();
    } else {
      emit(
        PortfolioInitialised(
          portfolio: portfolioRepository.currentPortfolio!,
          mediaURLs: portfolioRepository.currentMedia,
        ),
      );
    }
  }

  final PortfolioRepository portfolioRepository;

  Future<void> initialize() async {
    emit(PortfolioLoading());

    final portfolio = await portfolioRepository.get();

    if (portfolioRepository.currentMedia.isEmpty) {
      await portfolioRepository.getMedia();
    }

    emit(
      PortfolioInitialised(
        portfolio: portfolio,
        mediaURLs: portfolioRepository.currentMedia,
      ),
    );
  }
}
