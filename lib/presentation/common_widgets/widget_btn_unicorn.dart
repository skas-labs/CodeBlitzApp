import 'package:flutter/material.dart';

class UnicornButton extends StatelessWidget {
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final Gradient _gradient;

  UnicornButton({
    @required double radius,
    @required Gradient gradient,
    @required Widget child,
    @required VoidCallback onPressed,
  })
      : this._gradient = gradient,
        this._child = child,
        this._callback = onPressed,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: (_callback),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_radius)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: _gradient,
                borderRadius: BorderRadius.circular(_radius)
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: double.infinity, minHeight: 50.0),
              alignment: Alignment.center,
              child: _child,
            ),
          ),
        )
    );
  }
}
