
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/screens/honeybird_detail_screen.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('HoneybirdDetailScreen', () {
		testWidgets('should display honeybird name and description', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(
				id: '1',
				name: 'Sample Bird',
				description: 'This is a sample bird description.',
			);

			await tester.pumpWidget(
				MaterialApp(
					home: HoneybirdDetailScreen(honeybird: honeybird),
				),
			);

			// Act & Assert
			expect(find.text('Sample Bird'), findsOneWidget);
			expect(find.text('This is a sample bird description.'), findsOneWidget);
		});

		testWidgets('should have a back button', (WidgetTester tester) async {
			// Arrange
			const honeybird = Honeybird(
				id: '1',
				name: 'Sample Bird',
				description: 'This is a sample bird description.',
			);

			await tester.pumpWidget(
				MaterialApp(
					home: HoneybirdDetailScreen(honeybird: honeybird),
				),
			);

			// Act & Assert
			expect(find.byType(BackButton), findsOneWidget);
		});
	});
}
