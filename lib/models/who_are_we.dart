class WhoAreWe {
  final String imgUrl, title;

  WhoAreWe({required this.imgUrl, required this.title});
}

List<WhoAreWe> whoAreWe = [
  WhoAreWe(
      imgUrl:
          "https://static.wixstatic.com/media/ec9816_f186e877669f4e33ac88bcba4aff4b1c~mv2.png/v1/fill/w_154,h_147,al_c,q_85,usm_0.66_1.00_0.01/EMPATHISE.webp",
      title: "Collaborators"),
  WhoAreWe(
      imgUrl:
          "https://static.wixstatic.com/media/ec9816_914495d5e6204b46910bffbfb411619d~mv2.png/v1/fill/w_162,h_158,al_c,q_85,usm_0.66_1.00_0.01/USER-TEST.webp",
      title: "Designers"),
  WhoAreWe(
      imgUrl:
          "https://static.wixstatic.com/media/ec9816_6b8ffb5b4eb2450fb1ec6e1f2eb59335~mv2.png/v1/fill/w_146,h_147,al_c,q_85,usm_0.66_1.00_0.01/ideate.webp",
      title: "Thinkers"),
];
