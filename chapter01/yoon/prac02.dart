// 요청: 오리를 날 수 있게 만들어라
// -> Duck class에 fly() 메소드만 추가하면 모든 오리가 날 수 있겠지?

abstract class Duck {
  void quak() {
    print('Quak Quak');
  }

  void swim() {
    print('I can swim');
  }

  // 새로 추가한 코드
  void fly() {
    print("haha I can fly!!!");
  }

  void display() {}
}

class BlueHeadDuck extends Duck {
  BlueHeadDuck() : super();

  void display() {
    print('I have a blue head!');
  }
}

class RedHeadDuck extends Duck {
  RedHeadDuck() : super();

  void display() {
    print('I have a red head!');
  }
}

class WoodDuck extends Duck {
  WoodDuck() : super();

  void display() {
    print('나는 목각 인형이야');
  }
}

void main() {
  var duck1 = BlueHeadDuck();
  var duck2 = RedHeadDuck();
  var duck3 = WoodDuck();

  void doEveryThing(Duck duck) {
    duck.display();
    duck.quak();
    duck.swim();
    duck.fly();
  }

  doEveryThing(duck1);
  doEveryThing(duck2);
  doEveryThing(duck3);
}


// 결과적으로 날면 안되는 오리에게도 fly()라는 메소드가 상속
// 목각 인형도 날아버림