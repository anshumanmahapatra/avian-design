import 'package:animations/animations.dart';
import '../models/pricing.dart';
import '../widgets/pricing_tab.dart';
import '../widgets/toggle_bar.dart';

import '../screens/contact_us.dart';

import '../widgets/reviews_tab.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/reviews.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../widgets/projects_tab.dart';
import '../constants/colors_constant.dart';
import '../models/projects.dart';
import '../widgets/my_clipper.dart';

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final GlobalKey<CurvedNavigationBarState> navBarKey;
  const Home({Key? key, required this.navBarKey}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pricing> prices = pricing;
  final List<Projects> projectsList = projects;
  final List<Reviews> reviewsList = reviews;
  int? currentPage;
  int currentIndex = 0;
  bool isLoading = false;
  bool showKnowMore = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadData();
    });

    currentPage = 0;
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.wait(projectsList
        .map((urlImage) => cacheProjectImages(context, urlImage))
        .toList());

    setState(() {
      isLoading = false;
    });
  }

  Future cacheProjectImages(BuildContext context, Projects urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> labels = prices.map((e) => e.title).toList();
    List<Widget> pages = [
      PricingTab(
          pricing: prices[0], showKnowMore: true, navBarKey: widget.navBarKey),
      PricingTab(
          pricing: prices[1], showKnowMore: true, navBarKey: widget.navBarKey),
      PricingTab(
          pricing: prices[2], showKnowMore: true, navBarKey: widget.navBarKey),
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
                                "assets/lottie/design.json",
                              )),
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                  child: Text(
                                "Design is for People Not Products",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Why? How? What?",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            TextButton(
                              child: const Text("Know More",
                                  style: TextStyle(color: kPrimaryColor)),
                              onPressed: () {
                                widget.navBarKey.currentState!.setPage(1);
                              },
                            )
                          ],
                        ),
                      )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              child: Image.network(
                                "https://static.wixstatic.com/media/ec9816_73022ee799ad448f8de0010419d0ea08~mv2.png/v1/fill/w_600,h_338,al_c,q_85,usm_0.66_1.00_0.01/Avian%20Design%20ASset_001.webp",
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            )),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: const <Widget>[
                                Text(
                                  "We are all about Design!",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                    "We collaborate with you and your team to empathise, be creative, and run successful Design Sprints to leverage Design Thinking in your product journey!")
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Recent Works",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            TextButton(
                              child: const Text("View All",
                                  style: TextStyle(color: kPrimaryColor)),
                              onPressed: () {
                                widget.navBarKey.currentState!.setPage(2);
                              },
                            )
                          ],
                        ),
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
                    childCount: 3,
                  )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Reviews",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: LimitedBox(
                    maxHeight: size.height * 0.3,
                    child: CarouselSlider.builder(
                        itemCount: reviewsList.length,
                        itemBuilder: (context, index, index2) {
                          final items = reviewsList[index];
                          return ReviewsTab()
                              .showReviewsTab(context, items, size);
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            enableInfiniteScroll: true,
                            height: 275,
                            viewportFraction: 1,
                            onPageChanged:
                                (index, CarouselPageChangedReason text) {
                              setState(() {
                                currentPage = index;
                              });
                            })),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  sliver: SliverToBoxAdapter(
                    child: LimitedBox(
                      maxHeight: 10,
                      maxWidth: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: reviewsList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentPage == index
                                            ? Colors.black45
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverToBoxAdapter(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Pricing",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextButton(
                                child: const Text("See All",
                                    style: TextStyle(color: kPrimaryColor)),
                                onPressed: () {
                                  widget.navBarKey.currentState!.setPage(2);
                                },
                              )
                            ],
                          ),
                        )),
                  ),
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
              ],
            ),
    );
  }
}
