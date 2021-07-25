import 'package:flutter/material.dart';

class AnimatedVisibilityColumn extends StatelessWidget {
  const AnimatedVisibilityColumn({
    required this.visible,
    required this.children,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 1250),
  });
  final bool visible;
  final List<Widget> children;
  final Curve curve;
  final Duration duration;

  @override
  build(_) => AnimatedOpacity(
        curve: curve,
        duration: duration,
        opacity: visible ? 0 : 1,
        child: Column(children: children),
      );
}
