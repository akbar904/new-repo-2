
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:equatable/equatable.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('Honeybird Model Tests', () {
		test('Honeybird props should contain id, name, and description', () {
			final honeybird = Honeybird(id: '1', name: 'Common Honeybird', description: 'A common species of honeybird.');

			expect(honeybird.props, ['1', 'Common Honeybird', 'A common species of honeybird.']);
		});

		test('Honeybird fromJson should correctly parse JSON to Honeybird instance', () {
			final json = {
				'id': '1',
				'name': 'Common Honeybird',
				'description': 'A common species of honeybird.'
			};

			final honeybird = Honeybird.fromJson(json);

			expect(honeybird.id, '1');
			expect(honeybird.name, 'Common Honeybird');
			expect(honeybird.description, 'A common species of honeybird.');
		});

		test('Honeybird toJson should correctly convert Honeybird instance to JSON', () {
			final honeybird = Honeybird(id: '1', name: 'Common Honeybird', description: 'A common species of honeybird.');

			final json = honeybird.toJson();

			expect(json, {
				'id': '1',
				'name': 'Common Honeybird',
				'description': 'A common species of honeybird.'
			});
		});
	});
}
