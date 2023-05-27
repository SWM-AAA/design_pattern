import 'dart:math';

abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

class WeatherData implements Subject {
  List<Observer> observers;
  double temperature = 70.0;
  double humidity = 60.0;
  double pressure = 29.2;

  WeatherData({
    List<Observer>? observers,
  }) : this.observers = observers ?? [];

  void registerObserver(Observer observer) {
    observers.add(observer);
  }

  void removeObserver(Observer observer) {
    observers.remove(observer);
  }

  void notifyObservers() {
    observers.forEach((observer) {
      observer.update();
    });
  }

  void measurementsChanged() {
    notifyObservers();
  }

  void setMeasurements({
    required double temperature,
    required double humidity,
    required double pressure,
  }) {
    this.temperature = temperature;
    this.humidity = humidity;
    this.pressure = pressure;
    measurementsChanged();
  }

  double getTemperature() {
    return temperature;
  }

  double getHumidity() {
    return humidity;
  }

  double getPressure() {
    return pressure;
  }
}

abstract class Observer {
  void update();
}

abstract class DisplayElement {
  void display();
}

class CurrentConditionsDisplay implements Observer, DisplayElement {
  double temperature = 0.0;
  double humidity = 0.0;
  late WeatherData weatherData;

  CurrentConditionsDisplay({required WeatherData weatherData}) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  void update() {
    this.temperature = weatherData.getTemperature();
    this.humidity = weatherData.getHumidity();
    display();
  }

  void display() {
    print("현재 상태: 온도 $temperature F, 습도 $humidity %");
  }
}

class StatisticsDisplay implements Observer, DisplayElement {
  double meanTemp = 0.0;
  double maxTemp = -double.infinity;
  double minTemp = double.infinity;
  int count = 0;
  late WeatherData weatherData;

  StatisticsDisplay({required WeatherData weatherData}) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  void update() {
    var temp = weatherData.getTemperature();
    this.count += 1;
    this.meanTemp = (this.meanTemp + temp) / count;
    this.maxTemp = max(this.maxTemp, temp);
    this.minTemp = min(this.minTemp, temp);
    display();
  }

  void display() {
    // 평균, 최저, 최고 온도 값 표시
    print("평균/최고/최저 온도 = $meanTemp/$maxTemp/$minTemp");
  }
}

class ForecastDisplay implements Observer, DisplayElement {
  double currentPressure = 29.92;
  late double lastPressure;
  late WeatherData weatherData;

  ForecastDisplay({required WeatherData weatherData}) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  void update() {
    lastPressure = currentPressure;
    currentPressure = weatherData.getPressure();
    display();
  }

  void display() {
    // 기상 예보
    var result = "기상예측: ";
    if (currentPressure > lastPressure) {
      result += "날씨가 좋아지고 있습니다!";
    } else if (currentPressure == lastPressure) {
      result += "변함이 없습니다";
    } else if (currentPressure < lastPressure) {
      result += "우산을 챙기세요. 비가 올겁니다.";
    }
    print(result);
  }
}

class HeatIndexDisplay implements Observer, DisplayElement {
  late WeatherData weatherData;
  late double t;
  late double rh;

  HeatIndexDisplay({required WeatherData weatherData}) {
    this.weatherData = weatherData;
    weatherData.registerObserver(this);
  }

  void update() {
    t = weatherData.getTemperature();
    rh = weatherData.getHumidity();
    display();
  }

  void display() {
    // 측정값에 기반한 내용 표시
    // 추후 추가되는 새로운 디스플레이
    var heatIndex = ((16.923 + (0.185212 * t)) +
        (5.37941 * rh) -
        (0.100254 * t * rh) +
        (0.00941695 * (t * t)) +
        (0.00728898 * (rh * rh)) +
        (0.000345372 * (t * t * rh)) -
        (0.000814971 * (t * rh * rh)) +
        (0.0000102102 * (t * t * rh * rh)) -
        (0.000038646 * (t * t * t)) +
        (0.0000291583 * (rh * rh * rh)) +
        (0.00000142721 * (t * t * t * rh)) +
        (0.000000197483 * (t * rh * rh * rh)) -
        (0.0000000218429 * (t * t * t * rh * rh)) +
        (0.000000000843296 * (t * t * rh * rh * rh)) -
        (0.0000000000481975 * (t * t * t * rh * rh * rh)));

    print("체감 온도: ${(heatIndex * 10000).round() / 10000}");
  }
}

class ThirdPartyDisplay implements Observer, DisplayElement {
  void update() {}
  void display() {
    // 측정값에 기반한 내용 표시
    // 추후 추가되는 새로운 디스플레이
  }
}

void main() {
  WeatherData weatherData = WeatherData();

  CurrentConditionsDisplay currentDisplay = CurrentConditionsDisplay(
    weatherData: weatherData,
  );

  StatisticsDisplay statisticsDisplay = StatisticsDisplay(
    weatherData: weatherData,
  );

  ForecastDisplay forecastDisplay = ForecastDisplay(
    weatherData: weatherData,
  );

  HeatIndexDisplay heatIndexDisplay =
      HeatIndexDisplay(weatherData: weatherData);

  weatherData.setMeasurements(
    temperature: 80,
    humidity: 65,
    pressure: 30.4,
  );
  weatherData.setMeasurements(
    temperature: 82,
    humidity: 70,
    pressure: 29.2,
  );
  weatherData.setMeasurements(
    temperature: 78,
    humidity: 90,
    pressure: 29.2,
  );
}
