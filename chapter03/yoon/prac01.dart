abstract class Beverage {
  late String description;

  void getDescription() {
    print(description);
  }

  void cost();
}

class HouseBlend extends Beverage {
  HouseBlend(String description) {
    super.description = description;
  }

  @override
  void cost() {
    print('하우스 블렌드 가격은 4000원입니다.');
  }
}

class DarkRoast extends Beverage {
  DarkRoast(String description) {
    super.description = description;
  }

  @override
  void cost() {
    print('다크로스트 가격은 4500원입니다.');
  }
}

class Decaf extends Beverage {
  Decaf(String description) {
    super.description = description;
  }

  @override
  void cost() {
    print('디카페인 가격은 5000원입니다.');
  }
}

class Espresso extends Beverage {
  Espresso(String description) {
    super.description = description;
  }

  @override
  void cost() {
    print('에스프레소 가격은 4000원입니다.');
  }
}

void main() {
  var coffeList = [
    HouseBlend('하우스 블렌드'),
    DarkRoast('다크로스트'),
    Decaf('디카페인'),
    Espresso('에스프레소')
  ];

  coffeList.forEach((element) {
    element.getDescription();
    element.cost();
  });
}
