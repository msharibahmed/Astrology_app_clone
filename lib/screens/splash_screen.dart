import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:india_today_assignment/providers/panchang_provider.dart';
import 'package:india_today_assignment/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();

    final _astroProv = Provider.of<AstrologerProv>(context, listen: false);
    final _panchProv = Provider.of<PanchangProv>(context, listen: false);

    _astroProv.getAllAstrologers().then((_) => _panchProv.fetchPanchang()).then(
        (_) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/icons/logo.png')),
      ),
    );
  }
}
