import 'package:cached_network_image/cached_network_image.dart';

import '../constants/colors_constant.dart';
import '../models/team.dart';
import 'package:flutter/material.dart';

class TeamTab {
  showTeam(BuildContext context, Team team) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: CachedNetworkImage(
                imageUrl: team.imgUrl,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              team.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              team.role,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
