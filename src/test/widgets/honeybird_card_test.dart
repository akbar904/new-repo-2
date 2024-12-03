
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:com.example.honeybird_app/widgets/honeybird_card.dart';
import 'package:com.example.honeybird_app/models/honeybird.dart';

class MockHoneybird extends Mock implements Honeybird {}

void main() {
	group('HoneybirdCard Widget Tests', () {
		late Honeybird mockHoneybird;

		setUp(() {
			mockHoneybird = MockHoneybird();
			when(() => mockHoneybird.id).thenReturn('1');
			when(() => mockHoneybird.name).thenReturn('Honeybird 1');
			when(() => mockHoneybird.description).thenReturn('Description of Honeybird 1');
		});

		testWidgets('displays the name of the honeybird', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: mockHoneybird),
					),
				),
			);

			expect(find.text('Honeybird 1'), findsOneWidget);
		});

		testWidgets('displays the description of the honeybird', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdCard(honeybird: mockHoneybird),
					),
				),
			);

			expect(find.text('Description of Honeybird 1'), findsOneWidget);
		});
	});
}
