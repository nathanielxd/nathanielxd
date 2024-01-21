part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeInitialised extends HomeState {
  const HomeInitialised({
    required this.resume,
    required this.profilePictureURL,
  });

  final Resume resume;
  final String profilePictureURL;

  @override
  List<Object> get props => [resume, profilePictureURL];
}
