import 'package:flutter/material.dart';
import 'package:grabby/src/views/getstartedscreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Faster Delivery',
      description:
          'Deliver items to you as fast as the speed of light with the use of new innovations',
      image: 'assets/images/fast-delivery.png',
      backgroundImage: 'assets/images/fastdelivery-background.png',
    ),
    OnboardingItem(
      title: 'Geotracking',
      description:
          'Now you can track your shipment easily, organize a hassle-free delivery and contact the delivery agent during the process',
      image: 'assets/images/geolocation.png',
      backgroundImage: 'assets/images/geolocation-background.png',
    ),
    OnboardingItem(
      title: 'Real-Time Notification',
      description:
          'Logistics and delivery made easy by notifying you of your order without having to open the app',
      image: 'assets/images/notification.png',
      backgroundImage: 'assets/images/notification-background.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(onboardingItems[currentPage].backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingItems.length,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      item: onboardingItems[index],
                    );
                  },
                ),
              ),
              buildPageIndicator(),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (currentPage < onboardingItems.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    _getStarted();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xFF2978D1),
                  minimumSize: const Size(364, 54),
                  elevation: 0,
                ),
                child: Text(
                  currentPage == onboardingItems.length - 1
                      ? 'Get Started'
                      : 'Next',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            top: 30,
            right: 16,
            child: TextButton(
              onPressed: () {
                _skipOnboarding();
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingItems.length,
        (index) => buildIndicator(index),
      ),
    );
  }

  Widget buildIndicator(int index) {
    double activeWidth = 18.0;
    double activeHeight = 8.0;
    double inactiveWidth = 10.0;
    double inactiveHeight = 10.0;

    return Container(
      width: currentPage == index ? activeWidth : inactiveWidth,
      height: currentPage == index ? activeHeight : inactiveHeight,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF2978D1)
            : const Color(0xFFC5D0DB),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  void _skipOnboarding() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const GetStartedScreen(),
    ));
  }

  void _getStarted() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const GetStartedScreen(),
    ));
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;
  final String backgroundImage;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundImage,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            width: 350,
          ),
          const SizedBox(height: 20),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2978D1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.description,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
