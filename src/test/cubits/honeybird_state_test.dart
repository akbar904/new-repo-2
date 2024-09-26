
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:com.example.honeybird_app/cubits/honeybird_state.dart';

class MockHoneybirdState extends Mock implements HoneybirdState {}

void main() {
	group('HoneybirdState', () {
		test('HoneybirdState initial state', () {
			final state = HoneybirdInitial();
			expect(state, isA<HoneybirdInitial>());
		});

		test('HoneybirdState loading state', () {
			final state = HoneybirdLoading();
			expect(state, isA<HoneybirdLoading>());
		});

		test('HoneybirdState loaded state with honeybirds', () {
			final honeybirds = [];
			final state = HoneybirdLoaded(honeybirds);
			expect(state, isA<HoneybirdLoaded>());
			expect(state.honeybirds, honeybirds);
		});

		test('HoneybirdState error state', () {
			final errorMessage = 'An error occurred';
			final state = HoneybirdError(errorMessage);
			expect(state, isA<HoneybirdError>());
			expect(state.message, errorMessage);
		});
	});

	group('Equatable properties', () {
		test('HoneybirdInitial props', () {
			final state = HoneybirdInitial();
			expect(state.props, []);
		});

		test('HoneybirdLoading props', () {
			final state = HoneybirdLoading();
			expect(state.props, []);
		});

		test('HoneybirdLoaded props', () {
			final honeybirds = [];
			final state = HoneybirdLoaded(honeybirds);
			expect(state.props, [honeybirds]);
		});

		test('HoneybirdError props', () {
			final errorMessage = 'An error occurred';
			final state = HoneybirdError(errorMessage);
			expect(state.props, [errorMessage]);
		});
	});
}
