import 'package:bitcoin_news_bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_state.dart';

class HomePage extends StatelessWidget {
  late HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin News'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            return ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.newsList[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(state.newsList[index].description),
                  onTap: () {
                    // Handle onTap event
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error occurred'),
            );
          }
        },
      ),
    );
  }
}
