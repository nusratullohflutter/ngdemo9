import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animation =
        Tween<Size>(begin: const Size(200, 200), end: const Size(240, 240))
            .animate(
                CurvedAnimation(parent: _controller!, curve: Curves.bounceOut));
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resize/Pulse Animation"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation!,
          builder: (ctx, ch) {
            return SizedBox(
              height: _animation!.value.height,
              width: _animation!.value.width,
              child: Image.asset("assets/images/im_heart.png"),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _controller!.forward();
        },
      ),
    );
  }
}
