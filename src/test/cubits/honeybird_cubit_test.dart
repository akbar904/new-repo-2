
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/cubits/honeybird_cubit.dart';
import 'package:my_app/cubits/honeybird_state.dart';

// Mocking repository that HoneybirdCubit depends on
class MockHoneybirdRepository extends Mock implements HoneybirdRepository {}

void main() {
	group('HoneybirdCubit', () {
		late HoneybirdCubit honeybirdCubit;
		late MockHoneybirdRepository mockHoneybirdRepository;

		setUp(() {
			mockHoneybirdRepository = MockHoneybirdRepository();
			honeybirdCubit = HoneybirdCubit(mockHoneybirdRepository);
		});

		tearDown(() {
			honeybirdCubit.close();
		});

		test('initial state is HoneybirdInitial', () {
			expect(honeybirdCubit.state, HoneybirdInitial());
		});

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdLoaded] when fetchHoneybirds succeeds',
			build: () {
				when(() => mockHoneybirdRepository.getHoneybirds()).thenAnswer(
					(_) async => [
						Honeybird(id: '1', name: 'Honeybird 1', description: 'Description 1'),
						Honeybird(id: '2', name: 'Honeybird 2', description: 'Description 2'),
					],
				);
				return honeybirdCubit;
			},
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
			build: () {
				when(() => mockHoneybirdRepository.getHoneybirds()).thenThrow(Exception('Failed to fetch honeybirds'));
				return honeybirdCubit;
			},
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdError('Failed to fetch honeybirds'),
			],
		);
	});
}
