# Migration Guide: MainBtn → MainButton

This guide helps you migrate from your original `MainBtn` widget to the published `MainButton` package.

## Why Migrate?

✅ **Better naming**: More intuitive parameter names  
✅ **Published package**: Easy to share across projects  
✅ **Better documentation**: Comprehensive docs and examples  
✅ **Community support**: Open source with issue tracking  
✅ **Maintained**: Regular updates and bug fixes  

## Quick Reference

### Parameter Name Changes

| Original (MainBtn) | New (MainButton) | Change Type |
|-------------------|------------------|-------------|
| `isRow` | `isDualLayout` | Internal (auto-set by constructor) |
| `fText` | `text` | Renamed |
| `fOnPressed` | `onPressed` | Renamed |
| `fBackColor` | `backgroundColor` | Renamed |
| `fTextColor` | `textColor` | Renamed |
| `fPrefixIcon` | `prefixIcon` | Renamed |
| `fSuffixIcon` | `suffixIcon` | Renamed |
| `fIsLoading` | `isLoading` | Renamed |
| `fIsIgnore` | `isDisabled` | Renamed |
| `fRadius` | `borderRadius` | Renamed |
| `fBorder` | `border` | Renamed |
| `fIconColor` | `iconColor` | Renamed |
| `fIconSize` | `iconSize` | Renamed |
| `MainBtn.row()` | `MainButton.dual()` | Constructor renamed |
| `sText` | `secondText` | Renamed |
| `sOnPressed` | `secondOnPressed` | Renamed |
| `sBackColor` | `secondBackgroundColor` | Renamed |
| `sTextColor` | `secondTextColor` | Renamed |
| `sPrefixIcon` | `secondPrefixIcon` | Renamed |
| `sSuffixIcon` | `secondSuffixIcon` | Renamed |
| `sIsLoading` | `secondIsLoading` | Renamed |
| `sIsIgnore` | `secondIsDisabled` | Renamed |
| `sRadius` | `secondBorderRadius` | Renamed |
| `sBorder` | `secondBorder` | Renamed |
| `sIconColor` | `secondIconColor` | Renamed |
| `sIconSize` | `secondIconSize` | Renamed |
| - | `buttonSpacing` | New (spacing between dual buttons) |

## Step-by-Step Migration

### 1. Install the Package

```yaml
# pubspec.yaml
dependencies:
  flutter_main_button: ^1.0.0
```

Run:
```bash
flutter pub get
```

### 2. Update Imports

**Before:**
```dart
import 'package:your_app/widgets/main_btn.dart';
```

**After:**
```dart
import 'package:flutter_main_button/flutter_main_button.dart';
```

### 3. Update Widget Names

**Before:**
```dart
MainBtn(...)
MainBtn.row(...)
```

**After:**
```dart
MainButton(...)
MainButton.dual(...)
```

### 4. Update Parameter Names

Use this find-and-replace strategy:

```
Find: fText:       Replace: text:
Find: fOnPressed:  Replace: onPressed:
Find: fBackColor:  Replace: backgroundColor:
Find: fTextColor:  Replace: textColor:
Find: fPrefixIcon: Replace: prefixIcon:
Find: fSuffixIcon: Replace: suffixIcon:
Find: fIsLoading:  Replace: isLoading:
Find: fIsIgnore:   Replace: isDisabled:
Find: fRadius:     Replace: borderRadius:
Find: fBorder:     Replace: border:
Find: fIconColor:  Replace: iconColor:
Find: fIconSize:   Replace: iconSize:

Find: sText:       Replace: secondText:
Find: sOnPressed:  Replace: secondOnPressed:
Find: sBackColor:  Replace: secondBackgroundColor:
Find: sTextColor:  Replace: secondTextColor:
Find: sPrefixIcon: Replace: secondPrefixIcon:
Find: sSuffixIcon: Replace: secondSuffixIcon:
Find: sIsLoading:  Replace: secondIsLoading:
Find: sIsIgnore:   Replace: secondIsDisabled:
Find: sRadius:     Replace: secondBorderRadius:
Find: sBorder:     Replace: secondBorder:
Find: sIconColor:  Replace: secondIconColor:
Find: sIconSize:   Replace: secondIconSize:
```

## Migration Examples

### Example 1: Single Button

**Before (MainBtn):**
```dart
MainBtn(
  fText: "Register New User",
  fBackColor: AppColors.primary,
  fIsLoading: isLoading,
  fOnPressed: isLoading ? null : _handleRegister,
)
```

**After (MainButton):**
```dart
MainButton(
  text: "Register New User",
  backgroundColor: AppColors.primary,
  isLoading: isLoading,
  onPressed: isLoading ? null : _handleRegister,
)
```

### Example 2: Dual Button Layout

**Before (MainBtn.row):**
```dart
MainBtn.row(
  height: 50,
  fText: cancelText,
  fBackColor: fConfirmColor ?? AppColors.cardGray,
  fTextColor: AppColors.black,
  fOnPressed: onCancel ?? () => Navigator.of(context).pop(false),
  sText: confirmText,
  sBackColor: confirmColor ?? AppColors.primary,
  sOnPressed: onConfirm ?? () => Navigator.of(context).pop(true),
)
```

