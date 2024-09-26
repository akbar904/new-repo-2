
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.honeybird_app/cubits/honeybird_state.dart';

class MockHoneybirdCubit extends MockCubit<HoneybirdState> implements HoneybirdCubit {}

void main() {
	group('HoneybirdState', () {
		test('supports value comparison', () {
			expect(HoneybirdLoading(), HoneybirdLoading());
			expect(HoneybirdLoaded([]), HoneybirdLoaded([]));
			expect(HoneybirdError('error'), HoneybirdError('error'));
		});
	});

	group('HoneybirdCubit', () {
		late MockHoneybirdCubit honeybirdCubit;

		setUp(() {
			honeybirdCubit = MockHoneybirdCubit();
		});

		blocTest<MockHoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdLoaded] when honeybirds are fetched successfully',
			build: () => honeybirdCubit,
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdLoaded([]),
			],
		);

		blocTest<MockHoneybirdCubit, HoneybirdState>(
			'emits [HoneybirdLoading, HoneybirdError] when honeybirds fetching fails',
			build: () => honeybirdCubit,
			act: (cubit) => cubit.fetchHoneybirds(),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdError('error'),
			],
		);
	});
}
