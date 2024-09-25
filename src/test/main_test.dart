
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bird_app/main.dart';
import 'package:bird_app/cubits/bird_cubit.dart';
import 'package:bird_app/cubits/bird_state.dart';

class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}

void main() {
	group('Main App', () {
		testWidgets('App shows HomeScreen with initial Cubit state', (WidgetTester tester) async {
			// Arrange
			final birdCubit = MockBirdCubit();
			when(() => birdCubit.state).thenReturn(BirdInitial());

			// Act
			await tester.pumpWidget(
				BlocProvider<BirdCubit>.value(
					value: birdCubit,
					child: MyApp(),
				),
			);

			// Assert
			expect(find.text('Birds'), findsOneWidget);
		});
	});

	group('BirdCubit', () {
		blocTest<BirdCubit, BirdState>(
			'Initial state is BirdInitial',
			build: () => BirdCubit(),
			verify: (cubit) => expect(cubit.state, BirdInitial()),
		);

		blocTest<BirdCubit, BirdState>(
			'Emits [BirdLoading, BirdLoaded] when fetchBirds is called',
			build: () => BirdCubit(),
			act: (cubit) => cubit.fetchBirds(),
			expect: () => [BirdLoading(), isA<BirdLoaded>()],
		);
	});
}
