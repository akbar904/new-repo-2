
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:your_project_name/cubits/honeybird_state.dart';

class MockHoneybirdState extends Mock implements HoneybirdState {}

void main() {
	group('HoneybirdState', () {
		test('supports value comparisons', () {
			expect(HoneybirdState(), HoneybirdState());
		});

		group('HoneybirdInitial', () {
			test('supports value comparisons', () {
				expect(HoneybirdInitial(), HoneybirdInitial());
			});
		});

		group('HoneybirdLoading', () {
			test('supports value comparisons', () {
				expect(HoneybirdLoading(), HoneybirdLoading());
			});
		});

		group('HoneybirdLoaded', () {
			final honeybirds = [
				Honeybird(id: '1', name: 'Honeybird One', description: 'Description One'),
				Honeybird(id: '2', name: 'Honeybird Two', description: 'Description Two'),
			];

			test('supports value comparisons', () {
				expect(HoneybirdLoaded(honeybirds), HoneybirdLoaded(honeybirds));
			});

			test('props returns correct values', () {
				expect(HoneybirdLoaded(honeybirds).props, [honeybirds]);
			});
		});

		group('HoneybirdError', () {
			const errorMessage = 'An error occurred';

			test('supports value comparisons', () {
				expect(HoneybirdError(errorMessage), HoneybirdError(errorMessage));
			});

			test('props returns correct values', () {
				expect(HoneybirdError(errorMessage).props, [errorMessage]);
			});
		});
	});
}
