import 'package:flutter/material.dart';
import 'package:nathanielxd/domain/resume/resume.dart';
import 'package:nathanielxd/features/landing/landing.dart';
import 'package:nathanielxd/gen/assets.gen.dart';
import 'package:nathanielxd/gen/fonts.gen.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/theme.dart';

import 'dart:js' as js;

class LandingView extends StatelessWidget {
  LandingView({required this.resume, super.key});

  final Resume resume;
  final notifier = CarouselNotifier(length: 2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ColorFiltered(
            colorFilter:
                const ColorFilter.mode(Colors.black87, BlendMode.color),
            child: Assets.backgrounds.malaga.image(fit: BoxFit.cover),
          ),
        ),
        Skeleton(
          maxWidth: 800,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const PaddingVertical(100),
              Row(
                children: [
                  Expanded(
                    child: _Profile(resume: resume),
                  ),
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: _Carousel(notifier: notifier),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({
    required this.resume,
    super.key,
  });

  final Resume resume;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 236, 106, 246),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Text(
              resume.basics.name.toUpperCase(),
              style: context.textTheme.displayLarge!.copyWith(
                fontFamily: FontFamily.bebasNeue,
                fontStyle: FontStyle.italic,
                color: context.colorScheme.surface,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: Text(
              resume.basics.label.toUpperCase(),
              style: context.textTheme.titleLarge!.copyWith(
                fontFamily: FontFamily.redditMono,
                fontWeight: FontWeight.w900,
                backgroundColor: context.colorScheme.surface,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: DefaultTextStyle(
              style: TextStyle(
                color: context.colorScheme.surface,
                fontFamily: FontFamily.redditMono,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('4 YRS'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: DefaultTextStyle(
              style: TextStyle(
                color: context.colorScheme.surface,
                fontFamily: FontFamily.redditMono,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'LEAD ENGINEER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('1 YR'),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 8),
            child: ProfileButton(
              label: 'EMAIL',
              icon: Icons.email_outlined,
              onTap: () => js.context
                  .callMethod('open', ['mailto:dragusinnathaniel@gmail.com']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 8),
            child: ProfileButton(
              label: 'GITHUB',
              icon: Icons.image_aspect_ratio_rounded,
              onTap: () => js.context
                  .callMethod('open', ['https://github.com/nathanielxd']),
            ),
          ),
        ],
      ),
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({
    required this.notifier,
    super.key,
  });

  final CarouselNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListenableBuilder(
          listenable: notifier,
          builder: (context, _) {
            return Material(
              shape: Border.all(width: 8, color: context.colorScheme.surface),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: ['lanchat.jpeg', 'lethologica.jpg']
                      .map(
                        (e) => Image.asset(
                          key: Key(e),
                          'assets/carousel/$e',
                        ),
                      )
                      .toList()[notifier.index],
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: notifier.previous,
                child: Material(
                  color: context.colorScheme.surface,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ),
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: notifier,
                builder: (context, _) => InkWell(
                  onTap: () => js.context.callMethod('open', [
                    [
                      'https://play.google.com/store/apps/details?id=com.nathanielxd.SimpleLANChat&pli=1',
                      'https://play.google.com/store/apps/details?id=com.brutempire.lethologica',
                    ][notifier.index],
                  ]),
                  child: SizedBox(
                    height: 44,
                    child: Material(
                      color: context.colorScheme.surface,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            ['LAN Chat', 'Lethologica'][notifier.index]
                                .toUpperCase(),
                            style: context.textTheme.titleMedium!.copyWith(
                              fontFamily: FontFamily.redditMono,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: notifier.next,
                child: Material(
                  color: context.colorScheme.surface,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    ),
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

class CarouselNotifier extends ChangeNotifier {
  CarouselNotifier({required this.length});

  final int length;
  int index = 0;

  void next() {
    if (index == length - 1) {
      index = 0;
    } else {
      index++;
    }
    notifyListeners();
  }

  void previous() {
    if (index == 0) {
      index = length - 1;
    } else {
      index--;
    }
    notifyListeners();
  }
}
