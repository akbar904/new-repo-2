
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:honeybird_app/widgets/honeybird_card.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('HoneybirdCard Widget Tests', () {
		testWidgets('displays honeybird name and description', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(id: '1', name: 'Honeybird', description: 'A beautiful honeybird');
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Act & Assert
			expect(find.text('Honeybird'), findsOneWidget);
			expect(find.text('A beautiful honeybird'), findsOneWidget);
		});

		testWidgets('displays no image if honeybird image url is null', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(id: '1', name: 'Honeybird', description: 'A beautiful honeybird');
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Act & Assert
			expect(find.byType(Image), findsNothing);
		});

		testWidgets('displays image if honeybird image url is provided', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(id: '1', name: 'Honeybird', description: 'A beautiful honeybird', imageUrl: 'https://example.com/image.png');
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Act & Assert
			expect(find.byType(Image), findsOneWidget);
		});
	});
}
