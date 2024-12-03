
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.honeybird_app/screens/honeybird_detail_screen.dart';
import 'package:com.example.honeybird_app/models/honeybird.dart';

class MockHoneybird extends Mock implements Honeybird {}

void main() {
	group('HoneybirdDetailScreen', () {
		testWidgets('renders HoneybirdDetailScreen with honeybird details', (WidgetTester tester) async {
			final honeybird = Honeybird(id: '1', name: 'Test Honeybird', description: 'This is a test honeybird.');

			await tester.pumpWidget(
				MaterialApp(
					home: HoneybirdDetailScreen(honeybird: honeybird),
				),
			);

			expect(find.text('Test Honeybird'), findsOneWidget);
			expect(find.text('This is a test honeybird.'), findsOneWidget);
		});
	});
}
