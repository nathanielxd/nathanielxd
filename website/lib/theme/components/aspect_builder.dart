import 'package:flutter/material.dart';

enum Aspect { narrow, wide }

class AspectBuilder extends StatefulWidget {
  const AspectBuilder({required this.builder, super.key});

  final Widget Function(BuildContext, Aspect) builder;

  @override
  AspectBuilderState createState() => AspectBuilderState();
}

class AspectBuilderState extends State<AspectBuilder>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = View.of(context).physicalSize.width;
        height = View.of(context).physicalSize.height;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  double width = 0;
  double height = 0;

  @override
  void didChangeMetrics() {
    setState(() {
      width = View.of(context).physicalSize.width;
      height = View.of(context).physicalSize.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (width > height)
        ? widget.builder(context, Aspect.wide)
        : widget.builder(context, Aspect.narrow);
  }
}
