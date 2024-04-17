import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nathanielxd/domain/portfolio/portfolio.dart';
import 'package:nathanielxd/features/portfolio/portfolio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/scaffolding/padding_vertical.dart';
import 'package:nathanielxd/theme/theme.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      builder: (context, state) {
        return switch (state) {
          PortfolioLoading() =>
            const Center(child: CircularProgressIndicator()),
          PortfolioInitialised() => _PortfolioView(state: state)
        };
      },
    );
  }
}

class _PortfolioView extends StatelessWidget {
  const _PortfolioView({required this.state, super.key});

  final PortfolioInitialised state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SelectionArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...state.portfolio.map(
                      (e) => _PortfolioProject(
                        project: e,
                        iconURL: state.mediaURLs[e.icon]!,
                        screenshotURLs: Map.fromEntries(
                          state.mediaURLs.entries.where(
                            (element) => e.screenshots!.contains(element.key),
                          ),
                        ).values.toList(),
                      ),
                    ),
                    const PaddingVertical(64),
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

class _PortfolioProject extends StatelessWidget {
  const _PortfolioProject({
    required this.project,
    required this.iconURL,
    required this.screenshotURLs,
  });

  final PortfolioProject project;
  final String iconURL;
  final List<String> screenshotURLs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PaddingVertical(32),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            iconURL,
            width: 60,
          ),
        ),
        const PaddingVertical(16),
        Text(
          project.name,
          style: context.textTheme.labelLarge,
        ),
        const PaddingVertical(8),
        MarkdownBody(data: project.description),
        if (project.urls != null)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              'Links',
              style: context.textTheme.labelLarge,
            ),
          ),
        if (project.urls != null)
          ...project.urls!.map(
            (e) => Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  const Text('•'),
                  const PaddingHorizontal(16),
                  Expanded(
                    child: WebLink(
                      url: e.url,
                      child: Text(
                        e.label,
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
