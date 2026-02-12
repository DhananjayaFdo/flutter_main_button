import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_main_button/flutter_main_button.dart';

void main() {
  group('MainButton Tests', () {
    testWidgets('renders text correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Tap Me',
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tap Me'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('shows loading indicator when isLoading is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Loading',
              isLoading: true,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('does not call onPressed when loading',
        (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Loading',
              isLoading: true,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Loading'));
      await tester.pump();

      expect(wasPressed, isFalse);
    });

    testWidgets('shows prefix icon when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Icon Button',
              prefixIcon: Icons.star,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('shows suffix icon when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Icon Button',
              suffixIcon: Icons.arrow_forward,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('dual layout renders both buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton.dual(
              text: 'First',
              onPressed: () {},
              secondText: 'Second',
              secondOnPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('dual layout calls correct callback',
        (WidgetTester tester) async {
      bool firstPressed = false;
      bool secondPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton.dual(
              text: 'First',
              onPressed: () => firstPressed = true,
              secondText: 'Second',
              secondOnPressed: () => secondPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('First'));
      await tester.pump();
      expect(firstPressed, isTrue);
      expect(secondPressed, isFalse);

      await tester.tap(find.text('Second'));
      await tester.pump();
      expect(secondPressed, isTrue);
    });

    testWidgets('disabled button is not tappable',
        (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Disabled',
              isDisabled: true,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Disabled'));
      await tester.pump();

      expect(wasPressed, isFalse);
    });

    testWidgets('applies custom background color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Custom Color',
              backgroundColor: Colors.red,
              onPressed: () {},
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(MainButton),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.red);
    });

    testWidgets('applies custom text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Custom Text',
              textColor: Colors.green,
              onPressed: () {},
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Custom Text'));
      expect(textWidget.style?.color, Colors.green);
    });

    testWidgets('null onPressed disables button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MainButton(
              text: 'Null OnPressed',
              onPressed: null,
            ),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(
        find.descendant(
          of: find.byType(MainButton),
          matching: find.byType(InkWell),
        ),
      );

      expect(inkWell.onTap, isNull);
    });
  });
}
