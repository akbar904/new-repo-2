
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:honeybird_app/screens/honeybird_detail_screen.dart';

class MockHoneybirdCubit extends MockCubit<HoneybirdState> implements HoneybirdCubit {}

void main() {
	group('HoneybirdDetailScreen Widget Tests', () {
		testWidgets('should display the honeybird name and description', (WidgetTester tester) async {
			// Arrange
			final honeybird = Honeybird(id: '1', name: 'Honeybird One', description: 'Description of Honeybird One');
			await tester.pumpWidget(MaterialApp(
				home: HoneybirdDetailScreen(honeybird: honeybird),
			));

			// Act & Assert
			expect(find.text('Honeybird One'), findsOneWidget);
			expect(find.text('Description of Honeybird One'), findsOneWidget);
		});
	});

	group('HoneybirdDetailScreen Cubit Tests', () {
		late HoneybirdCubit honeybirdCubit;

		setUp(() {
			honeybirdCubit = MockHoneybirdCubit();
		});

		blocTest<HoneybirdCubit, HoneybirdState>(
			'should emit HoneybirdLoading and then HoneybirdLoaded when fetching honeybird details',
			build: () => honeybirdCubit,
			act: (cubit) => cubit.fetchHoneybirdDetails('1'),
			expect: () => [
				HoneybirdLoading(),
				HoneybirdLoaded(honeybird: Honeybird(id: '1', name: 'Honeybird One', description: 'Description of Honeybird One')),
			],
		);
	});
}
