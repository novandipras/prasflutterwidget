import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prasflutterwidget/core/utils/const/string/custom_color.dart';

class CustomToast {
  final BuildContext context;

  CustomToast.of(this.context);

  static void showSuccess(
    String message, {
    required BuildContext context,
    animation = StyledToastAnimation.slideFromTop,
    reverseAnimation = StyledToastAnimation.fade,
    Duration animDuration = const Duration(milliseconds: 200),
    StyledToastPosition position = StyledToastPosition.top,
    Duration duration = const Duration(seconds: 5),
  }) async {
    showToastWidget(
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.statusSuccess,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                message,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      context: context,
      duration: duration,
      position: position,
      animation: animation,
      animDuration: animDuration,
      reverseAnimation: reverseAnimation,
    );
  }

  static void showError(
    String message, {
    required BuildContext context,
    animation = StyledToastAnimation.fade,
    reverseAnimation = StyledToastAnimation.fade,
    Duration animDuration = const Duration(milliseconds: 200),
    StyledToastPosition position = StyledToastPosition.top,
    Duration duration = const Duration(seconds: 7),
  }) async {
    showToastWidget(
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColor.statusFailed,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                message,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      context: context,
      duration: duration,
      position: position,
      animation: animation,
      animDuration: animDuration,
      reverseAnimation: reverseAnimation,
    );
  }
  
  void $howSuccess(String message) => showSuccess(message, context: context);
  void $howError(String message) => showError(message, context: context);
}
