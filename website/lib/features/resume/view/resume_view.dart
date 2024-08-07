import 'package:flutter/material.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/resume/resume.dart';
import 'package:nathanielxd/features/resume/widgets/resume_awards.dart';
import 'package:nathanielxd/gen/assets.gen.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/theme.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({required this.resume, super.key});

  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 64),
        child: Column(
          children: [
            _ResumeBasics(
              basics: resume.basics,
            ),
            if (resume.work != null)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(child: ResumeWork(workplaces: resume.work!)),
              ),
            if (resume.awards != null)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ResumeAwards(awards: resume.awards!),
              ),
            if (resume.projects != null)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ResumeProjects(
                  projects: resume.projects!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ResumeBasics extends StatelessWidget {
  const _ResumeBasics({
    required this.basics,
  });

  final Basics basics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: Assets.headshot.provider(),
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
