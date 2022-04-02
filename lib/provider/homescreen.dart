import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_demo/blocs/internet_block/internet/internet_bloc.dart';
import 'package:provider_demo/blocs/internet_block/internet/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) => {
            if (state is InternetGainedState)
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet connected!"),
                  backgroundColor: Colors.green,
                ))
              }
            else if (state is InternetLostState)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet disconnected!"),
                    backgroundColor: Colors.redAccent,
                  ),
                )
              }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state is InternetLostState) ...{
                    Image.asset(
                      "assets/no_internet.png",
                      width: 300,
                    ),
                  },
                  Container(
                    height: 150,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 10)),
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -1)),
                        ],
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage("assets/food_image.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade300,
                              offset: const Offset(3, 10)),
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade300,
                              offset: const Offset(-3, -1)),
                        ],
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage("assets/food_image.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
