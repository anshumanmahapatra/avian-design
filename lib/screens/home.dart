import 'package:lottie/lottie.dart';

import '../widgets/drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerHelper().drawer(context),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Home"),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Lottie.asset("assets/lottie/design.json")),
                const Spacer(),
                const Expanded(
                    child: Text(
                  "Design is for People Not Products",
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
