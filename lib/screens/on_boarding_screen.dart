import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConcentricPageView(
            colors: const <Color>[
          Color(0xFF933E82),
          Color(0xFF3A0032),
          Color(0xFF5B0750)
        ],
            itemCount: 3,
            itemBuilder: (int index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 70,
                    child: Image.asset(
                      "assets/images/logo_dark.png",
                      height: 100,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Image.asset('assets/images/on_boarding.gif'),
                  Positioned(
                    bottom: -50,
                    right: -80,
                    child: Image.asset('assets/images/graph_2.png'),
                    height: 250,
                    width: 250,
                  ),
                  cards[index]
                ],
              );
            },
            onFinish: () {
              Navigator.pushNamed(context, "/login");
            }));
  }

  List<Widget> cards = [
    CardBoarding(
        title: "Welcome to your app...",
        subTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
    CardBoarding(
        title: "Be part our family....",
        subTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor x2"),
    CardBoarding(
        title: "Enjoy this appp",
        subTitle:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor x3")
  ];
}

class CardBoarding extends StatelessWidget {
  String? title;
  String? subTitle;
  CardBoarding({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/login_img.gif',
          height: 300,
          width: 500,
        ),
        Text(
          title!,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          subTitle!,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
