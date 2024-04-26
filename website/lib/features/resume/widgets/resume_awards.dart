import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/theme.dart';

class ResumeAwards extends StatelessWidget {
  const ResumeAwards({required this.awards, super.key});

  final List<Award> awards;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Awards',
          style: context.textTheme.labelLarge,
        ),
        ...awards.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 24),
            child: _ResumeAward(award: e),
          ),
        ),
      ],
    );
  }
}

class _ResumeAward extends StatelessWidget {
  const _ResumeAward({required this.award, super.key});

  final Award award;

  @override
  Widget build(BuildContext context) {
    return AspectBuilder(
      builder: (context, aspect) {
        return switch (aspect) {
          Aspect.narrow => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (award.date != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _buildDate(),
                  ),
                if (award.title != null && award.awarder != null)
                  _buildSummary(context),
              ],
            ),
          Aspect.wide => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (award.date != null)
                  SizedBox(
                    width: 180,
                    child: _buildDate(),
                  ),
                if (award.title != null && award.awarder != null)
                  Expanded(
                    child: _buildSummary(context),
                  ),
              ],
            )
        };
      },
    );
  }

  Text _buildDate() {
    return Text(
      DateFormat('MMM yyyy').format(award.date!),
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${award.title} - ${award.awarder}',
          style: context.textTheme.titleSmall,
        ),
        if (award.summary != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              award.summary!,
            ),
          ),
      ],
    );
  }
}
