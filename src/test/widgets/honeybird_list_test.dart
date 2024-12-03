
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.honeybird_app/widgets/honeybird_list.dart';

void main() {
	group('HoneybirdList Widget Tests', () {
		testWidgets('displays a list of HoneybirdCard widgets', (WidgetTester tester) async {
			// Arrange
			const List<Widget> honeybirdCards = [
				Text('Honeybird 1'),
				Text('Honeybird 2'),
				Text('Honeybird 3'),
			];

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(
							honeybirdCards: honeybirdCards,
						),
					),
				),
			);

			// Assert
			expect(find.text('Honeybird 1'), findsOneWidget);
			expect(find.text('Honeybird 2'), findsOneWidget);
			expect(find.text('Honeybird 3'), findsOneWidget);
		});

		testWidgets('displays empty list message when no HoneybirdCard widgets are provided', (WidgetTester tester) async {
			// Arrange
			const List<Widget> honeybirdCards = [];

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: HoneybirdList(
							honeybirdCards: honeybirdCards,
						),
					),
				),
			);

			// Assert
			expect(find.text('No honeybirds available'), findsOneWidget);
		});
	});
}
