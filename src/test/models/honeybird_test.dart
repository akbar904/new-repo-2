
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('Honeybird Model Tests', () {
		test('Honeybird constructor creates a valid instance', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird One', description: 'A beautiful honeybird.');

			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird One');
			expect(honeybird.description, 'A beautiful honeybird.');
		});

		test('Honeybird fromJson creates a valid instance from JSON', () {
			final json = {'id': '1', 'name': 'Honeybird One', 'description': 'A beautiful honeybird.'};
			final honeybird = Honeybird.fromJson(json);

			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird One');
			expect(honeybird.description, 'A beautiful honeybird.');
		});

		test('Honeybird toJson converts an instance to JSON', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird One', description: 'A beautiful honeybird.');
			final json = honeybird.toJson();

			expect(json['id'], '1');
			expect(json['name'], 'Honeybird One');
			expect(json['description'], 'A beautiful honeybird.');
		});

		test('Honeybird props return correct list of properties', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird One', description: 'A beautiful honeybird.');

			expect(honeybird.props, ['1', 'Honeybird One', 'A beautiful honeybird.']);
		});
	});
}
