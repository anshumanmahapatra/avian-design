class Pricing {
  final String title, time, imgUrl, effort, pricePerHour, totalPrice;
  final List<String> description;

  Pricing(
      {required this.title,
      required this.time,
      required this.imgUrl,
      required this.description,
      required this.effort,
      required this.pricePerHour,
      required this.totalPrice});
}

List<Pricing> pricing = [
  Pricing(
      title: "Concept",
      time: "2 Weeks (25 Screens)",
      imgUrl:
          "https://static.wixstatic.com/media/ec9816_b75659cb262940ff902b04b4a7625df5~mv2.jpg/v1/crop/x_493,y_219,w_2487,h_1837/fill/w_306,h_226,al_c,q_80,usm_0.66_1.00_0.01/smartmockups_ka196f64.webp",
      description: [
        "Define Goals",
        "User Personas",
        "User Interviews",
        "Use Case Scenario",
        "Brainstorming",
        "Impact vs Feasibility Analysis",
        "Wireframing",
        "High Fidelity Screens",
        "Responsive Design",
        "Prototype"
      ],
      effort: "100 - 120 Hours",
      pricePerHour: "20 USD/Hour",
      totalPrice: "USD 1,949+"),
  Pricing(
      title: "Startup",
       time: "4 Weeks (100 Screens)",
      imgUrl:
          "https://images.unsplash.com/photo-1557825835-70d97c4aa567?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      description: [
        "User Testing",
        "Journey Mapping",
        "Identifying Pain Points",
        "Brainstorming",
        "Impact vs Feasibility Analysis",
        "Wireframing",
        "High Fidelity Screens",
        "Responsive Design",
        "Prototype"
      ],
      effort: "225 - 300 Hours",
      pricePerHour: "20 USD/Hour",
      totalPrice: "USD 4,499+"),
  Pricing(
      title: "Build to Scale",
       time: "Variable",
      imgUrl:
          "https://static.wixstatic.com/media/ec9816_ab56ed0c9f25445d8b1ee1ad063e5645~mv2.png/v1/fill/w_1349,h_514,al_c,q_90,usm_0.66_1.00_0.01/ec9816_ab56ed0c9f25445d8b1ee1ad063e5645~mv2.webp",
      description: [
        "Define",
        "Empathise",
        "Ideate",
        "Prototype",
        "User Testing",
        "Re-iterate",
        "Final Design",
      ],
      effort: "500+ Hours",
      pricePerHour: "15 USD/Hour",
      totalPrice: "USD 7500+"),
];
