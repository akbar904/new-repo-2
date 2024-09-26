
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:honeybird_app/widgets/honeybird_card.dart';
import 'package:honeybird_app/models/honeybird.dart';

class MockHoneybird extends Mock implements Honeybird {}

void main() {
	group('HoneybirdCard Widget Tests', () {
		testWidgets('should display honeybird name and description', (WidgetTester tester) async {
			// Arrange
			final honeybird = Honeybird(id: '1', name: 'Honeybird A', description: 'A beautiful honeybird');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Assert
			expect(find.text('Honeybird A'), findsOneWidget);
			expect(find.text('A beautiful honeybird'), findsOneWidget);
		});

		testWidgets('should display a card widget', (WidgetTester tester) async {
			// Arrange
			final honeybird = Honeybird(id: '1', name: 'Honeybird B', description: 'A colorful honeybird');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Assert
			expect(find.byType(Card), findsOneWidget);
		});

		testWidgets('should display an image of the honeybird', (WidgetTester tester) async {
			// Arrange
			final honeybird = Honeybird(id: '1', name: 'Honeybird C', description: 'A rare honeybird');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Assert
			expect(find.byType(Image), findsOneWidget);
		});
	});
}
