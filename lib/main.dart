import 'dart:math';

import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffdfeaeb);
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.white,
        ),
      ),
      home: const ClockView(),
    );
  }
}

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        backgroundColor: kPrimaryColor,
        child: Builder(
          builder: (context) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: IconButton(
                  onPressed: () => Scaffold.of(context).closeEndDrawer(),
                  icon: const Icon(Icons.close),
                ),
              ),
              const SingleChildScrollView(
                child: NavItems(
                  inDrawer: true,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: const [
          ReverseClock(),
          ExamplePageContent(),
          Positioned(
            bottom: 12,
            right: 12,
            child: Credits(),
          ),
        ],
      ),
    );
  }
}

class NavItems extends StatelessWidget {
  final double navSpacing;
  final bool inDrawer;

  const NavItems({
    super.key,
    this.navSpacing = 24.0,
    this.inDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: inDrawer ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment:
          inDrawer ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        NavButton(
          text: 'Solutions',
          onPressed: () {},
        ),
        SizedBox(
          width: inDrawer ? 0 : navSpacing,
          height: inDrawer ? navSpacing : 0,
        ),
        NavButton(
          text: 'Architectures',
          onPressed: () {},
        ),
        SizedBox(
          width: inDrawer ? 0 : navSpacing,
          height: inDrawer ? navSpacing : 0,
        ),
        NavButton(
          text: 'Pricing',
          onPressed: () {},
        ),
        SizedBox(
          width: inDrawer ? 0 : navSpacing,
          height: inDrawer ? navSpacing : 0,
        ),
        NavButton(
          text: 'Careers',
          onPressed: () {},
        ),
        SizedBox(
          width: inDrawer ? 0 : navSpacing,
          height: inDrawer ? navSpacing : 0,
        ),
        NavButton(
          text: 'About',
          onPressed: () {},
        ),
        SizedBox(
          width: inDrawer ? 0 : navSpacing,
          height: inDrawer ? navSpacing : 0,
        ),
        ActionButton(
          text: 'Request a demo',
          onPressed: () {},
        ),
      ],
    );
  }
}

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'as shared by @uiuxadrian',
      style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),
    );
  }
}

class ExamplePageContent extends StatelessWidget {
  const ExamplePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24.0),
        const NavBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: min(320.0, MediaQuery.of(context).size.height / 4),
                      left: 64.0,
                      right: 64.0,
                      bottom: 64.0),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 500.0,
                        child: Landing(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Brand'.toUpperCase(),
            style: Theme.of(context).textTheme.overline!.copyWith(
                  color: Colors.white,
                  fontSize: 24.0,
                  letterSpacing: 8.0,
                ),
          ),
          MediaQuery.of(context).size.width > 920
              ? const NavItems()
              : IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(Icons.menu),
                ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const NavButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  final TextStyle? headerStyle;
  final TextStyle? bodyStyle;

  const Landing({
    super.key,
    this.headerStyle,
    this.bodyStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle = this.headerStyle ??
        Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            );
    TextStyle bodyStyle = this.bodyStyle ??
        Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.black,
              height: 1.5,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('The clock', style: headerStyle),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'is ', style: headerStyle),
              TextSpan(
                text: 'ticking',
                style: headerStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              TextSpan(text: '.', style: headerStyle),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porta posuere sapien quis mattis. Quisque odio mauris, commodo id nulla eu, tristique congue.',
          style: bodyStyle,
        ),
        const SizedBox(height: 38.0),
        ActionButton(
          text: 'Get started now.',
          onPressed: () {},
        ),
        const SizedBox(height: 42.0),
        Row(
          children: const [
            Metric(
              metric: '2943',
              unit1: 'Minutes',
              unit2: 'Today',
            ),
            SizedBox(width: 64.0),
            Metric(
              metric: '\$1M+',
              unit1: 'Year',
              unit2: 'Rev',
            ),
          ],
        ),
      ],
    );
  }
}

class Metric extends StatelessWidget {
  final String metric;
  final String unit1;
  final String unit2;

  const Metric({
    super.key,
    required this.metric,
    required this.unit1,
    required this.unit2,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle metricStyle = const TextStyle(
      color: Colors.white,
      fontSize: 38.0,
      fontWeight: FontWeight.bold,
    );
    TextStyle unitStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w100,
    );

    return Row(
      children: [
        Text(metric, style: metricStyle),
        const SizedBox(width: 8.0),
        Transform.translate(
          offset: const Offset(0, -1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(unit1, style: unitStyle),
              Text(unit2, style: unitStyle),
            ],
          ),
        )
      ],
    );
  }
}

class ReverseClock extends StatefulWidget {
  const ReverseClock({super.key});

  @override
  State<ReverseClock> createState() => _ReverseClockState();
}

class _ReverseClockState extends State<ReverseClock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    aspectRatio = aspectRatio < 1.0 ? (1 / aspectRatio) : aspectRatio;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => RotationTransition(
        turns: _controller.drive(
          Tween<double>(begin: 1.0, end: 0),
        ),
        child: child,
      ),
      child: Transform.scale(
        scale: sqrt2 * aspectRatio,
        child: ClipPath(
          clipper: CircleClipper(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: SweepGradient(
                center: Alignment.center,
                colors: [
                  Colors.black,
                  kPrimaryColor,
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2,
      ),
    );

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
