import 'package:bloc_connect/bloc/internetconnection/internet_bloc.dart';
import 'package:bloc_connect/views/myhome.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Internetbloc(),
      child: const MaterialApp(
        title: "BLoC Connectivity",
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    );
  }
}
