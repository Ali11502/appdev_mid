import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_event.dart';
import 'bloc/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Example',
      home: BlocProvider(create: (context) => AppBloc(), child: HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLoC Example")),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return Center(child: Text(state.data));
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.red)),
            );
          }
          return const Center(child: Text("Press the button to load data"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppBloc>().add(LoadData());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
