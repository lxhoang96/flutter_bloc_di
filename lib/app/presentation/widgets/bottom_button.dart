import 'package:flutter/material.dart';

import 'custom_button.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final bool disabled;
  final bool secondButton;
  final Function? secondButtonOnPress;
  final String? secondButtonTitle;
  final Color? secondButtonBgColor;
  final Color? secondButtonTextColor;
  final Widget? topContent;

  BottomButton({
    required this.onPress,
    required this.title,
    this.disabled = false,
    this.secondButton = false,
    this.secondButtonOnPress,
    this.secondButtonTitle,
    this.secondButtonBgColor,
    this.secondButtonTextColor,
    this.topContent,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topContent ?? SizedBox(),
            IntrinsicHeight(
              child: Row(
                children: [
                  secondButton
                      ? Expanded(
                          child: CustomOutlineButton(
                            primary: false,
                            onPressed: secondButtonOnPress,
                            title: secondButtonTitle,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: secondButton ? 15 : 0,
                  ),
                  Expanded(
                    child: CustomOutlineButton(
                      title: title,
                      primary: true,
                      onPressed: onPress,
                      disabled: disabled,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
