import 'package:flutter/material.dart';
import 'package:flutter_bloc_di/cores/theme.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;
  final bool disabled;
  final Color? color;
  final Color? textColor;
  const CustomButton(
      {@required this.title,
      @required this.onPressed,
      this.disabled = false,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? AppTheme.blue),
        ),
        onPressed: disabled
            ? null
            : () {
                FocusScope.of(context).unfocus();
                onPressed!();
              },
        child: Center(
          child: Text(
            title!,
            style: TextStyle(color: textColor ?? AppTheme.white),
          ),
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;
  final bool primary;
  final bool disabled;
  const CustomOutlineButton(
      {this.title,
      this.onPressed,
      required this.primary,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: disabled
          ? AppTheme.roundUnactiveButton
          : primary
              ? AppTheme.roundOulineButtonPrimary
              : AppTheme.roundOulineButton,
      onPressed: disabled
          ? () {}
          : () {
              FocusScope.of(context).unfocus();
              onPressed!();
            },
      child: Center(
        child: Text(
          title!,
          style: TextStyle(
              color: primary ? AppTheme.white : AppTheme.colorRed,
              fontSize: AppTheme.fontSizeText),
        ),
      ),
    );
  }
}
