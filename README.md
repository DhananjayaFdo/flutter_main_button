# flutter_main_button

A versatile and customizable Flutter button widget that supports both single and dual-button layouts with built-in loading states, icons, and extensive styling options.

## Features

✨ **Single & Dual Layouts**: Use as a single button or display two buttons side-by-side  
🔄 **Loading States**: Built-in loading spinner with automatic state handling  
🎨 **Fully Customizable**: Colors, borders, radius, padding, and more  
📱 **Icons Support**: Prefix and suffix icons for enhanced UX  
♿ **Accessibility**: Proper disabled state handling  
🎯 **Type Safe**: Strongly typed with comprehensive documentation  

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_main_button: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Single Button

```dart
import 'package:flutter_main_button/flutter_main_button.dart';

MainButton(
  text: "Submit",
  onPressed: () {
    print("Button pressed!");
  },
)
```

### Button with Loading State

```dart
MainButton(
  text: "Register",
  isLoading: isSubmitting,
  onPressed: isSubmitting ? null : () async {
    setState(() => isSubmitting = true);
    await registerUser();
    setState(() => isSubmitting = false);
  },
)
```

### Button with Icons

```dart
MainButton(
  text: "Download",
  prefixIcon: Icons.download,
  onPressed: () => handleDownload(),
)

// Or with suffix icon
MainButton(
  text: "Next",
  suffixIcon: Icons.arrow_forward,
  onPressed: () => goToNextPage(),
)
```

### Custom Styling

```dart
MainButton(
  text: "Custom Button",
  backgroundColor: Colors.blue,
  textColor: Colors.white,
  borderRadius: BorderRadius.circular(30),
  border: Border.all(color: Colors.blue.shade700, width: 2),
  height: 50,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  onPressed: () => handleAction(),
)
```

### Dual Button Layout

Perfect for dialogs, confirmations, or navigation:

```dart
MainButton.dual(
  // First button (typically Cancel/Back)
  text: "Cancel",
  backgroundColor: Colors.grey.shade300,
  textColor: Colors.black,
  onPressed: () => Navigator.pop(context),
  
  // Second button (typically Confirm/Next)
  secondText: "Confirm",
  secondBackgroundColor: Colors.blue,
  secondOnPressed: () => handleConfirm(),
)
```

### Dual Buttons with Different Icons

```dart
MainButton.dual(
  // Previous button
  text: "Previous",
  prefixIcon: Icons.arrow_back,
  backgroundColor: Colors.grey,
  onPressed: () => previousPage(),
  
  // Next button
  secondText: "Next",
  secondSuffixIcon: Icons.arrow_forward,
  secondOnPressed: () => nextPage(),
)
```

### In Dialogs

```dart
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text("Confirm Action"),
    content: Text("Are you sure you want to proceed?"),
    actions: [
      MainButton.dual(
        height: 45,
        text: "Cancel",
        backgroundColor: Colors.grey.shade200,
        textColor: Colors.black87,
        onPressed: () => Navigator.pop(context, false),
        secondText: "Confirm",
        secondBackgroundColor: Colors.red,
        secondOnPressed: () => Navigator.pop(context, true),
      ),
    ],
  ),
);
```

### With Loading State in Forms

```dart
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool isLoading = false;

  Future<void> handleRegister() async {
    setState(() => isLoading = true);
    
    try {
      await registerUser();
      // Success handling
    } catch (e) {
      // Error handling
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainButton(
      text: "Register New User",
      isLoading: isLoading,
      onPressed: isLoading ? null : handleRegister,
    );
  }
}
```

### Disabled Button

```dart
MainButton(
  text: "Submit",
  onPressed: null, // null onPressed disables the button
)

// Or explicitly disabled
MainButton(
  text: "Submit",
  isDisabled: true,
  onPressed: () => handleSubmit(),
)
```

## API Reference

### MainButton (Single)

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `text` | `String?` | - | Text displayed on the button |
| `onPressed` | `VoidCallback?` | - | Callback when button is tapped |
| `backgroundColor` | `Color?` | `Theme primary` | Button background color |
| `textColor` | `Color?` | `Colors.white` | Text color |
| `isLoading` | `bool` | `false` | Shows loading spinner when true |
| `isDisabled` | `bool` | `false` | Disables button interactions |
| `height` | `double?` | `60` | Button height |
| `width` | `double?` | `double.infinity` | Button width (single layout only) |
| `prefixIcon` | `IconData?` | - | Icon displayed before text |
| `suffixIcon` | `IconData?` | - | Icon displayed after text |
| `iconColor` | `Color?` | `textColor` | Icon color |
| `iconSize` | `double?` | `20` | Icon size |
| `iconSpacing` | `double` | `8` | Space between icon and text |
| `fontSize` | `double?` | `16` | Text font size |
| `fontWeight` | `FontWeight?` | `FontWeight.w600` | Text font weight |
| `borderRadius` | `BorderRadius?` | `BorderRadius.circular(15)` | Button border radius |
| `border` | `BoxBorder?` | - | Button border |
| `padding` | `EdgeInsetsGeometry?` | `EdgeInsets.symmetric(horizontal: 16)` | Internal padding |

