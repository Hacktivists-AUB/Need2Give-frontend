import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _activeIndex = 0;
  final _controller = CarouselController();
  final List<Map<String, dynamic>> _cards = [
    {
      'image': 'assets/image1.jpg',
      'title': 'World domination',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod felis et ligula interdum, at efficitur orci gravida. '
    },
    {
      'image': 'assets/image2.jpg',
      'title': 'Complete usurpation',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod felis et ligula interdum, at efficitur orci gravida. '
    },
    {
      'image': 'assets/image3.jpg',
      'title': 'Inciniration',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod felis et ligula interdum, at efficitur orci gravida. '
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Global.white,
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Need2Give',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: _cards.length,
                    itemBuilder: (context, index, realIndex) =>
                        buildImage(index),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) =>
                          setState(() => _activeIndex = index),
                      aspectRatio: 1,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  buildIndicator(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Button(text: 'Sign up', onPressed: () {}),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Builder(builder: (context) {
                        return TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              color: Global.mediumGreen,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(int index) => Column(
        children: [
          Image.asset(
            _cards[index]['image'],
            width: 160,
            height: 160,
          ),
          const SizedBox(height: 10),
          Text(
            _cards[index]['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _cards[index]['description'],
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      );

  Widget buildIndicator() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: _cards.length,
          effect: const SlideEffect(
            activeDotColor: Global.darkGreen,
            dotColor: Global.lightGrey,
          ),
        ),
      );

  void previous() =>
      _controller.previousPage(duration: const Duration(milliseconds: 300));

  void next() =>
      _controller.nextPage(duration: const Duration(milliseconds: 300));
}
