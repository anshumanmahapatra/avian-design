import '../models/reviews.dart';
import '../constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ReviewsTab {
  showReviewsTab(BuildContext context, Reviews reviews, Size size) {
    return Container(
      padding: const EdgeInsets.all(40),
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: kAccentColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            reviews.name,
            style: const TextStyle(
                color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            reviews.description,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
