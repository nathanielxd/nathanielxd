import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:nathanielxd/repositories/resume_repository.dart';

part 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit({
    required this.resumeRepository,
  }) : super(ResumeLoading()) {
    if (resumeRepository.currentResume == null ||
        resumeRepository.currentPictureURL == null) {
      initialize();
    } else {
      emit(
        ResumeInitialised(
          resume: resumeRepository.currentResume!,
          profilePictureURL: resumeRepository.currentPictureURL!,
        ),
      );
    }
  }

  final ResumeRepository resumeRepository;

  Future<void> initialize() async {
    emit(ResumeLoading());

    final resume = await resumeRepository.get();
    final profilePictureURL = await resumeRepository.getProfilePicture();

    emit(
      ResumeInitialised(resume: resume, profilePictureURL: profilePictureURL),
    );
  }
}
