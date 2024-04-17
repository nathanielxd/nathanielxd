import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:nathanielxd/repositories/resume_repository.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit({
    required this.resumeRepository,
  }) : super(LandingLoading()) {
    if (resumeRepository.currentResume == null ||
        resumeRepository.currentPictureURL == null) {
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

    emit(
      LandingInitialised(resume: resume, profilePictureURL: profilePictureURL),
    );
  }
}
