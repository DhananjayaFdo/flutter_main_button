import 'package:flutter/material.dart';

/// A versatile button widget that supports single or dual-button layouts.
///
/// [MainButton] provides a consistent button styling across your app with support for:
/// * Loading states with built-in spinner
/// * Prefix and suffix icons
/// * Single button or side-by-side dual buttons (row layout)
/// * Customizable colors, borders, and radius
/// * Disabled state handling
/// * Text overflow handling
///
/// Example (Single Button):
/// ```dart
/// MainButton(
///   text: "Submit",
///   onPressed: () => handleSubmit(),
///   isLoading: isSubmitting,
///   prefixIcon: Icons.check,
/// )
/// ```
///
/// Example (Dual Buttons):
/// ```dart
/// MainButton.dual(
///   firstText: "Cancel",
///   firstOnPressed: () => Navigator.pop(context),
///   secondText: "Confirm",
///   secondOnPressed: () => handleConfirm(),
/// )
/// ```
class MainButton extends StatelessWidget {
  /// Whether to display two buttons side by side.
  final bool isDualLayout;

  /// Height of the button(s).
  final double? height;

  /// Width of the button (only for single button layout).
  final double? width;

  // First/Primary button properties
  /// Border radius for the first/primary button.
  final BorderRadius? borderRadius;

  /// Border for the first/primary button.
  final BoxBorder? border;

  /// Background color for the first/primary button.
  final Color? backgroundColor;

  /// Text displayed on the first/primary button.
  final String? text;

  /// Icon displayed before text on the first/primary button.
  final IconData? prefixIcon;

  /// Icon displayed after text on the first/primary button.
  final IconData? suffixIcon;

  /// Callback when the first/primary button is pressed.
  final VoidCallback? onPressed;

  /// Text color for the first/primary button.
  final Color? textColor;

  /// Icon color for the first/primary button.
  final Color? iconColor;

  /// Whether the first/primary button is in loading state.
  final bool isLoading;

  /// Size of icons on the first/primary button.
  final double? iconSize;

  /// Whether to ignore pointer events on the first/primary button.
  final bool isDisabled;

  // Second button properties (only used in dual layout)
  /// Border radius for the second button.
  final BorderRadius? secondBorderRadius;

  /// Border for the second button.
  final BoxBorder? secondBorder;

  /// Background color for the second button.
  final Color? secondBackgroundColor;

  /// Text displayed on the second button.
  final String? secondText;

  /// Icon displayed before text on the second button.
  final IconData? secondPrefixIcon;

  /// Icon displayed after text on the second button.
  final IconData? secondSuffixIcon;

  /// Callback when the second button is pressed.
  final VoidCallback? secondOnPressed;

  /// Text color for the second button.
  final Color? secondTextColor;

  /// Icon color for the second button.
  final Color? secondIconColor;

  /// Whether the second button is in loading state.
  final bool secondIsLoading;

  /// Size of icons on the second button.
  final double? secondIconSize;

  /// Whether to ignore pointer events on the second button.
  final bool secondIsDisabled;

  // Common properties
  /// Font size for button text.
  final double? fontSize;

  /// Font weight for button text.
  final FontWeight? fontWeight;

  /// Padding inside the button(s).
  final EdgeInsetsGeometry? padding;

  /// Spacing between icon and text.
  final double iconSpacing;

  /// Spacing between the two buttons in dual layout.
  final double buttonSpacing;

  /// Creates a single button.
  ///
  /// The [text] and [onPressed] parameters are typically required for a
  /// functional button, though [onPressed] can be null to create a disabled button.
  const MainButton({
    super.key,
    this.height = 60,
    this.width,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.textColor,
    this.iconColor,
    this.isLoading = false,
    this.iconSize = 20,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.padding,
    this.iconSpacing = 8,
    this.isDisabled = false,
  })  : isDualLayout = false,
        secondBackgroundColor = null,
        secondBorder = null,
        secondBorderRadius = null,
        secondText = null,
        secondPrefixIcon = null,
        secondSuffixIcon = null,
        secondOnPressed = null,
        secondTextColor = null,
        secondIconColor = null,
        secondIsLoading = false,
        secondIconSize = null,
        secondIsDisabled = false,
        buttonSpacing = 10;

