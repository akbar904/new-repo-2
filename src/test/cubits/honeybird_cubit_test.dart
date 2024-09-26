
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.honeybird_app/cubits/honeybird_cubit.dart'; // Importing only the file to be tested
import 'package:com.example.honeybird_app/cubits/honeybird_state.dart'; // Importing only the file to be tested
import 'package:com.example.honeybird_app/models/honeybird.dart'; // Importing only the file to be tested

class MockHoneybirdRepository extends Mock implements HoneybirdRepository {}

void main() {
	group('HoneybirdCubit', () {
		late HoneybirdRepository honeybirdRepository;
		late HoneybirdCubit honeybirdCubit;

		setUp(() {
			honeybirdRepository = MockHoneybirdRepository();
			honeybirdCubit = HoneybirdCubit(honeybirdRepository);
		});

		test('initial state is HoneybirdInitial', () {
			expect(honeybirdCubit.state, HoneybirdInitial());
		});

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdLoaded] when fetchHoneybirds is successful',
			setUp: () {
				when(() => honeybirdRepository.getHoneybirds()).thenAnswer((_) async => [
					Honeybird(id: '1', name: 'Honeybird 1', description: 'Description 1'),
					Honeybird(id: '2', name: 'Honeybird 2', description: 'Description 2'),
				]);
			},
			build: () => honeybirdCubit,
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdLoaded([
					Honeybird(id: '1', name: 'Honeybird 1', description: 'Description 1'),
					Honeybird(id: '2', name: 'Honeybird 2', description: 'Description 2'),
				]),
			],
		);

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdError] when fetchHoneybirds fails',
			setUp: () {
				when(() => honeybirdRepository.getHoneybirds()).thenThrow(Exception('Failed to fetch honeybirds'));
			},
			build: () => honeybirdCubit,
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdError('Failed to fetch honeybirds'),
			],
		);
	});
}
