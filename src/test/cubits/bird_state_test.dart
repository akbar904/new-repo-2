
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bird_app/cubits/bird_state.dart';

class MockBirdCubit extends MockCubit<BirdState> implements BirdCubit {}

void main() {
	group('BirdState Cubit Tests', () {
		late MockBirdCubit birdCubit;

		setUp(() {
			birdCubit = MockBirdCubit();
		});

		blocTest<MockBirdCubit, BirdState>(
			'emits BirdLoading when fetching birds starts',
			build: () => birdCubit,
			act: (cubit) => cubit.fetchBirds(),
			expect: () => [BirdLoading()],
		);

		blocTest<MockBirdCubit, BirdState>(
			'emits BirdLoaded when birds are fetched successfully',
			build: () => birdCubit,
			act: (cubit) {
				when(() => cubit.fetchBirds()).thenAnswer((_) async {
					cubit.emit(BirdLoaded(birds: []));
				});
				cubit.fetchBirds();
			},
			expect: () => [BirdLoaded(birds: [])],
		);

		blocTest<MockBirdCubit, BirdState>(
			'emits BirdError when there is an error fetching birds',
			build: () => birdCubit,
			act: (cubit) {
				when(() => cubit.fetchBirds()).thenThrow(Exception('Error'));
				cubit.fetchBirds();
			},
			expect: () => [BirdError('Error')],
		);
	});
}
