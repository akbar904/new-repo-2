
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/bird_cubit.dart';
import '../cubits/bird_state.dart';
import '../widgets/bird_list.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Birds'),
			),
			body: BlocBuilder<BirdCubit, BirdState>(
				builder: (context, state) {
					if (state is BirdLoading) {
						return const Center(
							child: CircularProgressIndicator(),
						);
					} else if (state is BirdLoaded) {
						return BirdList(birds: state.birds);
					} else if (state is BirdError) {
						return Center(
							child: Text(state.message),
						);
					} else {
						return const Center(
							child: Text('Unknown state'),
						);
					}
				},
			),
		);
	}
}
