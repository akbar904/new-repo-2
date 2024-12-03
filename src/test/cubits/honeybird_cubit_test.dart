
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/cubits/honeybird_cubit.dart';
import 'package:honeybird_app/cubits/honeybird_state.dart';
import 'package:honeybird_app/models/honeybird.dart';

// Mock class for the repository
class MockHoneybirdRepository extends Mock implements HoneybirdRepository {}

void main() {
  group('HoneybirdCubit', () {
    late MockHoneybirdRepository honeybirdRepository;

    setUp(() {
      honeybirdRepository = MockHoneybirdRepository();
    });

    blocTest<HoneybirdCubit, HoneybirdState>(
      'emits [HoneybirdLoading, HoneybirdLoaded] when fetchHoneybirds is successful',
      build: () {
        when(() => honeybirdRepository.getHoneybirds()).thenAnswer((_) async => [
          Honeybird(id: '1', name: 'Honeybird1', description: 'Description1'),
          Honeybird(id: '2', name: 'Honeybird2', description: 'Description2'),
        ]);
        return HoneybirdCubit(honeybirdRepository);
      },
      act: (cubit) => cubit.fetchHoneybirds(),
      expect: () => [
        HoneybirdLoading(),
        HoneybirdLoaded([
          Honeybird(id: '1', name: 'Honeybird1', description: 'Description1'),
          Honeybird(id: '2', name: 'Honeybird2', description: 'Description2'),
        ]),
      ],
    );

    blocTest<HoneybirdCubit, HoneybirdState>(
      'emits [HoneybirdLoading, HoneybirdError] when fetchHoneybirds fails',
      build: () {
        when(() => honeybirdRepository.getHoneybirds()).thenThrow(Exception('Failed to fetch honeybirds'));
        return HoneybirdCubit(honeybirdRepository);
      },
      act: (cubit) => cubit.fetchHoneybirds(),
      expect: () => [
        HoneybirdLoading(),
        HoneybirdError('Failed to fetch honeybirds'),
      ],
    );
  });
}
