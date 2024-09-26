
import 'package:flutter_test/flutter_test.dart';
import 'package:equatable/equatable.dart';
import 'package:honeybird_app/models/honeybird.dart';

void main() {
	group('Honeybird Model', () {
		test('should create a Honeybird instance', () {
			final honeybird = Honeybird('1', 'Honeybird One', 'Description of Honeybird One');
			expect(honeybird, isA<Honeybird>());
			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird One');
			expect(honeybird.description, 'Description of Honeybird One');
		});

		test('should be equatable', () {
			final honeybird1 = Honeybird('1', 'Honeybird One', 'Description of Honeybird One');
			final honeybird2 = Honeybird('1', 'Honeybird One', 'Description of Honeybird One');
			final honeybird3 = Honeybird('2', 'Honeybird Two', 'Description of Honeybird Two');

			expect(honeybird1, honeybird2);
			expect(honeybird1, isNot(honeybird3));
		});

		test('should serialize to JSON', () {
			final honeybird = Honeybird('1', 'Honeybird One', 'Description of Honeybird One');
			final json = honeybird.toJson();
			expect(json, {
				'id': '1',
				'name': 'Honeybird One',
				'description': 'Description of Honeybird One',
			});
		});

		test('should deserialize from JSON', () {
			final json = {
				'id': '1',
				'name': 'Honeybird One',
				'description': 'Description of Honeybird One',
			};
			final honeybird = Honeybird.fromJson(json);
			expect(honeybird.id, '1');
			expect(honeybird.name, 'Honeybird One');
			expect(honeybird.description, 'Description of Honeybird One');
		});

		test('props should contain all properties', () {
			final honeybird = Honeybird('1', 'Honeybird One', 'Description of Honeybird One');
			expect(honeybird.props, ['1', 'Honeybird One', 'Description of Honeybird One']);
		});
	});
}
