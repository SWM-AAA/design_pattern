abstract class Duck {
  void quak() {
    print('Quak Quak');
  }

  void swim() {
    print('I can swim');
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

void main() {
  var duck1 = BlueHeadDuck();
  var duck2 = RedHeadDuck();

  duck1.display();
  duck1.quak();
  duck1.swim();

  duck2.display();
  duck2.quak();
  duck2.swim();
}
