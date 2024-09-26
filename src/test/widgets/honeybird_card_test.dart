
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:your_package/widgets/honeybird_card.dart';
import 'package:your_package/models/honeybird.dart';

class MockHoneybird extends Mock implements Honeybird {}

void main() {
	group('HoneybirdCard Widget Tests', () {
		// Set up mock instance of Honeybird
		final mockHoneybird = MockHoneybird();

		setUp(() {
			when(() => mockHoneybird.id).thenReturn('1');
			when(() => mockHoneybird.name).thenReturn('Mock Honeybird');
			when(() => mockHoneybird.description).thenReturn('A mock description of a honeybird.');
		});

		testWidgets('HoneybirdCard displays the honeybird name', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: mockHoneybird),
					),
				),
			);

			// Verify if the name of the honeybird is displayed
			expect(find.text('Mock Honeybird'), findsOneWidget);
		});

		testWidgets('HoneybirdCard displays the honeybird description', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: mockHoneybird),
					),
				),
			);

			// Verify if the description of the honeybird is displayed
			expect(find.text('A mock description of a honeybird.'), findsOneWidget);
		});

		testWidgets('HoneybirdCard displays an icon', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: mockHoneybird),
					),
				),
			);

			// Verify if an icon is displayed
			expect(find.byIcon(Icons.bird), findsOneWidget);
		});
	});
}
