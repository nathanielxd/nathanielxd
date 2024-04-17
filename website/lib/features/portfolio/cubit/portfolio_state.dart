part of 'portfolio_cubit.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

final class PortfolioLoading extends PortfolioState {}

final class PortfolioInitialised extends PortfolioState {
  const PortfolioInitialised({
    required this.portfolio,
    required this.mediaURLs,
  });

  final List<PortfolioProject> portfolio;
  final Map<String, String> mediaURLs;

  @override
  List<Object> get props => [portfolio, mediaURLs];
}
