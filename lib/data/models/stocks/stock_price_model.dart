class StockPriceModel {
  final double currentPrice;
  final double change;
  final double percentChange;
  final double highPrice;
  final double lowPrice;
  final double openPrice;
  final double previousClosePrice;
  final int timestamp;

  StockPriceModel({
    required this.currentPrice,
    required this.change,
    required this.percentChange,
    required this.highPrice,
    required this.lowPrice,
    required this.openPrice,
    required this.previousClosePrice,
    required this.timestamp,
  });

  // Factory method to create a StockPriceModel from JSON
  factory StockPriceModel.fromJson(Map<String, dynamic> json, String stock) {
    return StockPriceModel(
      currentPrice:
          (json['c'] != null) ? double.parse(json['c'].toString()) : 0.0,
      change: (json['d'] != null) ? double.parse(json['d'].toString()) : 0.0,
      percentChange:
          (json['dp'] != null) ? double.parse(json['dp'].toString()) : 0.0,
      highPrice: (json['h'] != null) ? double.parse(json['h'].toString()) : 0.0,
      lowPrice: (json['l'] != null) ? double.parse(json['l'].toString()) : 0.0,
      openPrice: (json['o'] != null) ? double.parse(json['o'].toString()) : 0.0,
      previousClosePrice:
          (json['pc'] != null) ? double.parse(json['pc'].toString()) : 0.0,
      timestamp: json['t'] ?? 0, // If timestamp is null, default to 0
    );
  }

  // Method to convert the StockPriceModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'c': currentPrice,
      'd': change,
      'dp': percentChange,
      'h': highPrice,
      'l': lowPrice,
      'o': openPrice,
      'pc': previousClosePrice,
      't': timestamp,
    };
  }
}
