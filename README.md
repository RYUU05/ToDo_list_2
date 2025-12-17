Crypto Tracker Mobile App

Overview

This mobile application is a cross-platform project built with Flutter and designed for tracking cryptocurrency prices. The main purpose of the app is to help users monitor the prices of popular cryptocurrencies in USD, view detailed daily price information, and manage a personal list of favorite coins. The application works on both iOS and Android devices.
The app includes user authentication, real-time data loading from an external cryptocurrency API, and cloud storage for saving user preferences.

Application Functionality

Users can track multiple cryptocurrencies and see their current prices in USD. Some well-known coins are available by default, but users can also add other cryptocurrencies manually. For each coin, the app displays the current price as well as the highest and lowest values for the current day.
Users can mark selected coins as favorites to access them more quickly later. To use the application, users must register and confirm their email address. After successful verification, full access to the app becomes available.

Supported Platforms

The application is developed using Flutter and supports both iOS and Android mobile platforms.

Project Architecture

The project uses a clear and organized architecture to keep the code readable and easy to maintain.
The application is divided into feature-based modules. Each feature contains its own screens and widgets when needed, which makes the project easier to understand and scale in the future.
Repositories act as service layers in the project. The authentication repository works with Firebase Authentication, while the cryptocurrency repository communicates with an external API to retrieve price data.
Navigation inside the app is handled using a centralized router that stores route names and their corresponding screens. This router is used throughout the application when interacting with buttons and UI elements.
The AuthLayout component manages the user’s authentication state. It listens for changes in Firebase Authentication and decides which screen should be shown. If the user is logged in, the main page is displayed automatically; otherwise, the login screen is shown.

Application Pages

The first screen users see is the login page. From there, they can navigate to the registration page and return if needed. During registration, Firebase sends a verification link to the user’s email address. Email verification is required before accessing the main features of the app. In some cases, the verification email may appear in the spam folder.
After logging in, users are taken to the home page, where a list of cryptocurrencies is displayed. New coins can be added using the plus button, and the list can be refreshed by swiping down to load updated prices.
When a user selects a coin from the list, a details page opens. This page shows the current price of the coin along with its daily high and low values. From this screen, users can add or remove the coin from their favorites list.

Favorites Page

The favorites page allows users to manage their selected favorite coins. This data is stored in Firestore, and users can remove coins from the list at any time.
The settings page provides a simple option to log out of the current account.

Mobile Security

User security and data protection were considered throughout the development process. Firebase Authentication is used to securely handle user registration and login. User passwords are never stored within the application.
The app does not request access to sensitive device permissions such as camera, location, or storage. Favorite coin data is stored securely in Firestore, and no unnecessary personal information is collected or shared.