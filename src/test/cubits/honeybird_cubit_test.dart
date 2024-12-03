
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/cubits/honeybird_cubit.dart';

class MockHoneybirdRepository extends Mock implements HoneybirdRepository {}

void main() {
	group('HoneybirdCubit', () {
		late MockHoneybirdRepository mockHoneybirdRepository;
		late HoneybirdCubit honeybirdCubit;

		setUp(() {
			mockHoneybirdRepository = MockHoneybirdRepository();
			honeybirdCubit = HoneybirdCubit(mockHoneybirdRepository);
		});

		tearDown(() {
			honeybirdCubit.close();
		});

		test('initial state is HoneybirdInitial', () {
			expect(honeybirdCubit.state, equals(HoneybirdInitial()));
		});

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdLoaded] when fetchHoneybirds is successful',
			build: () {
				when(() => mockHoneybirdRepository.getHoneybirds())
					.thenAnswer((_) async => <Honeybird>[]);
				return honeybirdCubit;
			},
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdLoaded(honeybirds: <Honeybird>[]),
			],
		);

		blocTest<HoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdError] when fetchHoneybirds fails',
			build: () {
				when(() => mockHoneybirdRepository.getHoneybirds())
					.thenThrow(Exception('Failed to fetch honeybirds'));
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
