enum PizzaState {
  start('start', '재료상태'),
  prepared('prepared', '준비완료'),
  baked('baked', '조리완료'),
  cut('cut', '커팅완료'),
  boxed('boxed', '포장완료'),
  undefined('undefined', '');

  final String code;
  final String displayName;
  const PizzaState(this.code, this.displayName);

  factory PizzaState.getByCode(String code) {
    return PizzaState.values.firstWhere((value) => value.code == code,
        orElse: () => PizzaState.undefined);
  }
}

class Pizza {
  PizzaState state = PizzaState.start;

  void prepare() {
    print('재료를 준비합니다...');
    this.state = PizzaState.prepared;
  }

  void bake() {
    print('피자를 굽습니다...');
    this.state = PizzaState.baked;
  }

  void cut() {
    print('피자를 자릅니다...');
    this.state = PizzaState.cut;
  }

  void box() {
    print('피자를 포장합니다...');
    this.state = PizzaState.boxed;
  }
}

class CheesePizza extends Pizza {}

class GreekPizza extends Pizza {}

class PepperoniPizza extends Pizza {}

class SimplePizzaFactory {
  Pizza createPizza({
    required String pizzaType,
  }) {
    var pizza;
    if (pizzaType == "cheese") {
      pizza = CheesePizza();
    } else if (pizzaType == "greek") {
      pizza = GreekPizza();
    } else if (pizzaType == "pepperoni") {
      pizza = PepperoniPizza();
    }
    return pizza;
  }
}

class PizzaStore {
  SimplePizzaFactory factory;

  PizzaStore({required this.factory});

  Pizza orderPizza(String pizzaType) {
    // 이 부분을 전담으로 마크해줄 객체를 만들어 빼낼 겁니다.
    // 객체 생성을 처리하는 클래스를 팩토리 라고 부릅니다.
    // 일단 simple pizza factory를 만들면 orderPizza 메소드는 새로 만든 객체의 클라이언트가 됩니다.
    // 피자가 필요할 때 마다 피자 하나 만들어 달라고 요청만 보내면 됩니다.
    // if (pizzaType == "cheese") {
    //   pizza = CheesePizza();
    // } else if (pizzaType == "greek") {
    //   pizza = GreekPizza();
    // } else if (pizzaType == "pepperoni") {
    //   pizza = PepperoniPizza();
    // }

    // 팩토리 내의 createPizza를 사용하며 더이상 구상 클래스의 인스턴스를 만들 필요가 없습니다.
    Pizza pizza = factory.createPizza(pizzaType: pizzaType);

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    return pizza;
  }
}

void main() {
  var pizzaStore = PizzaStore(factory: SimplePizzaFactory());
  print(pizzaStore.orderPizza('cheese'));
}