  /// Creates two buttons displayed side by side.
  ///
  /// Useful for cancel/confirm, previous/next, or other paired actions.
  ///
  /// Example:
  /// ```dart
  /// MainButton.dual(
  ///   firstText: "Cancel",
  ///   firstBackgroundColor: Colors.grey,
  ///   firstOnPressed: () => Navigator.pop(context),
  ///   secondText: "Confirm",
  ///   secondOnPressed: () => handleConfirm(),
  /// )
  /// ```
  const MainButton.dual({
    super.key,
    this.height = 60,
    this.width,
    // First button
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.textColor,
    this.iconColor,
    this.isLoading = false,
    this.iconSize = 20,
    this.isDisabled = false,
    // Second button
    this.secondBorder,
    this.secondBorderRadius,
    this.secondBackgroundColor,
    this.secondText,
    this.secondPrefixIcon,
    this.secondSuffixIcon,
    this.secondOnPressed,
    this.secondTextColor,
    this.secondIconColor,
    this.secondIsLoading = false,
    this.secondIconSize = 20,
    this.secondIsDisabled = false,
    // Common
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.padding,
    this.iconSpacing = 8,
    this.buttonSpacing = 10,
  }) : isDualLayout = true;

  @override
  Widget build(BuildContext context) {
    if (isDualLayout) {
      return Row(
        children: [
          Expanded(
            child: _buildButton(
              context: context,
              height: height,
              isDisabled: isDisabled,
              borderRadius: borderRadius,
              border: border,
              backgroundColor:
                  backgroundColor ?? Theme.of(context).colorScheme.primary,
              text: text,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              onPressed: onPressed,
              textColor: textColor,
              iconColor: iconColor,
              isLoading: isLoading,
              iconSize: iconSize,
            ),
          ),
          SizedBox(width: buttonSpacing),
          Expanded(
            child: _buildButton(
              context: context,
              height: height,
              borderRadius: secondBorderRadius,
              border: secondBorder,
              isDisabled: secondIsDisabled,
              backgroundColor: secondBackgroundColor ??
                  Theme.of(context).colorScheme.primary,
              text: secondText,
              prefixIcon: secondPrefixIcon,
              suffixIcon: secondSuffixIcon,
              onPressed: secondOnPressed,
              textColor: secondTextColor,
              iconColor: secondIconColor,
              isLoading: secondIsLoading,
              iconSize: secondIconSize,
            ),
          ),
        ],
      );
    }

    return _buildButton(
      context: context,
      height: height,
      width: width,
      isDisabled: isDisabled,
      borderRadius: borderRadius,
      border: border,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      text: text,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: onPressed,
      textColor: textColor,
      iconColor: iconColor,
      isLoading: isLoading,
      iconSize: iconSize,
    );
  }

  Widget _buildButton({
    required BuildContext context,
    double? height,
    double? width,
    required BorderRadius? borderRadius,
    required BoxBorder? border,
    required Color? backgroundColor,
    String? text,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onPressed,
    Color? textColor,
    Color? iconColor,
    bool isLoading = false,
    double? iconSize,
    bool isDisabled = false,
  }) {
    final effectiveTextColor = textColor ?? Colors.white;
    final effectiveIconColor = iconColor ?? textColor ?? Colors.white;
    final shouldDisable = onPressed == null || isLoading || isDisabled;

    return IgnorePointer(
      ignoring: isDisabled,
      child: InkWell(
        onTap: shouldDisable ? null : onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        child: Opacity(
          opacity: shouldDisable ? 0.6 : 1.0,
          child: Container(
            height: height,
            width: width ?? double.infinity,
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(15),
              border: border,
              color: backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null && !isLoading) ...[
                  Icon(
                    prefixIcon,
                    color: effectiveIconColor,
                    size: iconSize,
                  ),
                  SizedBox(width: iconSpacing),
                ],
                if (isLoading) ...[
                  SizedBox(
                    width: iconSize ?? 20,
                    height: iconSize ?? 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(effectiveTextColor),
                    ),
                  ),
                  if (text != null) SizedBox(width: iconSpacing),
                ],
                if (text != null)
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: effectiveTextColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (suffixIcon != null && !isLoading) ...[
                  SizedBox(width: iconSpacing),
                  Icon(
                    suffixIcon,
                    color: effectiveIconColor,
                    size: iconSize,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
