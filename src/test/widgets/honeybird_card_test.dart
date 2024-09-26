
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:honeybird_app/widgets/honeybird_card.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('HoneybirdCard Widget Tests', () {
		testWidgets('displays honeybird name and description', (WidgetTester tester) async {
			// Arrange
			final honeybird = Honeybird(id: '1', name: 'Honeybird Name', description: 'Honeybird Description');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: honeybird),
					),
				),
			);

			// Assert
			expect(find.text('Honeybird Name'), findsOneWidget);
			expect(find.text('Honeybird Description'), findsOneWidget);
		});
	});
}
