import 'package:cached_network_image/cached_network_image.dart';

import '../constants/colors_constant.dart';
import '../models/why_choose_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class WhyChooseUsTab {
  showWhyChooseUsTab(BuildContext context, WhyChooseUs whyChooseUs) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: whyChooseUs.imgUrl,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                whyChooseUs.title,
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                whyChooseUs.description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kAccentColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
