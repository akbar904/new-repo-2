
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bird_app/cubits/bird_cubit.dart';
import 'package:bird_app/cubits/bird_state.dart';

// Mock dependencies if any (e.g., repository)
class MockRepository extends Mock implements BirdRepository {}

void main() {
	group('BirdCubit', () {
		late BirdCubit birdCubit;
		late MockRepository mockRepository;

		setUp(() {
			mockRepository = MockRepository();
			birdCubit = BirdCubit(repository: mockRepository);
		});

		tearDown(() {
			birdCubit.close();
		});

		test('initial state is BirdInitial', () {
			expect(birdCubit.state, BirdInitial());
		});

		blocTest<BirdCubit, BirdState>(
			'emits [BirdLoading, BirdLoaded] when fetchBirds is successful',
			build: () {
				when(() => mockRepository.getBirds()).thenAnswer((_) async => [Bird(id: '1', name: 'Sparrow', description: 'A small bird')]);
				return birdCubit;
			},
			act: (cubit) => cubit.fetchBirds(),
			expect: () => [
				BirdLoading(),
				BirdLoaded(birds: [Bird(id: '1', name: 'Sparrow', description: 'A small bird')]),
			],
		);

		blocTest<BirdCubit, BirdState>(
			'emits [BirdLoading, BirdError] when fetchBirds fails',
			build: () {
				when(() => mockRepository.getBirds()).thenThrow(Exception('failed to fetch birds'));
				return birdCubit;
			},
			act: (cubit) => cubit.fetchBirds(),
			expect: () => [
				BirdLoading(),
				BirdError(error: 'Exception: failed to fetch birds'),
			],
		);
	});
}
