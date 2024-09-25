
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:bird_app/screens/bird_detail_screen.dart';

class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}

void main() {
	group('BirdDetailScreen Widget Tests', () {
		testWidgets('displays bird name and description', (WidgetTester tester) async {
			// Arrange
			final mockBird = Bird(id: '1', name: 'Sparrow', description: 'A small, agile bird.');
			await tester.pumpWidget(MaterialApp(home: BirdDetailScreen(bird: mockBird)));

			// Act & Assert
			expect(find.text('Sparrow'), findsOneWidget);
			expect(find.text('A small, agile bird.'), findsOneWidget);
		});
	});

	group('BirdDetailScreen Cubit Tests', () {
		late MockBirdCubit mockBirdCubit;

		setUp(() {
			mockBirdCubit = MockBirdCubit();
		});

		blocTest<MockBirdCubit, BirdState>(
			'emits [BirdLoading, BirdLoaded] when fetchBirds is called',
			build: () => mockBirdCubit,
			act: (cubit) => cubit.fetchBirds(),
			expect: () => [BirdLoading(), BirdLoaded(birds: [Bird(id: '1', name: 'Sparrow', description: 'A small, agile bird.')])],
		);
	});
}
