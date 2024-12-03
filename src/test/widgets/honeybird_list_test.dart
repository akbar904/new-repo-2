
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:honeybird_app/widgets/honeybird_list.dart';

void main() {
	group('HoneybirdList Widget Tests', () {
		testWidgets('HoneybirdList displays a list of HoneybirdCard widgets', (WidgetTester tester) async {
			// Arrange: Create a list of widgets (assuming HoneybirdCard is a simple widget with a key)
			final List<Widget> honeybirdCards = [
				KeyedSubtree(key: Key('honeybird_card_1'), child: Container()),
				KeyedSubtree(key: Key('honeybird_card_2'), child: Container()),
				KeyedSubtree(key: Key('honeybird_card_3'), child: Container())
			];

			// Act: Build the HoneybirdList widget
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(children: honeybirdCards),
					),
				),
			);

			// Assert: Verify that the HoneybirdList displays the correct number of HoneybirdCard widgets
			expect(find.byKey(Key('honeybird_card_1')), findsOneWidget);
			expect(find.byKey(Key('honeybird_card_2')), findsOneWidget);
			expect(find.byKey(Key('honeybird_card_3')), findsOneWidget);
		});

		testWidgets('HoneybirdList displays empty state when no children provided', (WidgetTester tester) async {
			// Act: Build the HoneybirdList widget with an empty list
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(children: []),
					),
				),
			);

			// Assert: Verify that there are no children in the HoneybirdList
			expect(find.byType(KeyedSubtree), findsNothing);
		});
	});
}
