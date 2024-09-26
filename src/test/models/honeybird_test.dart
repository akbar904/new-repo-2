
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('Honeybird Model Tests', () {
		test('Constructor initializes correctly', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird Name', description: 'Description of the honeybird');

			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird Name');
			expect(honeybird.description, 'Description of the honeybird');
		});

		test('fromJson creates a Honeybird from JSON', () {
			final json = {
				'id': '1',
				'name': 'Honeybird Name',
				'description': 'Description of the honeybird'
			};

			final honeybird = Honeybird.fromJson(json);

			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird Name');
			expect(honeybird.description, 'Description of the honeybird');
		});

		test('toJson converts a Honeybird to JSON', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird Name', description: 'Description of the honeybird');

			final json = honeybird.toJson();

			expect(json, {
				'id': '1',
				'name': 'Honeybird Name',
				'description': 'Description of the honeybird'
			});
		});

		test('props returns the correct properties', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird Name', description: 'Description of the honeybird');

			expect(honeybird.props, ['1', 'Honeybird Name', 'Description of the honeybird']);
		});
	});
}
