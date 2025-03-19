import 'package:flutter/material.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/product/product_event.dart';
import 'screens/product_screen.dart';
import 'service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ProductBloc(ApiService())..add(LoadProducts()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}