### MainButton.dual (Dual Layout)

In addition to the single button parameters, the dual layout includes:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `secondText` | `String?` | - | Text for second button |
| `secondOnPressed` | `VoidCallback?` | - | Callback for second button |
| `secondBackgroundColor` | `Color?` | `Theme primary` | Second button background |
| `secondTextColor` | `Color?` | `Colors.white` | Second button text color |
| `secondIsLoading` | `bool` | `false` | Loading state for second button |
| `secondIsDisabled` | `bool` | `false` | Disabled state for second button |
| `secondPrefixIcon` | `IconData?` | - | Second button prefix icon |
| `secondSuffixIcon` | `IconData?` | - | Second button suffix icon |
| `secondIconColor` | `Color?` | - | Second button icon color |
| `secondIconSize` | `double?` | `20` | Second button icon size |
| `secondBorderRadius` | `BorderRadius?` | - | Second button border radius |
| `secondBorder` | `BoxBorder?` | - | Second button border |
| `buttonSpacing` | `double` | `10` | Space between the two buttons |

## Common Use Cases

### 1. Form Submit Button
```dart
MainButton(
  text: "Submit Form",
  isLoading: state.isSubmitting,
  onPressed: state.isSubmitting ? null : () => submitForm(),
)
```

### 2. Dialog Actions
```dart
MainButton.dual(
  text: "Cancel",
  backgroundColor: Colors.grey.shade300,
  textColor: Colors.black,
  onPressed: () => Navigator.pop(context),
  secondText: "Delete",
  secondBackgroundColor: Colors.red,
  secondOnPressed: () => handleDelete(),
)
```

### 3. Navigation Buttons
```dart
MainButton.dual(
  text: "Back",
  prefixIcon: Icons.arrow_back,
  onPressed: () => previousStep(),
  secondText: "Next",
  secondSuffixIcon: Icons.arrow_forward,
  secondOnPressed: () => nextStep(),
)
```

### 4. Authentication Buttons
```dart
// Login button
MainButton(
  text: "Sign In",
  isLoading: isLoggingIn,
  onPressed: () => handleLogin(),
)

// Social login with icon
MainButton(
  text: "Continue with Google",
  prefixIcon: Icons.login,
  backgroundColor: Colors.white,
  textColor: Colors.black87,
  border: Border.all(color: Colors.grey.shade300),
  onPressed: () => signInWithGoogle(),
)
```

## Best Practices

1. **Loading States**: Always disable the button when loading
   ```dart
   onPressed: isLoading ? null : handleAction
   ```

2. **Form Validation**: Use with form validation
   ```dart
   MainButton(
     text: "Submit",
     onPressed: isFormValid ? handleSubmit : null,
   )
   ```

3. **Async Operations**: Handle async properly
   ```dart
   onPressed: () async {
     setState(() => isLoading = true);
     try {
       await performAction();
     } finally {
       if (mounted) setState(() => isLoading = false);
     }
   }
   ```

4. **Dialogs**: Use dual layout for better UX
   ```dart
   MainButton.dual(
     text: "Cancel",
     onPressed: () => Navigator.pop(context),
     secondText: "Confirm",
     secondOnPressed: handleConfirm,
   )
   ```

## Migration from Original MainBtn

If you're migrating from the original `MainBtn` widget:

### Parameter Name Changes:

| Old | New |
|-----|-----|
| `fText` | `text` |
| `fOnPressed` | `onPressed` |
| `fBackColor` | `backgroundColor` |
| `fTextColor` | `textColor` |
| `fPrefixIcon` | `prefixIcon` |
| `fSuffixIcon` | `suffixIcon` |
| `fIsLoading` | `isLoading` |
| `fIsIgnore` | `isDisabled` |
| `fRadius` | `borderRadius` |
| `fBorder` | `border` |
| `MainBtn.row` | `MainButton.dual` |
| `sText` | `secondText` |
| `sOnPressed` | `secondOnPressed` |
| (etc for all second button props) | (add `second` prefix) |

### Example Migration:

**Before:**
```dart
MainBtn.row(
  fText: "Cancel",
  fBackColor: Colors.grey,
  fOnPressed: () => Navigator.pop(context),
  sText: "Confirm",
  sBackColor: Colors.blue,
  sOnPressed: handleConfirm,
)
```

**After:**
```dart
MainButton.dual(
  text: "Cancel",
  backgroundColor: Colors.grey,
  onPressed: () => Navigator.pop(context),
  secondText: "Confirm",
  secondBackgroundColor: Colors.blue,
  secondOnPressed: handleConfirm,
)
```

## Example App

See the [example](example) directory for a complete working demo showing all features.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you find this package useful, please give it a ⭐ on [GitHub](https://github.com/YOURUSERNAME/flutter_main_button)!

For issues and feature requests, visit the [issue tracker](https://github.com/YOURUSERNAME/flutter_main_button/issues).
