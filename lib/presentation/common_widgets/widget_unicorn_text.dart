import 'package:flutter/material.dart';

class UnicornText extends StatelessWidget {
  final String _text;
  final TextStyle _style;
  final Gradient _gradient;
  final TextOverflow _overflow;
  final TextAlign _align;
  final int _maxLines;

  UnicornText(
      {@required String text,
      @required Gradient gradient,
      @required TextStyle style,
      TextOverflow overflow,
      TextAlign align,
      int maxLines})
      : this._gradient = gradient,
        this._text = text,
        this._style = style,
        this._overflow = overflow,
        this._align = align,
        this._maxLines = maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        maxLines: _maxLines,
        overflow: _overflow,
        textAlign: _align,
        style: _style.copyWith(
          foreground: Paint()
            ..shader = _gradient
                .createShader((const Rect.fromLTWH(20.0,0.0, 300.0, 0))),
        ));
  }
}
