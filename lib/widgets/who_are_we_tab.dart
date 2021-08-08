import 'package:cached_network_image/cached_network_image.dart';

import '../constants/colors_constant.dart';
import '../models/who_are_we.dart';
import 'package:flutter/material.dart';

class WhoAreWeTab {
  showWhoWeAreTab(BuildContext context, WhoAreWe whoAreWe) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Card(
          color: kAccentColor,
          child: Container(
            height: 150,
            width: 100,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 3,
                    child: SizedBox(
                        child: CachedNetworkImage(
                      imageUrl: whoAreWe.imgUrl,
                    ))),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    whoAreWe.title,
                    style: const TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
