class HowWeDo {
  final String imgUrl, title, description;
  HowWeDo(
      {required this.imgUrl, required this.title, required this.description});
}

List<HowWeDo> howWeDo = [
  HowWeDo(imgUrl: "https://static.wixstatic.com/media/ec9816_f186e877669f4e33ac88bcba4aff4b1c~mv2.png/v1/fill/w_122,h_122,al_c,q_85,usm_0.66_1.00_0.01/EMPATHISE.webp", title: "01", description: "EMPATHISE"),
  HowWeDo(imgUrl: "https://static.wixstatic.com/media/ec9816_6b8ffb5b4eb2450fb1ec6e1f2eb59335~mv2.png/v1/fill/w_122,h_122,al_c,q_85,usm_0.66_1.00_0.01/ideate.webp", title: "02", description: "IDEATE"),
  HowWeDo(imgUrl: "https://static.wixstatic.com/media/ec9816_f22b64242d854ddca2045df44f14b127~mv2.png/v1/fill/w_122,h_122,al_c,q_85,usm_0.66_1.00_0.01/PROTOTYPE.webp", title: "03", description: "PROTOTYPE"),
  HowWeDo(imgUrl: "https://static.wixstatic.com/media/ec9816_914495d5e6204b46910bffbfb411619d~mv2.png/v1/fill/w_122,h_122,al_c,q_85,usm_0.66_1.00_0.01/USER-TEST.webp", title: "04", description: "USER-TEST"),
  HowWeDo(imgUrl: "https://static.wixstatic.com/media/ec9816_a89e896ece1249a9bbda543e30fee51c~mv2.png/v1/fill/w_122,h_122,al_c,q_85,usm_0.66_1.00_0.01/RE-ITERATE.webp", title: "05", description: "RE-ITERATE"),
];
