import 'package:cached_network_image/cached_network_image.dart';

import '../constants/colors_constant.dart';
import '../models/advisors.dart';
import 'package:flutter/material.dart';

class AdvisorsTab {
  showAdvisors(BuildContext context, Advisors advisors) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                child: CachedNetworkImage(
              imageUrl: advisors.imgUrl,
            )),
            const SizedBox(
              height: 5,
            ),
            Text(
              advisors.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              advisors.role,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
