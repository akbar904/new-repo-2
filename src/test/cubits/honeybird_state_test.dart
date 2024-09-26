
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:your_package_name/cubits/honeybird_state.dart';

class MockHoneybirdState extends Mock implements HoneybirdState {}

void main() {
	group('HoneybirdState', () {
		test('supports value comparisons', () {
			expect(HoneybirdInitial(), HoneybirdInitial());
			expect(HoneybirdLoading(), HoneybirdLoading());
			expect(HoneybirdLoaded([]), HoneybirdLoaded([]));
			expect(HoneybirdError('error'), HoneybirdError('error'));
		});
		
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
			final errorMessage = 'error';
			final state = HoneybirdError(errorMessage);
			expect(state.props, [errorMessage]);
		});
	});
}
