
import 'package:flutter/material.dart';

class BirdList extends StatelessWidget {
	final List<Widget> birds;

	const BirdList({Key? key, required this.birds}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		if (birds.isEmpty) {
			return const Center(
				child: Text('No birds available'),
			);
		}
		return ListView.builder(
			itemCount: birds.length,
			itemBuilder: (context, index) {
				return birds[index];
			},
		);
	}
}
