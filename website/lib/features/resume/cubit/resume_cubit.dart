import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathanielxd/domain/resume/resume.dart';

part 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit({
    required this.resumeRepository,
  }) : super(ResumeLoading()) {
    if (resumeRepository.currentResume == null ||
        resumeRepository.currentPictureURL == null ||
        resumeRepository.currentIcons.isEmpty) {
      initialize();
    } else {
      emit(
        ResumeInitialised(
          resume: resumeRepository.currentResume!,
          profilePictureURL: resumeRepository.currentPictureURL!,
          projectIconURLs: resumeRepository.currentIcons,
        ),
      );
    }
  }

  final ResumeRepository resumeRepository;

  Future<void> initialize() async {
    emit(ResumeLoading());

    final resume = await resumeRepository.get();
    final profilePictureURL = await resumeRepository.getProfilePicture();
    final projectIconURLs = await resumeRepository.getIcons();

    emit(
      ResumeInitialised(
        resume: resume,
        profilePictureURL: profilePictureURL,
        projectIconURLs: projectIconURLs,
      ),
    );
  }
}
