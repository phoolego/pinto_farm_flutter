import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';

class PintoButton extends StatelessWidget {
  double width=200;
  var function;
  Color? buttonColor = deepOrange;
  String label;
  TextStyle textStyle = kNormalTextStyle;

  PintoButton(
      {this.width=200,
      required this.label,
      required this.function,
      this.buttonColor=deepOrange,
      this.textStyle=kNormalTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: InkWell(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
