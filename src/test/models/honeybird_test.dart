
import 'package:flutter_test/flutter_test.dart';
import 'package:equatable/equatable.dart';
import 'package:mocktail/mocktail.dart';
import 'lib/models/honeybird.dart';

void main() {
	group('Honeybird Model', () {
		test('Constructor initializes correctly', () {
			final honeybird = Honeybird(id: '1', name: 'Golden Honeybird', description: 'A rare golden honeybird.');
			expect(honeybird.id, '1');
			expect(honeybird.name, 'Golden Honeybird');
			expect(honeybird.description, 'A rare golden honeybird.');
		});
		
		test('fromJson creates a valid instance', () {
			final json = {
				'id': '1',
				'name': 'Golden Honeybird',
				'description': 'A rare golden honeybird.'
			};
			final honeybird = Honeybird.fromJson(json);
			expect(honeybird.id, '1');
			expect(honeybird.name, 'Golden Honeybird');
			expect(honeybird.description, 'A rare golden honeybird.');
		});
		
		test('toJson returns a valid map', () {
			final honeybird = Honeybird(id: '1', name: 'Golden Honeybird', description: 'A rare golden honeybird.');
			final json = honeybird.toJson();
			expect(json, {
				'id': '1',
				'name': 'Golden Honeybird',
				'description': 'A rare golden honeybird.'
			});
		});
		
		test('props returns a list of properties', () {
			final honeybird = Honeybird(id: '1', name: 'Golden Honeybird', description: 'A rare golden honeybird.');
			expect(honeybird.props, ['1', 'Golden Honeybird', 'A rare golden honeybird.']);
		});
	});
}
