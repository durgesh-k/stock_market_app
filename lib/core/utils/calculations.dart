abstract class Calculations {
  static double calculatePercentageChange(List<double> stockPrices) {
    if (stockPrices.length > 1) {
      double oldValue = stockPrices[stockPrices.length - 2];
      double newValue = stockPrices[stockPrices.length - 1];

      return ((newValue - oldValue) / oldValue) * 100;
    } else {
      return 0;
    }
  }

  static double calculatePriceChange(List<double> stockPrices) {
    if (stockPrices.length > 1) {
      double oldValue = stockPrices[stockPrices.length - 2];
      double newValue = stockPrices[stockPrices.length - 1];

      return (newValue - oldValue);
    } else {
      return 0;
    }
  }
}
