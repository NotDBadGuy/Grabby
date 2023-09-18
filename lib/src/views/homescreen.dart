import 'package:flutter/material.dart';
import 'package:grabby/src/views/widgets/accountwidget.dart';
import 'package:grabby/src/views/widgets/cartegorywidget.dart';
import 'package:grabby/src/views/widgets/cartwidget.dart';
import 'package:grabby/src/views/widgets/homewidget.dart';
import 'package:grabby/src/views/widgets/orderwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const List<Widget> screenList = [
    HomeWidget(),
    CategoryWidget(),
    CartWidget(),
    OrderWidget(),
    AccountWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color(0xFFBFBEBE),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
                color: Color(0xFFBFBEBE),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFFBFBEBE),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_outlined,
                color: Color(0xFFBFBEBE),
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFFBFBEBE),
              ),
              label: 'Account',
            ),
          ],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xFF18191F),
        ),
      ),
    );
  }
}
