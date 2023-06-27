abstract class Pizza {
  String name;
  String dough;
  String sauce;
  List<String> toppings = [];

  Pizza({
    required this.name,
    required this.dough,
    required this.sauce,
    List<String>? toppingList,
  }) {
    if (toppingList != null) {
      toppings.addAll(toppingList);
    }
  }

  void prepare() {
    print('피자 주문: $name');
    print('도우 돌리는 중...');
    print('소스 뿌리는 중...');
    print('토핑을 올리는 중...');
    for (var topping in toppings) {
      print('토핑 추가 : $topping');
    }
  }

  void bake() {
    print("175도에서 25분간 조리...");
  }

  void cut() {
    print('피자 커팅...');
  }

  void box() {
    print('피자 포장...');
  }

  String getName() {
    return name;
  }
}

class CheesePizza extends Pizza {
  CheesePizza()
      : super(
          name: '치즈 피자',
          dough: '크러스트 도우',
          sauce: '토마토 소스',
          toppingList: ['잘게 썬 레지아노 치즈'],
        );
}

class NYStyleCheesePizza extends Pizza {
  NYStyleCheesePizza()
      : super(
          name: '뉴욕 치즈 피자',
          dough: '씬 크러스트 도우',
          sauce: '토마토 소스',
          toppingList: ['레지아노 치즈', '모짜렐라 치즈'],
        );
}

class NYStyleVeggiePizza extends Pizza {
  NYStyleVeggiePizza()
      : super(
          name: '뉴욕 베지 피자',
          dough: '씬 크러스트 도우',
          sauce: '토마토 소스',
          toppingList: ['올리브', '상추', '할라피뇨', '치즈'],
        );
}

class NYStylePepperoniPizza extends Pizza {
  NYStylePepperoniPizza()
      : super(
          name: '뉴욕 페페로니 피자',
          dough: '씬 크러스트 도우',
          sauce: '토마토 소스, 렌치 소스',
          toppingList: ['레지아노 치즈', '페페로니'],
        );
}

abstract class PizzaStore {
  Pizza orderPizza(String pizzaType) {
    Pizza pizza;

    pizza = createPizza(
      pizzaType: pizzaType,
    );

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }

  Pizza createPizza({
    required String pizzaType,
  });
}

class NYPizzaStore extends PizzaStore {
  Pizza createPizza({
    required String pizzaType,
  }) {
    var pizza;
    if (pizzaType == "cheese") {
      pizza = NYStyleCheesePizza();
    } else if (pizzaType == "veggie") {
      pizza = NYStyleVeggiePizza();
    } else if (pizzaType == "pepperoni") {
      pizza = NYStylePepperoniPizza();
    }
    return pizza;
  }
}

void main() {
  PizzaStore pizzaStore = NYPizzaStore();
  Pizza bakedPizza = pizzaStore.orderPizza('veggie');
  print('${bakedPizza.getName()} 완성되었습니다');
}
