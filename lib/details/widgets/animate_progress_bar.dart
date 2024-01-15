import 'package:flutter/material.dart';

class AnimateProgressBar extends StatefulWidget {
  const AnimateProgressBar(
      {super.key,
      required this.maxValue,
      required this.value,
      required this.accentColor});
  final double maxValue;
  final double value;
  final Color accentColor;

  @override
  State<AnimateProgressBar> createState() => _AnimateProgressBarState();
}

class _AnimateProgressBarState extends State<AnimateProgressBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
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

    _controller.addListener(() {
      setState(() {
        // Update container properties based on animation value
        _containerWidth = _controller.value * _progressWidth;
      });
    });
    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        _progressWidth = _absWidth(constraints.biggest.width);
        return Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                  color: widget.accentColor.withAlpha(100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              height: 5,
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: ShapeDecoration(
                    color: widget.accentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                height: 5,
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
