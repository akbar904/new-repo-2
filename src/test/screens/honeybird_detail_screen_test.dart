
import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird_app/screens/honeybird_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

// Mock dependencies if any (example)
class MockHoneybird extends Mock implements Honeybird {}

void main() {
	group('HoneybirdDetailScreen Widget Tests', () {
		testWidgets('displays Honeybird name', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(
				id: '1',
				name: 'Golden Honeybird',
				description: 'A rare species of honeybird.'
			);
			await tester.pumpWidget(
				MaterialApp(
					home: HoneybirdDetailScreen(honeybird: honeybird),
				),
			);

			// Act & Assert
			expect(find.text('Golden Honeybird'), findsOneWidget);
		});

		testWidgets('displays Honeybird description', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(
				id: '1',
				name: 'Golden Honeybird',
				description: 'A rare species of honeybird.'
			);
			await tester.pumpWidget(
				MaterialApp(
					home: HoneybirdDetailScreen(honeybird: honeybird),
				),
			);

			// Act & Assert
			expect(find.text('A rare species of honeybird.'), findsOneWidget);
		});
	});
}
