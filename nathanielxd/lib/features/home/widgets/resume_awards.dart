import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nathanielxd/models/models.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (award.date != null)
          SizedBox(
            width: 180,
            child: Text(
              DateFormat('MMM yyyy').format(award.date!),
            ),
          ),
        if (award.title != null && award.awarder != null)
          Expanded(
            child: Column(
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
            ),
          ),
      ],
    );
  }
}
