import '../constants/colors_constant.dart';
import 'package:flutter/material.dart';

class Stats {
  final String title, statsText;
  final Color tabColor, textColor;
  Stats(
      {required this.title,
      required this.statsText,
      required this.tabColor,
      required this.textColor});
}

List<Stats> stats = [
  Stats(
      title: "Clients",
      statsText: "30+",
      tabColor: kPrimaryColor,
      textColor: kAccentColor),
  Stats(
      title: "Projects",
      statsText: "50+",
      tabColor: kAccentColor,
      textColor: kPrimaryColor),
  Stats(
      title: "Retention",
      statsText: "75%",
      tabColor: kPrimaryColor,
      textColor: kAccentColor),
  Stats(
      title: "Team",
      statsText: "15+",
      tabColor: kAccentColor,
      textColor: kPrimaryColor),
];
