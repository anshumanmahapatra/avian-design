import '../constants/colors_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/how_we_do.dart';
import 'package:flutter/material.dart';

class HowWeDoItTab {
  showhowWeDoIt(BuildContext context, HowWeDo howWeDo, Size size) {
    return Column(
      children: [
        Container(
          width: size.width * 0.9,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: kAccentColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: CachedNetworkImage(
                imageUrl: howWeDo.imgUrl,
              )),
              const SizedBox(
                height: 10,
              ),
              Text(
                howWeDo.title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                howWeDo.description,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
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
