import 'dart:async';
import 'package:flutter/material.dart';

// Widget para efeito de digitação com cursor animado
class TypingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;
  final String cursor;
  final bool showCursor;
  final bool showCursorAtEnd;
  final VoidCallback? onFinished;
  final TextAlign? textAlign;

  const TypingText({
    super.key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 30),
    this.cursor = '|',
    this.showCursor = true,
    this.showCursorAtEnd = true,
    this.onFinished,
    this.textAlign,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int _currentIndex = 0;
  Timer? _typingTimer;
  Timer? _blinkTimer;
  bool _finished = false;
  bool _showBlinkCursor = true;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(widget.speed, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _currentIndex++;
        });
      } else {
        _typingTimer?.cancel();
        if (!_finished) {
          _finished = true;
          widget.onFinished?.call();
          _startBlinking();
        }
      }
    });
  }

  void _startBlinking() {
    if (widget.showCursor && widget.showCursorAtEnd) {
      _blinkTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
        setState(() {
          _showBlinkCursor = !_showBlinkCursor;
        });
      });
    }
  }

  @override
  void didUpdateWidget(TypingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _typingTimer?.cancel();
      _blinkTimer?.cancel();
      _currentIndex = 0;
      _finished = false;
      _startTyping();
    }
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTyping = _currentIndex < widget.text.length;
    final showCursor =
        widget.showCursor &&
        (isTyping || (widget.showCursorAtEnd && !isTyping && _showBlinkCursor));
    final text = widget.text.substring(0, _currentIndex);

    return RichText(
      text: TextSpan(
        style: widget.style,
        children: [
          TextSpan(text: text),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: AnimatedOpacity(
              opacity: showCursor ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 100),
              child: Text(
                widget.cursor,
                style: widget.style?.copyWith(
                  height: 1.0,
                  fontSize: widget.style?.fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
      textAlign: widget.textAlign ?? TextAlign.start,
    );
  }
}
