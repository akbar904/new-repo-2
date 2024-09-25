
import 'package:flutter/material.dart';
import 'package:bird_app/models/bird.dart';

class BirdCard extends StatelessWidget {
	final Bird bird;

	const BirdCard({Key? key, required this.bird}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Card(
			child: Padding(
				padding: const EdgeInsets.all(8.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(
							bird.name,
							style: TextStyle(
								fontSize: 20,
								fontWeight: FontWeight.bold,
							),
						),
						SizedBox(height: 8),
						Text(bird.description),
					],
				),
			),
		);
	}
}
