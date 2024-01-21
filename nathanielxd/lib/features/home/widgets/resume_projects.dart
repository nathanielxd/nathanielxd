import 'package:flutter/material.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/components/web_link.dart';
import 'package:nathanielxd/theme/theme.dart';

class ResumeProjects extends StatelessWidget {
  const ResumeProjects({required this.projects, super.key});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Projects',
          style: context.textTheme.labelLarge,
        ),
        ...projects.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 24),
            child: _ResumeProject(project: e),
          ),
        ),
      ],
    );
  }
}

class _ResumeProject extends StatelessWidget {
  const _ResumeProject({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (project.image != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                const PaddingHorizontal(60),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    project.image!,
                    width: 60,
                  ),
                ),
                const PaddingHorizontal(60),
              ],
            ),
          )
        else
          const PaddingHorizontal(180),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WebLink(
                url: project.url!,
                child: Text(
                  project.name!,
                  style: context.textTheme.titleSmall,
                ),
              ),
              if (project.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    project.description!,
                  ),
                ),
              if (project.highlights != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    project.highlights!.join(' • '),
                    style: TextStyle(
                      color: context.colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
