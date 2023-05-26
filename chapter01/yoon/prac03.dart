// fly()를 override해서 아무런 동작도 하지 않게 할 수 있지만
// 비효율적입니다

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
    print("뭐요! 날 줄 모르는 새 처음봅니까?");
  }
}

abstract class Duck {
  FlyBehavior flyBehavior;

  Duck({required this.flyBehavior});

  void quack() {
    print('Quack Quack');
  }

  void swim() {
    print('I can swim');
  }

  void fly() {
    flyBehavior.fly();
  }

  void display() {}
}

class BlueHeadDuck extends Duck {
  BlueHeadDuck()
      : super(
          flyBehavior: FlyWithWings(),
        );

  void display() {
    print('I have a blue head!');
  }
}

class RedHeadDuck extends Duck {
  RedHeadDuck()
      : super(
          flyBehavior: FlyWithWings(),
        );

  void display() {
    print('I have a red head!');
  }
}

class WoodDuck extends Duck {
  WoodDuck()
      : super(
          flyBehavior: FlyNoWay(),
        );

  void display() {
    print('나는 목각 인형이야');
  }
}

class RubberDuck extends Duck {
  RubberDuck()
      : super(
          flyBehavior: FlyNoWay(),
        );

  void display() {
    print('나는 고무 인형이야');
  }

  @override
  void quack() {
    print('삑삑');
  }
}

void main() {
  var duck1 = BlueHeadDuck();
  var duck2 = RedHeadDuck();
  var duck3 = WoodDuck();
  var duck4 = RubberDuck();

  void doEveryThing(Duck duck) {
    duck.display();
    duck.quack();
    duck.swim();
    duck.fly();
  }

  doEveryThing(duck1);
  doEveryThing(duck2);
  doEveryThing(duck3);
  doEveryThing(duck4);
}
