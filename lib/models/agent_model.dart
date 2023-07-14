class Agent {
  String displayName;
  String developerName;
  String displayIcon;
  List backgroundGradientColors;

  Agent({
    required this.displayName,
    required this.developerName,
    required this.displayIcon,
    required this.backgroundGradientColors,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        displayName: json["displayName"],
        developerName: json["developerName"],
        displayIcon: json["displayIcon"],
        backgroundGradientColors:
            List<String>.from(json["backgroundGradientColors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "developerName": developerName,
        "displayIcon": displayIcon,
        "backgroundGradientColors":
            List<dynamic>.from(backgroundGradientColors.map((x) => x)),
      };
}
