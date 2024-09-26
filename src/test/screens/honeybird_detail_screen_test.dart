
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:your_package_name/screens/honeybird_detail_screen.dart';
import 'package:your_package_name/models/honeybird.dart';

class MockHoneybird extends Mock implements Honeybird {}

void main() {
	group('HoneybirdDetailScreen', () {
		// Define a sample Honeybird instance for testing
		final sampleHoneybird = Honeybird(id: '1', name: 'Test Honeybird', description: 'A test description');

		testWidgets('displays the correct honeybird details', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(
				home: HoneybirdDetailScreen(honeybird: sampleHoneybird),
			));

			expect(find.text('Test Honeybird'), findsOneWidget);
			expect(find.text('A test description'), findsOneWidget);
		});

		testWidgets('contains a back button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(
				home: HoneybirdDetailScreen(honeybird: sampleHoneybird),
			));

			expect(find.byType(BackButton), findsOneWidget);
		});
	});
}
