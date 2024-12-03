
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/widgets/honeybird_list.dart';

void main() {
	group('HoneybirdList Widget Tests', () {
		testWidgets('displays a list of HoneybirdCard widgets', (WidgetTester tester) async {
			// Define a list of mock honeybirds
			final honeybirds = [
				Honeybird(id: '1', name: 'Honeybird One', description: 'Description One'),
				Honeybird(id: '2', name: 'Honeybird Two', description: 'Description Two'),
			];

			// Build our widget and trigger a frame.
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(honeybirds: honeybirds),
					),
				),
			);

			// Verify that a HoneybirdCard is displayed for each honeybird.
			expect(find.text('Honeybird One'), findsOneWidget);
			expect(find.text('Honeybird Two'), findsOneWidget);
		});

		testWidgets('displays "No Honeybirds Available" when list is empty', (WidgetTester tester) async {
			// Empty list of honeybirds
			final honeybirds = <Honeybird>[];

			// Build our widget and trigger a frame.
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(honeybirds: honeybirds),
					),
				),
			);

			// Verify that the "No Honeybirds Available" text is displayed.
			expect(find.text('No Honeybirds Available'), findsOneWidget);
		});
	});
}
