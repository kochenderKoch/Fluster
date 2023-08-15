import 'package:fluster/config/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

/// A short Lottie Animation on App startup
class SplashScreen extends StatefulWidget {
  /// Create an SplashScreen Widget
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Config.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_lottie.json',
          controller: _controller,
          height: MediaQuery.of(context).size.height * 1,
          animate: true,
          alignment: Alignment.center,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() => context.go('/home'));
          },
        ),
      ),
    );
  }
}
