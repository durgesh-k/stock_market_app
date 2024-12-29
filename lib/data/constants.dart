abstract class Constants {
  static const String alphaVantageApiBase = "https://www.alphavantage.co/";
  static const String finnHubApiBase = "https://finnhub.io/api/v1/";
  //static const String wssBase = "wss://api.upstox.com/v2";
  static const String agoraChannelId = "audioCall";

  static const List<String> otherStocks = ["AAPL", "NIU", "EXCOF"];
}

abstract class ValueKeys {
  static const String tokenKey = "token";
  static const String razorpayKey = "razorpayKey";
  static const String user = "user";
}
