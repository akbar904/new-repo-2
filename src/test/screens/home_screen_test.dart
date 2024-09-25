
import 'package:flutter_test/flutter_test.dart';
import 'package:bird_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}

void main() {
	group('HomeScreen', () {
		late MockBirdCubit birdCubit;

		setUp(() {
			birdCubit = MockBirdCubit();
		});

		testWidgets('should display loading indicator when state is BirdLoading', (WidgetTester tester) async {
			when(() => birdCubit.state).thenReturn(BirdLoading());

			await tester.pumpWidget(
				BlocProvider<BirdCubit>(
					create: (context) => birdCubit,
					child: const HomeScreen(),
				),
			);

			expect(find.byType(CircularProgressIndicator), findsOneWidget);
		});

		testWidgets('should display list of birds when state is BirdLoaded', (WidgetTester tester) async {
			final birds = [
				Bird(id: '1', name: 'Sparrow', description: 'Small bird'),
				Bird(id: '2', name: 'Eagle', description: 'Large bird')
			];
			when(() => birdCubit.state).thenReturn(BirdLoaded(birds));

			await tester.pumpWidget(
				BlocProvider<BirdCubit>(
					create: (context) => birdCubit,
					child: const HomeScreen(),
				),
			);

			expect(find.text('Sparrow'), findsOneWidget);
			expect(find.text('Eagle'), findsOneWidget);
		});

		testWidgets('should display error message when state is BirdError', (WidgetTester tester) async {
			when(() => birdCubit.state).thenReturn(BirdError('Error loading birds'));

			await tester.pumpWidget(
				BlocProvider<BirdCubit>(
					create: (context) => birdCubit,
					child: const HomeScreen(),
				),
			);

			expect(find.text('Error loading birds'), findsOneWidget);
		});
	});
}
