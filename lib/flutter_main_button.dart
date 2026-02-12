/// A versatile Flutter button widget with support for single and dual-button layouts.
///
/// This library provides [MainButton], a customizable button widget that includes:
/// * Loading states with spinner
/// * Prefix and suffix icons
/// * Single or dual-button (side-by-side) layouts
/// * Flexible styling options
/// * Disabled state handling
///
/// ## Getting Started
///
/// Import the library:
/// ```dart
/// import 'package:flutter_main_button/flutter_main_button.dart';
/// ```
///
/// Use a single button:
/// ```dart
/// MainButton(
///   text: "Submit",
///   onPressed: () => handleSubmit(),
/// )
/// ```
///
/// Use dual buttons:
/// ```dart
/// MainButton.dual(
///   firstText: "Cancel",
///   firstOnPressed: () => Navigator.pop(context),
///   secondText: "Confirm",
///   secondOnPressed: () => handleConfirm(),
/// )
/// ```
library flutter_main_button;

export 'src/main_button.dart';
