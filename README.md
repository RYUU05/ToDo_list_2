# Crypto Tracker Mobile App

A cross-platform **Flutter** mobile application for tracking cryptocurrency prices in real time, managing favorites, and securely authenticating users with Firebase.

---

##  Overview

This application allows users to monitor popular cryptocurrencies in **USD**, view detailed price information, and maintain a personalized list of favorite coins. The app is designed with clean architecture principles, secure authentication, and a modern UI.

---

##  Features

-  **User Authentication**
  - Email & password registration
  - Email verification (Firebase Auth)
  - Secure login & logout

-  **Cryptocurrency Tracking**
  - View list of cryptocurrencies
  - Real-time price updates
  - Daily **highest** and **lowest** prices

-  **Favorites Management**
  - Add/remove coins from favorites
  - Favorites stored securely in **Firestore**

-  **Live Updates**
  - Pull-to-refresh to update prices

-  **Settings**
  - Logout from the current account

---

##  Project Architecture

The project follows a **feature-based architecture** for scalability and maintainability.

### 🔹 Features
Each feature contains its own:
- Screens
- Widgets
- Logic

### 🔹 Repositories
Repositories act as service layers:
- **Auth Repository** – handles Firebase Authentication
- **Crypto Coin Repository** – communicates with an external API to fetch cryptocurrency data

### 🔹 Router
A centralized route configuration that maps route names to screens, used for navigation across the app.

### 🔹 AuthLayout
A conditional layout that listens to Firebase authentication state:
- If the user is authenticated → loads the main screen
- If not authenticated → loads the login screen

---

##  App Pages

###  Login / Register
- Entry point of the application
- Users can switch between login and registration
- After registration, a **verification email** is sent (check spam folder if not visible)

###  Main Page
- Displays a list of cryptocurrencies
- Add new coins using the **➕ button**
- Pull down to refresh prices

###  Detail Page
- Shows detailed information about a selected coin:
  - Current price
  - Highest price (24h)
  - Lowest price (24h)
- Add or remove the coin from favorites

###  Favorites Page
- Displays user's favorite cryptocurrencies
- Data stored in **Firestore**
- Coins can be removed from favorites

###  Settings Page
- Logout from the current account

---

##  Mobile Security

### Data Protection
- Authentication handled by **Firebase Auth**
- Passwords are **never stored** in the application

### App Permissions
- No access to sensitive device permissions
- Does **not** use camera, location, or storage

### Privacy
- Only user favorites are stored in Firestore
- No personal data is shared with third parties

---

##  Screenshots

<p align="center">
  <img src="assets/for_doc/login.jpg" width="220" />
  <img src="assets/for_doc/main_page.jpg" width="220" />
  <img src="assets/for_doc/detail_page.jpg" width="220" />
  <img src="assets/for_doc/favorite_list.jpg" width="220" />
  <img src="assets/for_doc/settings.jpg" width="220" />
</p>

---

##  Demo Video

<p align="center">
  <a href="https://github.com/user-attachments/assets/3b5b1d2d-8f8d-4126-8dde-f39cfb11dabc">
    <img src="assets/for_doc/main_page.jpg" width="300" alt="Demo Video Preview"/>
  </a>
</p>

---

##  Tech Stack

- **Flutter**
- **Dart**
- **Firebase Authentication**
- **Cloud Firestore**
- **External Crypto API**

---

##  Authors

- **Nursultan**
- **Mukagali**

---

##  Notes

- Email verification is required before full access
- Internet connection is required to fetch live crypto data

---


