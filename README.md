# Smart Shopping Supermarket App

A modern Flutter-based smart shopping application designed to improve the shopping experience for supermarket customers.

The application allows customers to scan products, view product information, manage their shopping experience, access their loyalty account, and discover supermarket promotions and special offers.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Backend Setup](#backend-setup)
- [Database Setup](#database-setup)
- [API Configuration](#api-configuration)
- [Running the Application](#running-the-application)
- [Customization](#customization)
- [Production Build](#production-build)
- [Troubleshooting](#troubleshooting)
- [License](#license)
- [Support](#support)

---

# Overview

Smart Shopping Supermarket App is a customer-facing mobile application built with Flutter.

The application is designed for supermarkets and retail stores that want to provide their customers with a convenient digital shopping experience.

Customers can use the application while shopping to scan products and access relevant product information. The application can also be used to display supermarket promotions and provide access to customer loyalty functionality.

The Smart Shopping Supermarket App is designed with customization in mind. The application uses a modular and reusable architecture that makes it easy to adapt the app to different supermarkets, brands, and business requirements.

A wide range of visual and functional customizations can be performed without modifying the core application logic. Many common customizations can be done simply by updating the project's configuration and constant files.

Easily Customizable

Depending on your requirements, you can customize:

Application name and branding
Primary and secondary colors
App theme
Logo and application assets
API configuration
Backend URL
Application settings
Text and labels
Default values
Feature-related configuration
Product and shopping settings
Loyalty-related settings
Offers and promotional settings

---

# Features

## Product Scanning

Customers can scan product barcodes using the device camera and access the corresponding product information.

## Product Information

Display information associated with a scanned product, such as:

- Product name
- Product image
- Price
- Description
- Product information

The exact information displayed depends on the data provided by the backend.

## Smart Shopping

The application provides customers with tools designed to make their supermarket shopping experience easier and more convenient.

## Loyalty

Customers can access their loyalty information through their account.

The loyalty system can be extended to support additional functionality such as:

- Loyalty points
- Rewards
- Customer levels
- Loyalty transactions
- Special customer offers

## Special Offers

The application can display supermarket promotions and special offers to customers.

This can be extended to support:

- Discounted products
- Promotional campaigns
- Featured products
- Limited-time offers
- Customer-specific offers

## Customer Authentication

The application includes customer authentication functionality connected to the Laravel backend.

Authentication can be extended according to the requirements of the supermarket.

## Responsive Flutter Interface

The application is built using Flutter and is designed to provide a modern mobile user interface across supported Android devices.

---

# Technology Stack

## Mobile Application

- Flutter
- Dart
- Android

## Backend

- Laravel
- PHP
- REST API

## Database

- MySQL

---

# Project Structure

The Flutter application follows a feature-oriented architecture designed to keep the code organized, reusable, and easy to maintain.

The main application source code is organized as follows:

    lib/
    ├── config/
    ├── constans/
    ├── core/
    ├── features/
    ├── shared/
    └── main.dart

### `config/`

Contains application-level configuration and setup.

This directory can include configuration related to:

- Application environment
- Theme configuration
- Other global application settings

---

### `constans/`

Contains application constants that are reused throughout the project.

Examples include:

- API-related constants
- Application strings
- Storage keys
- Default values
- Configuration values
- Other fixed values

Keeping constants in a dedicated directory helps avoid duplicated values throughout the codebase and makes future changes easier.

---

### `core/`

Contains core functionality and utilities used across multiple features of the application.

This layer is intended for functionality that is not specific to a single screen or feature.

Examples may include:

- Network/API utilities
- Error handling
- Common services
- Application-level helpers
- Base classes
- Shared application logic

---

### `features/`

Contains the main application features and their related implementation.

Each feature can contain the screens, widgets, models, controllers, and other logic required by that feature.

For example:

    features/
    ├── authentication/
    ├── home/
    ├── loyalty/
    ├── scanner/
    ├── offers/
    └── profile/

The exact feature directories depend on the version of the application.

This organization keeps feature-specific code together and makes the application easier to extend.

---

### `shared/`

Contains reusable components that are used by multiple parts of the application.

Examples include:

- Reusable widgets
- Common UI components
- Shared dialogs
- Common layouts
- Reusable components
- Shared utilities

The purpose of this directory is to promote code reuse and avoid unnecessary duplication across features.

---

### `main.dart`

The main entry point of the Flutter application.

It is responsible for initializing and starting the application.

---

## Architecture Overview

The project uses a modular, feature-oriented structure:

    Flutter Application
          │
          ├── config/
          │     └── Application configuration
          │
          ├── constans/
          │     └── Stable constants
          │
          ├── core/
          │     └── Core services and utilities
          │
          ├── features/
          │     └── Feature-specific functionality
          │
          ├── shared/
          │     └── Reusable UI/components
          │
          └── main.dart
                └── Application entry point
---

# Requirements

Before installing the project, make sure the following software is installed:

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- Android SDK
- Android emulator or physical Android device
- PHP
- Composer
- MySQL
- Laravel

It is recommended to use a recent stable version of Flutter and PHP compatible with the Laravel version included in the project.

---

# Installation

## 1. Extract the Project

Extract the purchased ZIP file to your preferred development directory.

Open the Flutter project in Android Studio or Visual Studio Code.

---

## 2. Install Flutter Dependencies

Open a terminal inside the Flutter project directory and run:

    flutter pub get

---

## 3. Configure the Backend URL

Locate the API configuration used by the application.

Update the base URL to point to your Laravel backend, you can find it in lib/config/http.conf.dart.


Replace values according to your server with your local or production server address.


# Backend Setup

The backend is developed using Laravel.

## 1. Install PHP and NodeJS Dependencies

Navigate to the Laravel backend directory:

    cd backend

Then run:

    composer install
    npm install

---

## 3. Generate the Application Key

Run:

    php artisan key:generate

---

## 4. Configure Database

Open the `.env` file and configure your MySQL database:

    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=smart_shopping
    DB_USERNAME=root
    DB_PASSWORD=

Update these values according to your local environment.

---

## 4. Configure Database

Run:

    php artisan jwt:secret

---

# Database Setup

After configuring the database, run:

    php artisan migrate

If a database SQL dump is included with the project, you can alternatively import it into MySQL using your preferred database management tool.

The current backend includes the authentication-related database structure.

Additional supermarket entities can be added according to the requirements of the implementation.

---

# Running the Backend

To start the Laravel development server:

    php artisan serve

By default, Laravel will be available at:

    http://127.0.0.1:8000

The Flutter application should then be configured to use the appropriate API address.

---

# Running the Application

Connect an Android device or start an Android emulator.

Verify that Flutter recognizes the device:

    flutter devices

Then run:

    flutter run

---

# API Configuration

The Flutter application communicates with the Laravel backend through HTTP API requests.

The API base URL should be configured before running the application.

For local Android emulator development:

    http://10.0.2.2:8000

For a physical Android device connected to the same local network, use the local IP address of the computer running Laravel.

For example:

    http://192.168.1.100:8000

For production, use your HTTPS domain:

    https://api.example.com

---

# Customization

The application is designed to be customized for different supermarkets and retail businesses.

Common customization areas include:

## Branding

You can customize:

- Application name
- Logo
- Icons
- Colors
- Typography
- Splash screen
- Images

## Products

The product system can be extended to support:

- Categories
- Brands
- Barcodes
- Product images
- Product descriptions
- Prices
- Stock information
- Product attributes

## Offers

The offers section can be customized to support different promotional strategies.

Examples include:

- Percentage discounts
- Fixed discounts
- Buy-one-get-one promotions
- Featured products
- Seasonal campaigns
- Limited-time offers

## Loyalty

The loyalty functionality can be expanded according to the supermarket's loyalty program.

Possible extensions include:

- Points accumulation
- Points redemption
- Rewards
- Loyalty tiers
- Customer-specific promotions
- Transaction history

---

# Production Build

Before releasing the application to production, make sure that:

- The production API URL is configured.
- HTTPS is enabled.
- Debug mode is disabled.
- Production database credentials are configured.
- API authentication is properly configured.
- Android application signing is configured.

To create a release APK:

    flutter build apk --release

To create an Android App Bundle:

    flutter build appbundle --release

The generated files can be found in the Flutter build directory.

---

# Troubleshooting

## Flutter Dependencies

If dependency errors occur, run:

    flutter clean

Then:

    flutter pub get

And try again:

    flutter run

---

## API Connection Problems

If the application cannot connect to the Laravel backend, verify:

1. Laravel is running.
2. The API URL is correct.
3. The Android emulator uses `10.0.2.2` instead of `localhost`.
4. The device and development computer are connected to the same network when using a physical device.
5. The required API routes are available.
6. Firewall settings are not blocking the connection.

---

## Database Problems

Verify that:

- MySQL is running.
- The database exists.
- The `.env` database credentials are correct.
- Laravel migrations have been executed.

You can check the Laravel configuration using:

    php artisan config:clear

---

# Future Extensions

The architecture can be extended to support a complete supermarket ecosystem, including:

- Product management
- Category management
- Multiple supermarket branches
- Advanced loyalty programs
- Loyalty transactions
- Advanced promotional campaigns
- Shopping lists
- Digital shopping carts
- Customer-specific offers
- Push notifications
- Admin dashboard
- Staff management
- Analytics
- Inventory integration
- POS integration
- Online ordering
- Payment integration

These extensions are not necessarily included in the current version and can be implemented according to the buyer's requirements.

---

# License

This software is provided under the license and usage terms specified by the marketplace from which it was purchased.

Please review the applicable marketplace license before using, modifying, or redistributing the source code.

Redistribution or resale of the original source code as a standalone product may be restricted by the applicable license.

---

# Support

Before requesting support, please make sure that:

1. Flutter dependencies have been installed.
2. The Laravel backend has been configured.
3. The database connection is working.
4. The API URL is correct.
5. The project is being used with a supported development environment.

When reporting an issue, provide:

- Flutter version
- Dart version
- Android version
- PHP version
- Laravel version
- Error message
- Relevant logs
- Steps to reproduce the issue

This information will help identify and resolve problems more efficiently.

---

# Credits

Developed with Flutter and Laravel.

Thank you for purchasing the Smart Shopping Supermarket App.