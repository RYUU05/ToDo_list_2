# Crypto Tracker Mobile App

## About the Application

This mobile application was developed as a cross-platform Flutter project for tracking cryptocurrency prices. The main goal of the app is to allow users to monitor popular cryptocurrencies in USD, view detailed price information, and manage a personal list of favorite coins. The application works on both iOS and Android platforms.

The app includes a secure authentication system, real-time data fetching from an external cryptocurrency API, and cloud-based storage for user preferences.

## What the App Does

Users can track different cryptocurrencies and see their current price in USD. Some popular cryptocurrencies are available by default, but users can also add new coins to the list. For each coin, the app shows the current price as well as the highest and lowest prices for the day. Users can also add selected coins to a personal favorites list for quick access.

To use the application, users must register and verify their email address. After verification, they can log in and access all features of the app.

## Platforms

The application is built with Flutter and is available for both iOS and Android devices.

## Project Architecture

The project follows a structured architecture that separates responsibilities to keep the code clean and maintainable.

Features are organized into separate modules. Each feature contains its own screens and widgets when needed. This approach makes the project easier to scale and understand.

Repositories act as service layers. The authentication repository works with Firebase Authentication, while the crypto coin repository communicates with an external API to retrieve cryptocurrency data.

Routing is handled through a centralized router that stores route names and their corresponding pages. This router is used for navigation when interacting with buttons and UI elements.

An AuthLayout component is used to manage user state. It listens to Firebase authentication changes and decides which screen to load. If the user is logged in, the main page is shown automatically. If not, the login page is displayed.

## Application Pages

The first screen of the application is the login page. From there, users can navigate to the registration page and back. During registration, Firebase sends a verification link to the user’s email address. The user must verify their email before accessing the main features of the app. Sometimes the verification email may appear in the spam folder, so users should check carefully.

After logging in, the user is taken to the main page. This page displays a list of cryptocurrency coins. Users can add a new coin by clicking the plus icon. The list can be refreshed by swiping down, which updates the prices.

When a user selects a coin from the main page, the detail page opens. On this page, users can see the current price of the coin, as well as the highest and lowest prices for that day. From here, a coin can be added to or removed from the personal favorites list.

The favorites page allows users to manage their favorite coins. Favorite data is stored in Firestore, and users can remove coins from the list at any time.

The settings page provides a simple option to log out from the current account.

## Mobile Security

User security and data protection are important aspects of the application. Firebase Authentication is used to handle login and registration securely. User passwords are never stored in the application.

The app does not request access to sensitive device permissions. It does not use the camera, location, or storage of the device.

User favorite lists are stored securely in Firestore. No unnecessary personal data is collected or shared.

## Screenshots

<p align="center">
  <img src="assets/for_doc/login.jpg" width="220" />
  <img src="assets/for_doc/main_page.jpg" width="220" />
  <img src="assets/for_doc/detail_page.jpg" width="220" />
  <img src="assets/for_doc/favorite_list.jpg" width="220" />
  <img src="assets/for_doc/settings.jpg" width="220" />
</p>

## Demo Video

<p align="center">
  <a href="https://github.com/user-attachments/assets/3b5b1d2d-8f8d-4126-8dde-f39cfb11dabc">
    <img src="assets/for_doc/main_page.jpg" width="300" alt="Demo Video Preview" />
  </a>
</p>

## Authors

This application was developed by Nursultan and Mukagali.

Thank you for taking the time to explore our mobile application.

