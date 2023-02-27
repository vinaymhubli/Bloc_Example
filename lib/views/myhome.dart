import 'package:bloc_connect/bloc/internetconnection/internet_bloc.dart';
import 'package:bloc_connect/bloc/internetconnection/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: BlocConsumer<Internetbloc, Internetstate>(
              listener: (context, state) {
        if (state is Internetgainstate) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Internet Connected"),
            backgroundColor: Colors.green,
          ));
        } else if (state is Internetloststate) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Internet is not connected"),
            backgroundColor: Colors.red,
          ));
        }
      }, builder: (context, state) {
        if (state is Internetgainstate) {
          return const Text('Connected!', style: TextStyle(fontSize: 18));
        } else if (state is Internetloststate) {
          return const Text("Not Connected!!", style: TextStyle(fontSize: 18));
        } else {
          return const Text(
            "Loading....",
            style: TextStyle(fontSize: 18),
          );
        }
      })),
    ));
  }
}
