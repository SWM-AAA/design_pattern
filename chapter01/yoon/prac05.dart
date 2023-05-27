abstract class RouteStrategy {
  void buildRoute(int pos1, int pos2);
}

class RoadStrategy implements RouteStrategy {
  void buildRoute(int pos1, int pos2) {
    print("$pos1 에서 $pos2 까지 승용차로 이동합니다.");
  }
}

class WalkingStrategy implements RouteStrategy {
  void buildRoute(int pos1, int pos2) {
    print("$pos1 에서 $pos2 까지 걸어서 이동합니다.");
  }
}

class PublicTransportStrategy implements RouteStrategy {
  void buildRoute(int pos1, int pos2) {
    print("$pos1 에서 $pos2 까지 대중교통으로 이동합니다.");
  }
}

class Navigator {
  RouteStrategy _routeStrategy;

  Navigator({
    required RouteStrategy routeStrategy,
  }) : this._routeStrategy = routeStrategy;

  void buildRoute(int pos1, int pos2) {
    _routeStrategy.buildRoute(pos1, pos2);
  }

  RouteStrategy get routeStrategy => _routeStrategy;

  set routeStrategy(RouteStrategy routeStrategy) {
    _routeStrategy = routeStrategy;
  }
}

void main() {
  var testPosList = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];

  var navigator = Navigator(routeStrategy: RoadStrategy());
  navigator.buildRoute(testPosList[0][0], testPosList[0][1]);

  navigator.routeStrategy = WalkingStrategy();
  navigator.buildRoute(testPosList[1][0], testPosList[1][1]);

  navigator.routeStrategy = PublicTransportStrategy();
  navigator.buildRoute(testPosList[2][0], testPosList[2][1]);
}
