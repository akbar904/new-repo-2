
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:honeybird_app/cubits/honeybird_cubit.dart';
import 'package:honeybird_app/cubits/honeybird_state.dart';
import 'package:honeybird_app/models/honeybird.dart';

class MockHoneybirdRepository extends Mock implements HoneybirdRepository {}

void main() {
	group('HoneybirdCubit', () {
		late HoneybirdRepository honeybirdRepository;
		late HoneybirdCubit honeybirdCubit;

		setUp(() {
			honeybirdRepository = MockHoneybirdRepository();
			honeybirdCubit = HoneybirdCubit(honeybirdRepository);
		});

		tearDown(() {
			honeybirdCubit.close();
		});

		test('initial state is HoneybirdInitial', () {
			expect(honeybirdCubit.state, HoneybirdInitial());
		});

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdLoaded] when fetchHoneybirds is successful',
			build: () {
				when(() => honeybirdRepository.getHoneybirds()).thenAnswer(
					(_) async => [Honeybird(id: '1', name: 'Test Bird', description: 'Test Description')],
				);
				return honeybirdCubit;
			},
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdLoaded(honeybirds: [Honeybird(id: '1', name: 'Test Bird', description: 'Test Description')]),
			],
		);

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdError] when fetchHoneybirds fails',
			build: () {
				when(() => honeybirdRepository.getHoneybirds()).thenThrow(Exception('Failed to load'));
				return honeybirdCubit;
			},
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdError('Exception: Failed to load'),
			],
		);
	});
}
