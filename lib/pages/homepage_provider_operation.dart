import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/homepage_provider.dart';

class HomePageProviderOperations extends StatelessWidget {
  const HomePageProviderOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
              create: (context) => HomePageProvider(),
              child: Consumer<HomePageProvider>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.eligiblityMessage.toString(),
                      style: TextStyle(
                          color: (provider.isEligible == true)
                              ? Colors.green
                              : Colors.red),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Enter you age!"),
                      onChanged: (val) {
                        if (val.isNotEmpty)
                          provider.checkEligiblity(int.parse(val));
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
