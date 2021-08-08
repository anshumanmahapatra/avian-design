import 'package:animations/animations.dart';
import '../constants/colors_constant.dart';
import '../models/pricing.dart';
import '../models/projects.dart';
import '../widgets/my_clipper.dart';
import '../widgets/pricing_tab.dart';
import '../widgets/projects_tab.dart';
import '../widgets/toggle_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'contact_us.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<Pricing> prices = pricing;
  List<Projects> projectsList = projects;
  int currentIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadData();
    });
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait(projectsList
        .map((urlImage) => cacheProjectImages(context, urlImage))
        .toList());

    await Future.wait(prices
        .map((urlImage) => cachePricingImages(context, urlImage))
        .toList());

    setState(() {
      isLoading = false;
    });
  }

  Future cachePricingImages(BuildContext context, Pricing urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  Future cacheProjectImages(BuildContext context, Projects urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> labels = prices.map((e) => e.title).toList();
    List<Widget> pages = [
      PricingTab(pricing: prices[0], showKnowMore: false),
      PricingTab(pricing: prices[1], showKnowMore: false),
      PricingTab(pricing: prices[2], showKnowMore: false),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactUs()));
          },
          child: const Icon(Icons.contact_support_outlined)),
      body: isLoading == true
          ? Container(
              color: Colors.white,
              height: size.height,
              width: size.width,
              child: Center(
                child: Lottie.asset(
                  "assets/lottie/loading.json",
                ),
              ))
          : CustomScrollView(
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
                                "assets/lottie/ui-ux.json",
                              )),
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                  child: Text(
                                "Here are the Services we provide",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        )),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Pricing",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
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
                const SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("All Our Works",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final items = projectsList[index];
                      return ProjectsTab().showProjectsTab(context, items);
                    },
                    childCount: projectsList.length,
                  )),
                ),
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
