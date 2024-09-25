
import 'package:equatable/equatable.dart';

class Bird extends Equatable {
	final String id;
	final String name;
	final String description;

	Bird({
		required this.id,
		required this.name,
		required this.description,
	});

	factory Bird.fromJson(Map<String, dynamic> json) {
		return Bird(
			id: json['id'] as String,
			name: json['name'] as String,
			description: json['description'] as String,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'id': id,
			'name': name,
			'description': description,
		};
	}

	@override
	List<Object?> get props => [id, name, description];
}
