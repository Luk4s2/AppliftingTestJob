abstract class Endpoints {
  String get apiCrewURL;

  String get apiPastLaunchUrl;

  String get apiUpcomingLaunchUrl;
}

/// Class for holding geter for Endpoints
class Environment {
  const Environment._();

  static Endpoints get endpoints => const DevEndpoints();
}

/// Class that holding endpoint URLs
class DevEndpoints implements Endpoints {
  const DevEndpoints();

  @override
  String get apiCrewURL => "https://api.spacexdata.com/v4/crew";

  @override
  String get apiPastLaunchUrl => "https://api.spacexdata.com/v5/launches/past";

  @override
  String get apiUpcomingLaunchUrl =>
      "https://api.spacexdata.com/v5/launches/upcoming";
}
