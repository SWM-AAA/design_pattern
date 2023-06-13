class ScienceFacility {
  constructor() {
    this.units = ["사이언스 배슬"];
  }

  getUnits() {
    return this.units;
  }
}

class AddOnDecorator {
  constructor(base) {
    this.base = base;
  }

  getUnits() {
    return [...this.base.getUnits(), ...this.units];
  }
}

class PhysicsLab extends AddOnDecorator {
  constructor(base) {
    super(base);
    this.units = ["배틀 크루져"];
  }
}

class CovertOps extends AddOnDecorator {
  constructor(base) {
    super(base);
    this.units = ["고스트"];
  }
}

let scienceFacility = new ScienceFacility();
console.log(scienceFacility.getUnits()); // ["사이언스 배슬"]

scienceFacility = new PhysicsLab(scienceFacility);
console.log(scienceFacility.getUnits()); // ["사이언스 배슬", "배틀 크루져"]

scienceFacility = new CovertOps(scienceFacility);
console.log(scienceFacility.getUnits()); // ["사이언스 배슬", "배틀 크루져", "고스트"]

const pipe =
  (...fncs) =>
  (x) =>
    fncs.reduce((y, f) => f(y), x);

const scienceFacilityFunc = () => ["사이언스 배슬"];
const physicslab = (base) => [...base, "배틀 크루져"];
const covertOps = (base) => [...base, "고스트"];

console.log("함수에 적용");
console.log(physicslab(scienceFacilityFunc()));
console.log(covertOps(scienceFacilityFunc()));

console.log(pipe(scienceFacilityFunc, physicslab)());
