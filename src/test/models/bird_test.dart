
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bird_app/models/bird.dart';

void main() {
	group('Bird Model Tests', () {
		group('Serialization Tests', () {
			test('Bird fromJson should return a valid Bird object', () {
				final json = {
					'id': '1',
					'name': 'Sparrow',
					'description': 'A small, brown and white bird.'
				};

				final bird = Bird.fromJson(json);

				expect(bird.id, '1');
				expect(bird.name, 'Sparrow');
				expect(bird.description, 'A small, brown and white bird.');
			});

			test('Bird toJson should return a valid JSON map', () {
				final bird = Bird(
					id: '1',
					name: 'Sparrow',
					description: 'A small, brown and white bird.',
				);

				final json = bird.toJson();

				expect(json['id'], '1');
				expect(json['name'], 'Sparrow');
				expect(json['description'], 'A small, brown and white bird.');
			});
		});

		group('Equality Tests', () {
			test('Birds with same properties should be equal', () {
				final bird1 = Bird(
					id: '1',
					name: 'Sparrow',
					description: 'A small, brown and white bird.',
				);

				final bird2 = Bird(
					id: '1',
					name: 'Sparrow',
					description: 'A small, brown and white bird.',
				);

				expect(bird1, bird2);
			});

			test('Birds with different properties should not be equal', () {
				final bird1 = Bird(
					id: '1',
					name: 'Sparrow',
					description: 'A small, brown and white bird.',
				);

				final bird2 = Bird(
					id: '2',
					name: 'Robin',
					description: 'A small, red-breasted bird.',
				);

				expect(bird1, isNot(bird2));
			});
		});
	});
}
