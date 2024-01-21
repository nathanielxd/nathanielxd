import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/features/home/home.dart';
import 'package:nathanielxd/features/home/widgets/resume_awards.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoading() => const Center(child: CircularProgressIndicator()),
            HomeInitialised() => _HomeView(state: state)
          };
        },
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.state,
    super.key,
  });

  final HomeInitialised state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SelectionArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 64, 16, 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ResumeBasics(
                      basics: state.resume.basics,
                      profilePictureURL: state.profilePictureURL,
                    ),
                    if (state.resume.work != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: ResumeWork(workplaces: state.resume.work!),
                      ),
                    if (state.resume.awards != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: ResumeAwards(awards: state.resume.awards!),
                      ),
                    if (state.resume.projects != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: ResumeProjects(projects: state.resume.projects!),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResumeBasics extends StatelessWidget {
  const _ResumeBasics({
    required this.basics,
    required this.profilePictureURL,
  });

  final Basics basics;
  final String profilePictureURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profilePictureURL),
              radius: 48,
            ),
            const PaddingHorizontal(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  basics.name,
                  style: context.textTheme.headlineMedium,
                ),
                Text(
                  basics.label,
                ),
                const PaddingVertical(4),
                WebEmail(
                  email: basics.email,
                  child: Text(
                    basics.email,
                    style: TextStyle(
                      color:
                          context.textTheme.bodyMedium!.color!.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            'Links',
            style: context.textTheme.labelLarge,
          ),
        ),
        ...basics.profiles.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 180,
                  child: Text(e.network),
                ),
                Expanded(
                  child: WebLink(
                    url: e.url,
                    child: Text(
                      e.username,
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 16),
          child: Text(
            'About',
            style: context.textTheme.labelLarge,
          ),
        ),
        Text(basics.summary, textAlign: TextAlign.justify),
      ],
    );
  }
}
