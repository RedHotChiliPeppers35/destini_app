import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idontknow/View/main_view.dart';

class FirstPage extends StatelessWidget {
  final firstStyle = const TextStyle(fontSize: 40, color: Colors.white);
  final secondStyle = const TextStyle(fontSize: 30, color: Colors.white);
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background2.jpg"), fit: BoxFit.fill)),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "Welcome",
                  style: firstStyle,
                ),
                Text(
                  "to the",
                  style: secondStyle,
                ),
                Text(
                  "Destiny Game !",
                  style: firstStyle,
                ),
                const Spacer(),
                Text(
                  "If you are all set",
                  style: secondStyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoDialogRoute(
                        builder: (context) => const MainView(),
                        context: context));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.redAccent),
                    child: const Center(
                      child: Text(
                        "PLAY",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
