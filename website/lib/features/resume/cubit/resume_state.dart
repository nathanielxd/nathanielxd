part of 'resume_cubit.dart';

sealed class ResumeState extends Equatable {
  const ResumeState();

  @override
  List<Object> get props => [];
}

final class ResumeLoading extends ResumeState {}

final class ResumeInitialised extends ResumeState {
  const ResumeInitialised({
    required this.resume,
    required this.profilePictureURL,
    required this.projectIconURLs,
  });

  final Resume resume;
  final String profilePictureURL;
  final Map<String, String> projectIconURLs;

  @override
  List<Object> get props => [resume, profilePictureURL, projectIconURLs];
}
