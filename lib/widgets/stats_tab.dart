import 'package:flutter/material.dart';

class StatsTab {
  showStatsTab(BuildContext context, String title, String statsText,
      Color tabColor, Color textColor) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              color: tabColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(statsText, style: const TextStyle(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
