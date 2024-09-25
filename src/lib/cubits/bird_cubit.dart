
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bird_app/models/bird.dart';
import 'package:bird_app/cubits/bird_state.dart';
import 'package:bird_app/repositories/bird_repository.dart';

class BirdCubit extends Cubit<BirdState> {
	final BirdRepository repository;

	BirdCubit({required this.repository}) : super(BirdInitial());

	void fetchBirds() async {
		try {
			emit(BirdLoading());
			final birds = await repository.getBirds();
			emit(BirdLoaded(birds: birds));
		} catch (e) {
			emit(BirdError(error: e.toString()));
		}
	}
}
