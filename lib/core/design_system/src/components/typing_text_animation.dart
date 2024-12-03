import 'package:flutter/material.dart';

class TypingTextAnimation extends StatefulWidget {
  final List<String> texts;
  final TextStyle textStyle;

  const TypingTextAnimation({
    super.key,
    required this.texts,
    required this.textStyle,
  });

  @override
  TypingTextAnimationState createState() => TypingTextAnimationState();
}

class TypingTextAnimationState extends State<TypingTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;
  int _currentTextIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          Duration(milliseconds: widget.texts[_currentTextIndex].length * 150),
    );

    _animation = IntTween(
      begin: 0,
      end: widget.texts[_currentTextIndex].length,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          // Move to the next text after the delay
          setState(() {
            _currentTextIndex = (_currentTextIndex + 1) % widget.texts.length;
            int newTextLength = widget.texts[_currentTextIndex].length;
            _animationController.duration =
                Duration(milliseconds: newTextLength * 150);
            _animation = IntTween(
              begin: 0,
              end: newTextLength,
            ).animate(
              CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut),
            );
            _animationController.reset();
            _animationController.forward();
          });
        });
      }
    });

    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant TypingTextAnimation oldWidget) {
    if (widget.texts.firstOrNull != oldWidget.texts.firstOrNull)
      setState(() {
        _animationController
          ..reset()
          ..forward();
      });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        int currentIndex =
            _animation.value.clamp(0, widget.texts[_currentTextIndex].length);
        String displayText =
            widget.texts[_currentTextIndex].substring(0, currentIndex);
        return Flexible(
          child: Text(
            displayText + "_",
            style: widget.textStyle,
          ),
        );
      },
    );
  }
}
