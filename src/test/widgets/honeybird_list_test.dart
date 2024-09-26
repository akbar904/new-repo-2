
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honeybird_app/widgets/honeybird_list.dart';

void main() {
	group('HoneybirdList Widget', () {
		testWidgets('displays a list of HoneybirdCard widgets', (WidgetTester tester) async {
			// Mock data for HoneybirdCard
			final List<Widget> mockHoneybirdCards = List.generate(5, (index) => Text('Honeybird $index'));

			// Build HoneybirdList widget
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(honeybirdCards: mockHoneybirdCards),
					),
				),
			);

			// Verify the number of HoneybirdCard widgets displayed
			for (int i = 0; i < mockHoneybirdCards.length; i++) {
				expect(find.text('Honeybird $i'), findsOneWidget);
			}
		});
	});
}
