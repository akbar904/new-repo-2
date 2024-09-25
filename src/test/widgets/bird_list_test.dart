
import 'package:flutter_test/flutter_test.dart';
import 'package:bird_app/widgets/bird_list.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

// Using a mock BirdCard for widget testing
class MockBirdCard extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return const Text('Mock Bird Card');
	}
}

void main() {
	group('BirdList Widget Tests', () {
		testWidgets('should display a list of BirdCards', (WidgetTester tester) async {
			// Arrange
			final birds = [
				MockBirdCard(),
				MockBirdCard(),
				MockBirdCard(),
			];

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BirdList(
							birds: birds,
						),
					),
				),
			);

			// Assert
			expect(find.text('Mock Bird Card'), findsNWidgets(3));
		});

		testWidgets('should display empty state when no birds are provided', (WidgetTester tester) async {
			// Arrange
			final birds = <Widget>[];

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BirdList(
							birds: birds,
						),
					),
				),
			);

			// Assert
			expect(find.text('No birds available'), findsOneWidget);
		});
	});
}
