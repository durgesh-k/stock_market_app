Stock Market App - README
Welcome to the Stock Market App built with Flutter! This app is designed to provide real-time stock updates and supports a voice calling feature for communication between users. This README will guide you through setting up, testing, and using the app, including details about the app's API integrations and usage instructions.

## Table of Contents
App Setup
Running the App
Voice Calling Feature
Payment Testing
Stock APIs
Known Issues
Future Improvements

## App Setup

# 1. Clone the Repository
Start by cloning the repository to your local machine:

git clone https://github.com/your-repo/stock-market-app.git
cd stock-market-app

# 2. Install Dependencies
Make sure that you have Flutter installed on your system. Then, install the required dependencies:

flutter pub get


## Running the App
# 1. Flavors Setup
The app has three flavors configured: QA, Dev, and Prod. You can run the app in any of these flavors by specifying the flavor name.

# 2. Recommended Flavor for Testing (Dev)
To run the app in the Dev flavor (recommended for testing), use the following command:

flutter run --flavor dev lib/main.dart

This will start the app in the Dev flavor and allow you to test the app in a development environment.


## Voice Calling Feature
To test the voice calling functionality, follow the steps below:

# Login as Two Different Users:

User 1 (Bob): Login with the username "Bob".
User 2 (Alice): Login with the username "Alice".

# Initiate the Call:

Bob initiates the call by selecting the audio calling feature and making the payment.
Alice should also make the payment and be on the same screen bob is, i.e audio call screen.


## Payment Testing
For testing payment functionality, follow these steps:

# Choose Payment Method:

Use any payment method to make a payment for the audio call.

# Test Payment Process:

During the payment process, do not complete the payment.
Instead, close the payment app or terminate the payment process.
This action will redirect you back to the app, and after a brief waiting period, you will see the payment success notification (as this uses test credentials).

# Payment Confirmation:

After successful payment, you will be redirected to the audio call screen.
Wait for the other user (Alice/Bob) to complete the payment process.
Once both users are redirected to the same screen, the voice call will be initiated.

## Voice Calling:
Once both users (Bob and Alice) land on the same audio call screen, the call will be established, and both users can communicate in real-time via voice.

## Stock APIs
The app uses two external stock APIs to retrieve stock data:

# AlphaVantage API (for time-series data)

This API provides historical data that is used to plot graphs for stocks.
API rate limits may cause delays in fetching data (since the free tier has a limited number of requests per day - only 25). Please be patient if the API does not load immediately, also if you face the issue, please try reopening the app.

# Finnhub API (for real-time stock price updates)

Used to update stock prices in real-time by querying the /quote endpoint.
Provides current stock prices and is used to keep the app up to date with the latest market information.

## Upstox API
Upstox account verification is in progress during the app development, which takes approximately 4 days. Therefore, the Upstox API and WebSocket functionality cannot be used at the moment.

Once the Upstox account is verified, we will shift to using Upstox WebSocket for real-time stock data updates.


## Known Issues
# AlphaVantage Rate Limits:

The AlphaVantage API has a rate limit, meaning sometimes the data might not load due to API restrictions.
We are using the demo credentials, which might cause hindrances while fetching responses from their API.

# Agora Tokens for Voice Calling:
The Agora tokens used for voice calling are valid only for 24 hours.
Please try to complete the project validation before 7:00 PM on December 30, 2024, as the tokens will expire after that time.

# API Delays:
As the app uses external APIs (AlphaVantage and Finnhub), there might be slight delays in fetching the stock data.

## Future Improvements

# Upstox Integration:
After the verification of the Upstox account, we will integrate their WebSocket API to provide real-time updates for stock prices.
Enhanced Error Handling:

Currently, there may be instances where data fetching fails due to network issues or API rate limits. Future versions will include better error handling and retry mechanisms.


## Conclusion
This app offers real-time stock updates and allows users to make voice calls after completing a payment transaction. While the app currently uses AlphaVantage and Finnhub APIs for stock data, we plan to migrate to Upstox WebSockets once the account verification is complete.

Please note the mentioned limitations regarding the API rate limits and Agora tokens, and complete the validation before the expiration time.

Thank you for trying out the Stock Market App! If you have any questions, feel free to open an issue or contact us directly.
