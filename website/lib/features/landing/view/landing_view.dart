// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nathanielxd/features/landing/landing.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/scaffolding/padding_horizontal.dart';
import 'package:nathanielxd/theme/scaffolding/padding_vertical.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingCubit, LandingState>(
      builder: (context, state) {
        return switch (state) {
          LandingLoading() => const Center(child: CircularProgressIndicator()),
          LandingInitialised() => _LandingView(state: state)
        };
      },
    );
  }
}

class _LandingView extends StatefulWidget {
  const _LandingView({required this.state, super.key});

  final LandingInitialised state;

  @override
  State<_LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<_LandingView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.ease);

    slideAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, -1), end: const Offset(0, -1)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, -1), end: Offset.zero),
        weight: 1,
      ),
    ]).animate(animation);

    delayedPlay();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> delayedPlay() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (mounted) {
      await controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          heightFactor: 0.8,
          child: SelectionArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    CircleAvatar(
                      radius: 123,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage:
                              NetworkImage(widget.state.profilePictureURL),
                        ),
                      ),
                    ),
                    const PaddingHorizontal(24),
                    Column(
                      children: [
                        ProfileIcon(
                          icon: const Icon(Icons.email, size: 44),
                          label: 'Contact',
                          onTap: () => js.context.callMethod(
                            'open',
                            ['mailto:${widget.state.resume.basics.email}'],
                          ),
                        ),
                        const PaddingVertical(12),
                        ProfileIcon(
                          icon: const Icon(Icons.article, size: 44),
                          label: 'Resume',
                          onTap: () => context.go('/resume'),
                        ),
                        const PaddingVertical(12),
                        ProfileIcon(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Image.asset('assets/github.png', width: 36),
                          ),
                          label: 'Portfolio',
                          onTap: () => js.context.callMethod(
                            'open',
                            ['https://github.com/nathanielxd'],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                FadeTransition(
                  opacity: controller,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      widget.state.resume.basics.name,
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayLarge,
                    ),
                  ),
                ),
                SlideTransition(
                  position: slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      widget.state.resume.basics.label,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge!
                          .copyWith(fontSize: 24, fontFamily: 'Manrope'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
