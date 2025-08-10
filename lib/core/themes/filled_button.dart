import 'package:flutter/material.dart';

final ButtonStyle _filledButtonStyle = FilledButton.styleFrom(
  backgroundColor: Colors.transparent,
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    side: const BorderSide(
      color: Colors.transparent, // Placeholder, will be overridden
    ),
  ),
).copyWith(
  overlayColor: WidgetStateProperty.resolveWith<Color?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.hovered)) {
        return Colors.black.withOpacity(0.05); // Example hover color
      }
      if (states.contains(WidgetState.focused) ||
          states.contains(WidgetState.pressed)) {
        return Colors.black.withOpacity(0.1); // Example pressed color
      }
      return null; // Use the component's default.
    },
  ),
  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
  shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
  surfaceTintColor: WidgetStateProperty.all<Color>(Colors.transparent),
  side: WidgetStateProperty.resolveWith<BorderSide>(
    (Set<WidgetState> states) {
      return const BorderSide(
        color: Colors.transparent, // Placeholder, will be overridden
      );
    },
  ),
  backgroundColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      return Colors.transparent;
    },
  ),
);

class GradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const GradientButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0x66000000),
            Color(0x18000000),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: FilledButton(
        style: _filledButtonStyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
