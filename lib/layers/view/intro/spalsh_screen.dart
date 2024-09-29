import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:government_project/core/configuration/styles.dart';
import 'package:government_project/core/routing/route_path.dart';
import '../../../core/configuration/assets.dart';
import '../../../core/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = ColorTween(begin: Styles.colorPrimary, end: Colors.white)
        .animate(_animationController);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutePaths.News, (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: _animation.value,
        body: Center(
          child: Image.asset(AssetsLink.APP_LOGO),
        ));
  }
}
