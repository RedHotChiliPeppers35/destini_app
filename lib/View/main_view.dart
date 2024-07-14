import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idontknow/ModelView/story_brain.dart';
import 'package:idontknow/View/first_page.dart';

StoryBrain storyBrainStew = StoryBrain();

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  TextStyle storyStyle = const TextStyle(fontSize: 20, color: Colors.white);

  TextStyle choiceStyke = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/background2.jpg"),
          ),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white10),
                    child: Text(
                      storyBrainStew.getStory(),
                      style: storyStyle,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: storyBrainStew.getChoice1() == "Restart"
                        ? TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                      builder: (context) => const FirstPage(),
                                      context: context));
                            },
                            child: Center(
                              child: Text(
                                storyBrainStew.getChoice1(),
                                style: choiceStyke,
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              setState(() {
                                storyBrainStew.nextStory(1);
                              });
                            },
                            child: Center(
                              child: Text(
                                storyBrainStew.getChoice1(),
                                style: choiceStyke,
                              ),
                            ),
                          )),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: storyBrainStew.isChoice2available(),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrainStew.nextStory(2);
                        });
                      },
                      child: Center(
                        child: Text(
                          storyBrainStew.getChoice2(),
                          style: choiceStyke,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
