import 'package:animations/animations.dart';
import '../widgets/contact_us_tab.dart';
import '../widgets/toggle_bar.dart';

import '../constants/colors_constant.dart';
import '../widgets/my_clipper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  List<String> labels = ["Email", "Phone"];
  int currentIndex = 0;
  List<Widget> pages = [
    const ContactUsTab(index: 0),
    const ContactUsTab(index: 1),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                  color: kPrimaryColor,
                  width: size.width,
                  height: size.height * 0.3,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Lottie.asset(
                          "assets/lottie/contact-us-1.json",
                        )),
                        const SizedBox(
                          width: 40,
                        ),
                        const Expanded(
                            child: Text(
                          "Hello there. Let's Connect",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                  )),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: ToggleBar(
                labels: labels,
                backgroundColor: Colors.grey.withOpacity(0.1),
                onSelectionUpdated: (index) => setState(() {
                  currentIndex = index;
                }),
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 10,
          )),
          SliverToBoxAdapter(
              child: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 3000),
            transitionBuilder: (child, animation, secondaryAnimation) {
              return SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal);
            },
            child: pages[currentIndex],
          )),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
