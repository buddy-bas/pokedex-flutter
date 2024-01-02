import 'package:flutter/material.dart';

class AnimateProgressBar extends StatefulWidget {
  const AnimateProgressBar(
      {super.key, required this.maxValue, required this.value});
  final double maxValue;
  final double value;

  @override
  State<AnimateProgressBar> createState() => _AnimateProgressBarState();
}

class _AnimateProgressBarState extends State<AnimateProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _progressWidth = 0.0;
  double _containerWidth = 0.0;

  double _absWidth(maxWidth) {
    final valueRatio = widget.value / widget.maxValue;
    final width = valueRatio * maxWidth;
    return width;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _controller.forward(); // Start the animation
    _controller.addListener(() {
      setState(() {
        // Update container properties based on animation value
        _containerWidth = _controller.value * _progressWidth;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        _progressWidth = _absWidth(constraints.biggest.width);
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.amber.shade100),
              height: 4,
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: const BoxDecoration(color: Colors.amber),
                height: 4,
                width: _containerWidth,
                curve: Curves.easeOut)
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
