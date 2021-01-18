import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressWithText extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final double progress;

  const ProgressWithText(
      {@required this.progress, this.primaryText, this.secondaryText, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * progress,
          animation: true,
          lineHeight: 16.0,
          animationDuration: 2500,
          percent: 0.8,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Colors.green,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: RichText(
            text: TextSpan(
                text: primaryText,
                style: FONT_CONST.BOLD_WHITE_14
                    .copyWith(color: COLOR_CONST.PRIMARY),
                children: <TextSpan>[
                  TextSpan(
                    text: "\n$secondaryText",
                  ),
                ]),
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
