import 'package:cached_network_image/cached_network_image.dart';

import '../models/advisors.dart';
import '../models/team.dart';
import '../widgets/advisors_tab.dart';
import '../widgets/how_we_do_it_tab.dart';
import '../widgets/team_tab.dart';
import '../models/how_we_do.dart';
import '../models/why_choose_us.dart';
import '../widgets/who_are_we_tab.dart';
import '../widgets/why_choose_us_tab.dart';
import '../models/who_are_we.dart';
import '../widgets/stats_tab.dart';
import 'package:lottie/lottie.dart';

import '../constants/colors_constant.dart';
import '../widgets/my_clipper.dart';
import '../models/stats.dart';
import 'package:flutter/material.dart';

import 'contact_us.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<Stats> statistics = stats;

  final List<WhoAreWe> intro = whoAreWe;

  final List<WhyChooseUs> reason = whyChooseUs;

  final List<HowWeDo> method = howWeDo;

  final List<Team> members = team;

  final List<Advisors> mentors = advisors;

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

    await Future.wait(
        intro.map((urlImage) => cacheIntroImages(context, urlImage)).toList());

    await Future.wait(reason
        .map((urlImage) => cacheReasonImages(context, urlImage))
        .toList());

    await Future.wait(method
        .map((urlImage) => cacheMethodImages(context, urlImage))
        .toList());

    await Future.wait(members
        .map((urlImage) => cacheMembersImages(context, urlImage))
        .toList());

    await Future.wait(mentors
        .map((urlImage) => cacheMentorsImages(context, urlImage))
        .toList());

    setState(() {
      isLoading = false;
    });
  }

  Future cacheIntroImages(BuildContext context, WhoAreWe urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  Future cacheReasonImages(BuildContext context, WhyChooseUs urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  Future cacheMethodImages(BuildContext context, HowWeDo urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  Future cacheMembersImages(BuildContext context, Team urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  Future cacheMentorsImages(BuildContext context, Advisors urlImage) =>
      precacheImage(CachedNetworkImageProvider(urlImage.imgUrl), context);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactUs())
            );
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
                                "assets/lottie/confuse-person.json",
                              )),
                              const SizedBox(
                                width: 40,
                              ),
                              const Expanded(
                                  child: Text(
                                "Wondering Who Are We? Why Choose Us?",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 75,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: statistics.length,
                        itemBuilder: (context, index) {
                          final items = statistics[index];
                          return StatsTab().showStatsTab(context, items.title,
                              items.statsText, items.tabColor, items.textColor);
                        }),
                  ),
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
                        child: Text("Why? How? What?",
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
                const SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Who Are We?",
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
                  child: Container(
                    height: 125,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: intro.length,
                        itemBuilder: (context, index) {
                          final items = intro[index];
                          return WhoAreWeTab().showWhoWeAreTab(context, items);
                        }),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "We are a team of designers, entrepreneurs and creators all coming together to form a creative community with a common vision of growth and innovation.",
                          textAlign: TextAlign.center,
                        ),
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
                        child: Text("Why Choose Us?",
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
                      final items = reason[index];
                      return WhyChooseUsTab()
                          .showWhyChooseUsTab(context, items);
                    },
                    childCount: reason.length,
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
                        child: Text("How we do it?",
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
                      final items = method[index];
                      return HowWeDoItTab().showhowWeDoIt(context, items, size);
                    },
                    childCount: method.length,
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
                        child: Text("Meet Our Team",
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
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final items = members[index];
                          return TeamTab().showTeam(context, items);
                        },
                        childCount: members.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: size.height * 0.3,
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
                        child: Text("Our Advisors",
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
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final items = mentors[index];
                          return AdvisorsTab().showAdvisors(context, items);
                        },
                        childCount: mentors.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: size.height * 0.32,
                      )),
                ),
              ],
            ),
    );
  }
}
