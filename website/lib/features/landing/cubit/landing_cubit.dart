import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathanielxd/domain/resume/resume.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit({
    required this.resumeRepository,
  }) : super(LandingLoading()) {
    if (resumeRepository.currentResume == null ||
        resumeRepository.currentPictureURL == null ||
        resumeRepository.currentIcons.isEmpty) {
      initialize();
    } else {
      emit(
        LandingInitialised(
          resume: resumeRepository.currentResume!,
          profilePictureURL: resumeRepository.currentPictureURL!,
        ),
      );
    }
  }

  final ResumeRepository resumeRepository;

  Future<void> initialize() async {
    emit(LandingLoading());

    final resume = await resumeRepository.get();
    final profilePictureURL = await resumeRepository.getProfilePicture();
    // Cache icons for smooth transition to resume page.
    await resumeRepository.getIcons();

    emit(
      LandingInitialised(
        resume: resume,
        profilePictureURL: profilePictureURL,
      ),
    );
  }
}
