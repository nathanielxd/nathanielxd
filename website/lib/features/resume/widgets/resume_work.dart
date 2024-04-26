import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/components/aspect_builder.dart';

class ResumeWork extends StatelessWidget {
  const ResumeWork({required this.workplaces, super.key});

  final List<Workplace> workplaces;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: context.textTheme.labelLarge,
        ),
        ...workplaces.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 24),
            child: _ResumeWorkplace(workplace: e),
          ),
        ),
      ],
    );
  }
}

class _ResumeWorkplace extends StatelessWidget {
  const _ResumeWorkplace({required this.workplace, super.key});

  final Workplace workplace;

  @override
  Widget build(BuildContext context) {
    return AspectBuilder(
      builder: (context, orientation) {
        return switch (orientation) {
          Aspect.narrow => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (workplace.startDate != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _buildDate(),
                  ),
                if (workplace.name != null && workplace.position != null)
                  _buildSummary(context),
              ],
            ),
          Aspect.wide => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (workplace.startDate != null)
                  SizedBox(
                    width: 180,
                    child: _buildDate(),
                  ),
                if (workplace.name != null && workplace.position != null)
                  Expanded(
                    child: _buildSummary(context),
                  ),
              ],
            )
        };
      },
    );
  }

  Widget _buildDate() => Text(
        '${DateFormat('MMM yyyy').format(workplace.startDate!)}'
        // ignore: lines_longer_than_80_chars
        ' - ${workplace.endDate != null ? DateFormat('MMM yyyy').format(workplace.endDate!) : 'present'}',
      );

  Widget _buildSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${workplace.position} - ${workplace.name!}',
          style: context.textTheme.titleSmall,
        ),
        if (workplace.summary != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              workplace.summary!,
            ),
          ),
        if (workplace.highlights != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              workplace.highlights!.join(' • '),
              style: TextStyle(
                color: context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
          ),
      ],
    );
  }
}
