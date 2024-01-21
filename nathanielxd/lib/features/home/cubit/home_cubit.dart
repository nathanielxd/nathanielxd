import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:nathanielxd/repositories/resume_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.resumeRepository,
  }) : super(HomeLoading()) {
    initialize();
  }

  final ResumeRepository resumeRepository;

  Future<void> initialize() async {
    emit(HomeLoading());

    final resume = await resumeRepository.get();
    final profilePictureURL = await resumeRepository.getProfilePicture();

    emit(
      HomeInitialised(resume: resume, profilePictureURL: profilePictureURL),
    );
  }
}
