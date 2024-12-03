
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:your_project/cubits/honeybird_state.dart'; // Adjust the import to match your actual project structure

class MockHoneybirdState extends Mock implements HoneybirdState {}

void main() {
	group('HoneybirdState', () {
		test('supports value comparison', () {
			expect(HoneybirdState(), equals(HoneybirdState()));
		});

		group('HoneybirdInitial', () {
			test('supports value comparison', () {
				expect(HoneybirdInitial(), equals(HoneybirdInitial()));
			});
		});

		group('HoneybirdLoading', () {
			test('supports value comparison', () {
				expect(HoneybirdLoading(), equals(HoneybirdLoading()));
			});
		});

		group('HoneybirdLoaded', () {
			final honeybirds = [Honeybird(id: '1', name: 'Honeybird 1', description: 'Description 1')];
			test('supports value comparison', () {
				expect(HoneybirdLoaded(honeybirds: honeybirds), equals(HoneybirdLoaded(honeybirds: honeybirds)));
			});
		});

		group('HoneybirdError', () {
			final errorMessage = 'Error message';
			test('supports value comparison', () {
				expect(HoneybirdError(errorMessage: errorMessage), equals(HoneybirdError(errorMessage: errorMessage)));
			});
		});
	});
}
