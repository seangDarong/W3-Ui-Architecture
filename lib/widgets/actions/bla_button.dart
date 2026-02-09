import 'package:flutter/material.dart';
import 'package:blabla/theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String label;
  final ButtonType buttonType;
  final Icon? icon;
  final VoidCallback onButtonClick;

  const BlaButton({super.key, required this.label, required this.buttonType, this.icon, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    final bool isButtonPrimary = buttonType == ButtonType.primary;
    final Color backgroundColor = isButtonPrimary ? BlaColors.primary : BlaColors.white;
    final contentColor = isButtonPrimary ? BlaColors.white : BlaColors.primary;
    return ElevatedButton(
      onPressed: onButtonClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: contentColor,
        elevation: 0,
        shape: StadiumBorder(),
        side: isButtonPrimary ? null : BorderSide(color: BlaColors.greyLight),
        padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          SizedBox(width: 8),
          Text(label)
        ],
      ),
      );
  }
}
