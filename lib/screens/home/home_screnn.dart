import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

/// This [HomeScreen] is visible when opening the home tab from the MainScaffold
///
/// It displays the home section of the application,
class HomeScreen extends StatelessWidget {
  ///  Constructor for [HomeScreen]
  HomeScreen({super.key});

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Showcase(
              key: _one,
              title: 'Profile',
              description: 'Click here to go to your Profile',
              child: const Text('Ich stehe in der Mitte!'),
            ),
            Showcase(
              key: _two,
              title: 'Profile',
              description: 'Click here to go to your Profile',
              disableMovingAnimation: true,
              targetShapeBorder: const CircleBorder(),
              targetBorderRadius: const BorderRadius.all(Radius.circular(40)),
              showArrow: false,
              tooltipPadding: const EdgeInsets.all(5),
              movingAnimationDuration: const Duration(milliseconds: 1500),
              blurValue: 2,
              child: const Text('Ich stehe in der Mitte!'),
            ),
            ElevatedButton(
              onPressed: () {
                ShowCaseWidget.of(context).startShowCase([_one, _two, _three]);
              },
              child: const Text('Tour starten!'),
            ),
          ],
        ),
        Showcase(
          key: _three,
          title: 'Profile',
          description: 'Click here to go to your Profile',
          disableMovingAnimation: true,
          targetShapeBorder: const CircleBorder(),
          targetBorderRadius: const BorderRadius.all(Radius.circular(40)),
          showArrow: false,
          tooltipPadding: const EdgeInsets.all(5),
          movingAnimationDuration: const Duration(milliseconds: 1500),
          blurValue: 2,
          child: const Text('Ich stehe in der Mitte!'),
        ),
      ],
    );
  }
}