**After (MainButton.dual):**
```dart
MainButton.dual(
  height: 50,
  text: cancelText,
  backgroundColor: fConfirmColor ?? AppColors.cardGray,
  textColor: AppColors.black,
  onPressed: onCancel ?? () => Navigator.of(context).pop(false),
  secondText: confirmText,
  secondBackgroundColor: confirmColor ?? AppColors.primary,
  secondOnPressed: onConfirm ?? () => Navigator.of(context).pop(true),
)
```

### Example 3: Button with Icons

**Before:**
```dart
MainBtn(
  fText: "Download",
  fPrefixIcon: Icons.download,
  fIconColor: Colors.white,
  fBackColor: Colors.blue,
  fOnPressed: handleDownload,
)
```

**After:**
```dart
MainButton(
  text: "Download",
  prefixIcon: Icons.download,
  iconColor: Colors.white,
  backgroundColor: Colors.blue,
  onPressed: handleDownload,
)
```

### Example 4: Custom Styling

**Before:**
```dart
MainBtn(
  fText: "Custom",
  fBackColor: Colors.purple,
  fTextColor: Colors.white,
  fRadius: BorderRadius.circular(30),
  fBorder: Border.all(color: Colors.purple.shade700),
  fOnPressed: handleAction,
)
```

**After:**
```dart
MainButton(
  text: "Custom",
  backgroundColor: Colors.purple,
  textColor: Colors.white,
  borderRadius: BorderRadius.circular(30),
  border: Border.all(color: Colors.purple.shade700),
  onPressed: handleAction,
)
```

## Automated Migration Script

If you have many files to migrate, use this script:

```bash
#!/bin/bash
# migrate_mainbtn.sh

# Find all Dart files and replace
find lib -name "*.dart" -type f -exec sed -i '' \
  -e 's/MainBtn\.row(/MainButton.dual(/g' \
  -e 's/MainBtn(/MainButton(/g' \
  -e 's/fText:/text:/g' \
  -e 's/fOnPressed:/onPressed:/g' \
  -e 's/fBackColor:/backgroundColor:/g' \
  -e 's/fTextColor:/textColor:/g' \
  -e 's/fPrefixIcon:/prefixIcon:/g' \
  -e 's/fSuffixIcon:/suffixIcon:/g' \
  -e 's/fIsLoading:/isLoading:/g' \
  -e 's/fIsIgnore:/isDisabled:/g' \
  -e 's/fRadius:/borderRadius:/g' \
  -e 's/fBorder:/border:/g' \
  -e 's/fIconColor:/iconColor:/g' \
  -e 's/fIconSize:/iconSize:/g' \
  -e 's/sText:/secondText:/g' \
  -e 's/sOnPressed:/secondOnPressed:/g' \
  -e 's/sBackColor:/secondBackgroundColor:/g' \
  -e 's/sTextColor:/secondTextColor:/g' \
  -e 's/sPrefixIcon:/secondPrefixIcon:/g' \
  -e 's/sSuffixIcon:/secondSuffixIcon:/g' \
  -e 's/sIsLoading:/secondIsLoading:/g' \
  -e 's/sIsIgnore:/secondIsDisabled:/g' \
  -e 's/sRadius:/secondBorderRadius:/g' \
  -e 's/sBorder:/secondBorder:/g' \
  -e 's/sIconColor:/secondIconColor:/g' \
  -e 's/sIconSize:/secondIconSize:/g' \
  {} \;

echo "Migration complete! Review changes before committing."
```

Make it executable and run:
```bash
chmod +x migrate_mainbtn.sh
./migrate_mainbtn.sh
```

⚠️ **Always review the changes and test thoroughly before committing!**

## Breaking Changes

The following changes may require additional adjustments:

1. **`isRow` parameter removed**: Now automatically handled by constructor
   - Use `MainButton()` for single button
   - Use `MainButton.dual()` for dual buttons

2. **Default width changed**: 
   - Old: `double.maxFinite`
   - New: `double.infinity`
   - Should have the same visual effect

3. **`isDisabled` replaces `isIgnore`**:
   - More intuitive naming
   - Same functionality

## Testing After Migration

Run these checks:

1. **Build the app**:
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --debug
   ```

2. **Test all buttons**:
   - Single buttons work
   - Dual buttons work
   - Loading states work
   - Icons display correctly
   - Disabled states work

3. **Visual check**:
   - Button styling matches original
   - Spacing is correct
   - Colors are correct

## Common Issues & Solutions

### Issue: Import not found
**Solution**: Make sure you've added the package to `pubspec.yaml` and ran `flutter pub get`

### Issue: Named parameter not found
**Solution**: Check the parameter name change table and update accordingly

### Issue: Button looks different
**Solution**: The new package has slightly different default border radius (15 vs 10). Set explicitly:
```dart
borderRadius: BorderRadius.circular(10), // Match old default
```

### Issue: Missing `isRow` parameter
**Solution**: 
- For single button: Use `MainButton()`
- For dual button: Use `MainButton.dual()`

## Need Help?

- Check the [README](README.md) for full documentation
- See the [example app](example) for working code
- Open an issue on GitHub if you encounter problems

## Rollback Plan

If you need to rollback:

1. Keep the original `main_btn.dart` file in your project
2. Test the migration thoroughly before removing it
3. Use version control (git) to easily revert if needed

```bash
# Commit before migration
git add .
git commit -m "Before MainButton migration"

# After migration, if issues arise
git revert HEAD  # or git reset --hard HEAD~1
```

---

**Migration completed successfully?** Consider removing the old `main_btn.dart` file and updating your documentation!
