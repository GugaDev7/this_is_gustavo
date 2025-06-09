import 'dart:async';
import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;
  final String cursor;
  final TextAlign textAlign;

  const TypingText({
    super.key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 35),
    this.cursor = '|',
    this.textAlign = TextAlign.center,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int _currentLength = 0;
  bool _showCursor = true;
  Timer? _typingTimer;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
    _startCursor();
  }

  @override
  void didUpdateWidget(covariant TypingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _typingTimer?.cancel();
      setState(() {
        _currentLength = 0;
      });
      _startTyping();
    }
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(widget.speed, (timer) {
      if (_currentLength < widget.text.length) {
        setState(() {
          _currentLength++;
        });
      } else {
        _typingTimer?.cancel();
      }
    });
  }

  void _startCursor() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _showCursor = !_showCursor;
      });
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibleText = widget.text.substring(0, _currentLength);
    final isTyping = _currentLength < widget.text.length;
    return RichText(
      textAlign: widget.textAlign,
      text: TextSpan(
        style: widget.style,
        children: [
          TextSpan(text: visibleText),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child:
                isTyping
                    ? Text(widget.cursor, style: widget.style)
                    : Opacity(
                      opacity: _showCursor ? 1.0 : 0.0,
                      child: Text(widget.cursor, style: widget.style),
                    ),
          ),
        ],
      ),
    );
  }
}
