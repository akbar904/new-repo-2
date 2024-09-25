

import 'package:equatable/equatable.dart';

abstract class BirdState extends Equatable {
	const BirdState();

	@override
	List<Object> get props => [];
}

class BirdLoading extends BirdState {}

class BirdLoaded extends BirdState {
	final List<Bird> birds;

	const BirdLoaded({required this.birds});

	@override
	List<Object> get props => [birds];
}

class BirdError extends BirdState {
	final String message;

	const BirdError(this.message);

	@override
	List<Object> get props => [message];
}

class Bird {
	final String id;
	final String name;
	final String description;

	const Bird({
		required this.id,
		required this.name,
		required this.description,
	});

	@override
	List<Object> get props => [id, name, description];
}

