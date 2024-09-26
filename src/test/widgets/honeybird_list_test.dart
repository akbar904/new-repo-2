
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/widgets/honeybird_list.dart';

void main() {
	group('HoneybirdList', () {
		testWidgets('displays a list of honeybird cards', (WidgetTester tester) async {
			// Define a list of honeybirds to be used in the test
			final honeybirds = [
				Honeybird(id: '1', name: 'Honeybird One', description: 'Description One'),
				Honeybird(id: '2', name: 'Honeybird Two', description: 'Description Two'),
			];

			// Build the HoneybirdList widget with the list of honeybirds
			await tester.pumpWidget(MaterialApp(
				home: HoneybirdList(honeybirds: honeybirds),
			));

			// Verify that HoneybirdCard widgets are displayed
			expect(find.text('Honeybird One'), findsOneWidget);
			expect(find.text('Honeybird Two'), findsOneWidget);
		});

		testWidgets('displays a message when the list is empty', (WidgetTester tester) async {
			// Build the HoneybirdList widget with an empty list
			await tester.pumpWidget(MaterialApp(
				home: HoneybirdList(honeybirds: []),
			));

			// Verify that the empty message is displayed
			expect(find.text('No honeybirds available'), findsOneWidget);
		});
	});
}
