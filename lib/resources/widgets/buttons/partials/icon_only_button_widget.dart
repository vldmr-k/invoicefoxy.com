import 'package:flutter/material.dart';
import '/bootstrap/extensions.dart';
import '/resources/widgets/buttons/abstract/app_button.dart';

class IconOnlyButton extends AppButton {
  final Widget icon;
  final Color? color;
  final Color? backgroundColor;

  const IconOnlyButton({
    super.key,
    super.onPressed,
    required this.icon,
    this.color,
    this.backgroundColor,
    super.width,
    super.height,
  }) : super(text: '');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: this.backgroundColor,
          iconColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
        ),
        child: icon,
      ),
    );
  }
}
