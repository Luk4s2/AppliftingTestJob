abstract class Endpoints {
  String get apiCrewURL;
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
}
