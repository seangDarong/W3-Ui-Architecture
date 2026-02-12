import 'package:flutter/material.dart';
import '../../theme/theme.dart';

///
/// A generic input tile widget that displays an icon, title, and handles tap events.
/// Used for location, date, and other selection inputs.
///
class BlaInputTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const BlaInputTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: BlaColors.neutralDark),
      title: Text(
        title,
        style: BlaTextStyles.label.copyWith(color: BlaColors.neutralDark),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
