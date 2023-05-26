abstract class FlyBehavior {
  void fly();
}

class FlyWithWings implements FlyBehavior {
  void fly() {
    print("날개를 펄럭이며 하늘을 날아갑니다.");
  }
}

class FlyNoWay implements FlyBehavior {
  void fly() {
    print("무요! 날 줄 모르는 새 처음봅니까?");
  }
}

class FlyWithRocket implements FlyBehavior {
  void fly() {
    print("로켓 발사!!!!!!!!!");
  }
}

abstract class QuackBehavior {
  void quack();
}

class QuackNormalSound implements QuackBehavior {
  void quack() {
    print('꽥꽥');
  }
}

class QuackDollSound implements QuackBehavior {
  void quack() {
    print('삑~ 삑~');
  }
}

class QuackNoSound implements QuackBehavior {
  void quack() {
    print('난 못 우니까 그만 좀 누르세요!! :(');
  }
}

abstract class Duck {
  FlyBehavior flyBehavior;
  QuackBehavior quackBehavior;

  Duck({
    required this.flyBehavior,
    required this.quackBehavior,
  });

  void quack() {
    quackBehavior.quack();
  }

  void swim() {
    print('I can swim');
  }

  void fly() {
    flyBehavior.fly();
  }

  void display();
}

class BlueHeadDuck extends Duck {
  BlueHeadDuck()
      : super(
          flyBehavior: FlyWithWings(),
          quackBehavior: QuackNormalSound(),
        );

  void display() {
    print('I have a blue head!');
  }
}

class RedHeadDuck extends Duck {
  RedHeadDuck()
      : super(
          flyBehavior: FlyWithWings(),
          quackBehavior: QuackNormalSound(),
        );

  void display() {
    print('I have a red head!');
  }
}

class WoodDuck extends Duck {
  WoodDuck()
      : super(
          flyBehavior: FlyNoWay(),
          quackBehavior: QuackNoSound(),
        );

  void display() {
    print('나는 목각 인형이야');
  }
}

class RubberDuck extends Duck {
  RubberDuck()
      : super(
          flyBehavior: FlyNoWay(),
          quackBehavior: QuackDollSound(),
        );

  void display() {
    print('나는 고무 인형이야');
  }
}

class SimUDuck extends Duck {
  SimUDuck()
      : super(
          flyBehavior: FlyWithRocket(),
          quackBehavior: QuackNormalSound(),
        );

  void display() {
    print('내이름은 심유덕이야');
  }
}

void main() {
  var duckList = [
    BlueHeadDuck(),
    RedHeadDuck(),
    WoodDuck(),
    RubberDuck(),
    SimUDuck(),
  ];

  void doEveryThing(Duck duck) {
    duck.display();
    duck.quack();
    duck.swim();
    duck.fly();
  }

  duckList.forEach((duck) {
    doEveryThing(duck);
  });
}
