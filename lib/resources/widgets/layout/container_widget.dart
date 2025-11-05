import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;

  const ContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }

}
