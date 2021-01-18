import 'package:flutter/material.dart';

class UnicornButton extends StatelessWidget {
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final Gradient _gradient;
  final double _height;

  UnicornButton(
      {@required double radius,
      @required Gradient gradient,
      @required Widget child,
      @required VoidCallback onPressed,
      double height})
      : this._gradient = gradient,
        this._child = child,
        this._callback = onPressed,
        this._radius = radius,
        this._height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height != null ? _height : 50.0,
        child: RaisedButton(
          onPressed: (_callback),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: _gradient,
                borderRadius: BorderRadius.circular(_radius)),
            child: Container(
              constraints: BoxConstraints(maxWidth: double.infinity),
              alignment: Alignment.center,
              child: _child,
            ),
          ),
        ));
  }
}
