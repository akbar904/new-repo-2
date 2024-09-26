
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/widgets/honeybird_list.dart';
import 'package:flutter/material.dart';

void main() {
	group('HoneybirdList Widget', () {
		testWidgets('displays a list of HoneybirdCard widgets', (WidgetTester tester) async {
			// Arrange
			final honeybirdList = HoneybirdList();

			// Act
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: honeybirdList)));

			// Assert
			expect(find.byType(HoneybirdCard), findsWidgets);
		});

		testWidgets('shows correct number of HoneybirdCard widgets', (WidgetTester tester) async {
			// Arrange
			final honeybirdList = HoneybirdList(honeybirds: [
				Honeybird(id: '1', name: 'Honeybird 1', description: 'Description 1'),
				Honeybird(id: '2', name: 'Honeybird 2', description: 'Description 2'),
			]);

			// Act
			await tester.pumpWidget(MaterialApp(home: Scaffold(body: honeybirdList)));

			// Assert
			expect(find.byType(HoneybirdCard), findsNWidgets(2));
		});
	});
}
