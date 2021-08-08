import '../screens/contact_us.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

import '../constants/colors_constant.dart';
import '../models/pricing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PricingTab extends StatelessWidget {
  final Pricing pricing;
  final GlobalKey<CurvedNavigationBarState>? navBarKey;
  final bool showKnowMore;
  const PricingTab(
      {Key? key,
      required this.pricing,
      required this.showKnowMore,
      this.navBarKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: showKnowMore == true ? size.height * 0.65 : size.height * 0.9,
      width: size.width * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: pricing.imgUrl),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                pricing.title,
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: size.width * 0.3,
              ),
              Text(
                pricing.totalPrice,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Time for Completion"),
              Text(
                pricing.time,
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: showKnowMore == true ? 3 : pricing.description.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: kPrimaryColor,
                  ),
                  Text(pricing.description.elementAt(index)),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text("Effort Est: "),
              Text(pricing.effort),
              const Spacer(),
              const Text("Price: "),
              Text(pricing.pricePerHour),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Offstage(
                  offstage: showKnowMore == false,
                  child: TextButton(
                    child: const Text("Know More",
                        style: TextStyle(color: kPrimaryColor)),
                    onPressed: () {
                      navBarKey!.currentState!.setPage(2);
                    },
                  )),
              ElevatedButton(
                child: const Text("Book Now"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
