part of 'landing_cubit.dart';

sealed class LandingState extends Equatable {
  const LandingState();

  @override
  List<Object> get props => [];
}

final class LandingLoading extends LandingState {}

final class LandingInitialised extends LandingState {
  const LandingInitialised({
    required this.resume,
    required this.profilePictureURL,
  });

  final Resume resume;
  final String profilePictureURL;

  @override
  List<Object> get props => [resume, profilePictureURL];
}
