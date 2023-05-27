class WeatherData {
  double getTemperature() {
    return 72.0;
  }

  double getHumidity() {
    return 60.0;
  }

  double getPressure() {
    return 10.0;
  }

  void measurementsChanged() {
    double temp = getTemperature();
    double humidity = getHumidity();
    double pressure = getPressure();
  }

  // currentConditionDisplayy.update(temp, humidity, pressure);
  // statisticsDisplay.update(temp, humidity, pressure);
  // forecastDisplay.update(temp, humidity, pressure);
}
