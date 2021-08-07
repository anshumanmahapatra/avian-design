import '../constants/colors_constant.dart';
import 'package:flutter/material.dart';

class Stats {
  final String title, statsText;
  final Color tabColor, textColor;
  Stats({required this.title, required this.statsText, required this.tabColor, required this.textColor});
}

List<Stats> stats = [
  Stats(title: "CLIENTS", statsText: "30+", tabColor: kPrimaryColor, textColor: kAccentColor),
  Stats(title: "PROJECTS", statsText: "50+", tabColor: kAccentColor, textColor: kPrimaryColor),
  Stats(title: "RETENTION", statsText: "75%", tabColor: kAccentColor, textColor: kPrimaryColor),
  Stats(title: "TEAM", statsText: "15+", tabColor: kPrimaryColor, textColor: kAccentColor),
];

