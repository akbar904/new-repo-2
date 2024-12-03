
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:your_package_name/widgets/honeybird_card.dart';
import 'package:your_package_name/models/honeybird.dart';

void main() {
	group('HoneybirdCard Widget Tests', () {
		testWidgets('Displays honeybird name and description', (WidgetTester tester) async {
			// Arrange
			final honeybird = Honeybird(id: '1', name: 'Honeybird A', description: 'Description A');

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
			expect(find.text('Description A'), findsOneWidget);
		});
	});
}
