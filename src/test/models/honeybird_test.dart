
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('Honeybird Model Tests', () {
		test('Honeybird constructor should create a valid instance', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird A', description: 'Description A');
			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird A');
			expect(honeybird.description, 'Description A');
		});

		test('Honeybird fromJson should create a valid instance from JSON', () {
			final json = {'id': '1', 'name': 'Honeybird A', 'description': 'Description A'};
			final honeybird = Honeybird.fromJson(json);
			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird A');
			expect(honeybird.description, 'Description A');
		});

		test('Honeybird toJson should return a valid JSON map', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird A', description: 'Description A');
			final json = honeybird.toJson();
			expect(json, {'id': '1', 'name': 'Honeybird A', 'description': 'Description A'});
		});

		test('Honeybird props should return a list of properties', () {
			final honeybird = Honeybird(id: '1', name: 'Honeybird A', description: 'Description A');
			expect(honeybird.props, ['1', 'Honeybird A', 'Description A']);
		});
	});
}
