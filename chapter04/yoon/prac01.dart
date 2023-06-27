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

Pizza orderPizza(String pizzaType) {
  var pizza;

  if (pizzaType == "cheese") {
    pizza = CheesePizza();
  } else if (pizzaType == "greek") {
    pizza = GreekPizza();
  } else if (pizzaType == "pepperoni") {
    pizza = PepperoniPizza();
  }

  pizza.prepare();
  pizza.bake();
  pizza.cut();
  pizza.box();
  return pizza;

  // 새로운 피자를 추가하고 안팔리는 피자를 지울 때
  // orderPizza의 if else문을 계속해서 수정해주어야 합니다.
  // 즉 가장 문제가 되는 부분은 인스턴스를 만드는 구상 클래스를 선택하는 부분입니다.
}

void main() {
  var pizza = orderPizza('cheese');
  print(pizza.state.displayName);
}
