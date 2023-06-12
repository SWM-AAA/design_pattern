enum BeverageSize { TALL, GRANDE, VENTI }

abstract class Beverage {
  String description = "이름없음";
  BeverageSize size = BeverageSize.TALL;
  String getDescription() {
    return '$description(${size.toString().split('.').last})';
  }

  void setBeverageSize(BeverageSize size) {
    this.size = size;
  }

  BeverageSize getBeverageSize() {
    return size;
  }

  int cost();
}

class HouseBlend extends Beverage {
  HouseBlend() {
    super.description = "하우스 블렌디드";
  }

  @override
  int cost() {
    return 4000;
  }
}

class DarkRoast extends Beverage {
  DarkRoast() {
    super.description = "다크로스트";
  }

  @override
  int cost() {
    return 4500;
  }
}

class Decaf extends Beverage {
  Decaf() {
    super.description = "디카페인";
  }

  @override
  int cost() {
    return 5000;
  }
}

class Espresso extends Beverage {
  Espresso() {
    super.description = "에스프레소";
  }

  @override
  int cost() {
    return 4000;
  }
}

abstract class CondimentDecorator extends Beverage {
  late Beverage beverage;
  String getDescription();
}

class Milk extends CondimentDecorator {
  Milk({required Beverage beverage}) {
    super.beverage = beverage;
  }

  @override
  String getDescription() {
    return beverage.getDescription() + " 라떼";
  }

  int cost() {
    if (beverage.getBeverageSize() == BeverageSize.TALL)
      return beverage.cost() + 300;
    else if (beverage.getBeverageSize() == BeverageSize.GRANDE)
      return beverage.cost() + 400;
    else {
      return beverage.cost() + 500;
    }
  }
}

class Mocha extends CondimentDecorator {
  Mocha({required Beverage beverage}) {
    super.beverage = beverage;
  }

  @override
  String getDescription() {
    return '모카 ' + beverage.getDescription();
  }

  @override
  int cost() {
    if (beverage.getBeverageSize() == BeverageSize.TALL)
      return beverage.cost() + 300;
    else if (beverage.getBeverageSize() == BeverageSize.GRANDE)
      return beverage.cost() + 400;
    else {
      return beverage.cost() + 500;
    }
  }
}

class SoyMilk extends CondimentDecorator {
  SoyMilk({required Beverage beverage}) {
    super.beverage = beverage;
  }

  @override
  String getDescription() {
    return beverage.getDescription() + '소이라떼';
  }

  @override
  int cost() {
    return beverage.cost() + 300;
  }
}

class Whip extends CondimentDecorator {
  Whip({required Beverage beverage}) {
    super.beverage = beverage;
  }

  @override
  String getDescription() {
    return '휘핑크림을 얹은 ' + beverage.getDescription();
  }

  @override
  int cost() {
    return beverage.cost() + 300;
  }
}

void main() {
  List<Beverage> coffeList = [
    HouseBlend(),
    DarkRoast(),
    Decaf(),
    Espresso(),
    Milk(beverage: Decaf()),
    Milk(beverage: Mocha(beverage: HouseBlend())),
    Whip(beverage: SoyMilk(beverage: Mocha(beverage: DarkRoast()))),
  ];

  coffeList.forEach((element) {
    if (element is DarkRoast) {
      element.setBeverageSize(BeverageSize.VENTI);
    }
    print(element.getDescription());
    print('${element.getDescription()} 가격은 ${element.cost()}원입니다.');
  });
}
