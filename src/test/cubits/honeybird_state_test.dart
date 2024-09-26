
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.honeybird_app/cubits/honeybird_state.dart';

class MockHoneybirdCubit extends MockCubit<HoneybirdState> implements HoneybirdCubit {}

void main() {
	group('HoneybirdState Tests', () {
		test('HoneybirdState should extend Equatable', () {
			expect(HoneybirdState(), isA<Equatable>());
		});
		
		group('HoneybirdInitial', () {
			test('supports value comparison', () {
				expect(HoneybirdInitial(), HoneybirdInitial());
			});
		});

		group('HoneybirdLoading', () {
			test('supports value comparison', () {
				expect(HoneybirdLoading(), HoneybirdLoading());
			});
		});

		group('HoneybirdLoaded', () {
			final honeybirds = [Honeybird(id: '1', name: 'Honeybird 1', description: 'Description 1')];

			test('supports value comparison', () {
				expect(HoneybirdLoaded(honeybirds), HoneybirdLoaded(honeybirds));
			});

			test('props are correct', () {
				expect(HoneybirdLoaded(honeybirds).props, [honeybirds]);
			});
		});

		group('HoneybirdError', () {
			final errorMessage = 'An error occurred';

			test('supports value comparison', () {
				expect(HoneybirdError(errorMessage), HoneybirdError(errorMessage));
			});

			test('props are correct', () {
				expect(HoneybirdError(errorMessage).props, [errorMessage]);
			});
		});
	});
}
