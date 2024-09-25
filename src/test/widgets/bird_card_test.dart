
import 'package:flutter_test/flutter_test.dart';
import 'package:bird_app/widgets/bird_card.dart';

void main() {
	group('BirdCard Widget Tests', () {
		testWidgets('should display bird name', (WidgetTester tester) async {
			// Arrange
			final bird = Bird(id: '1', name: 'Sparrow', description: 'A small bird');

			// Act
			await tester.pumpWidget(BirdCard(bird: bird));

			// Assert
			expect(find.text('Sparrow'), findsOneWidget);
		});

		testWidgets('should display bird description', (WidgetTester tester) async {
			// Arrange
			final bird = Bird(id: '1', name: 'Sparrow', description: 'A small bird');

			// Act
			await tester.pumpWidget(BirdCard(bird: bird));

			// Assert
			expect(find.text('A small bird'), findsOneWidget);
		});
	});
}
