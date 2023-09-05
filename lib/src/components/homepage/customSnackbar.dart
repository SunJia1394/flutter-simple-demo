import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final bool isSuccess;
  final String message;
  final Duration duration;
  final double topMargin;
  final double borderRadius;
  final Color successColor;
  final Color failureColor;

  const CustomSnackbar({
    required this.isSuccess,
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.topMargin = 8.0,
    this.borderRadius = 8.0,
    this.successColor = Colors.green,
    this.failureColor = Colors.red,
  });

  void showSnackBar(BuildContext context) {
    final snackbar = OverlayEntry(
      builder: (context) => Positioned(
        top: topMargin + MediaQuery.of(context).padding.top,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: isSuccess ? successColor : failureColor,
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(snackbar);

    Future.delayed(duration, () {
      snackbar.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
