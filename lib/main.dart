import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_demo/blocs/internet_block/internet/internet_bloc.dart';
import 'package:provider_demo/provider/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider_Bloc',
        theme: ThemeData(
            textTheme:
                GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)),
        home: const HomeScreen(),
      ),
    );
  }
}
