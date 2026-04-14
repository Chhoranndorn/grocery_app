# 🛒 Grocery App (Flutter)

A modern **E-commerce Grocery App** built with Flutter, using GetX for state management and clean architecture principles.

---

## 📱 Overview

**Grocery App** is a mobile application that allows users to:

- Browse grocery products 🥦
- Add items to cart 🛒
- Manage orders 📦
- Authenticate via email & OTP 🔐
- Manage user profile 👤

This project is designed with scalability and maintainability in mind.

---

## ⚙️ Tech Stack

- **Flutter**: 3.41.0
- **State Management**: GetX
- **Architecture**: MVC / Clean Architecture (modular structure)
- **Networking**: Dio (ready for API integration)
- **Language**: Dart

---

## 📂 Project Structure

lib/
├── core/ # Constants, utils, DI, enums
├── controller/ # GetX controllers
├── data/ # Repository, models, API layer
├── modules/ # UI screens (feature-based)
├── helper/ # Routes & helpers
├── bindings/ # GetX bindings
└── main.dart # App entry point

---

## 🚀 Features

- 🔐 Authentication (Login / OTP Verification)
- 📲 OTP resend timer system
- 🏠 Home screen (product listing)
- 🛍 Cart management
- 📦 Order tracking (future scope)
- 🌍 Location selection
- ⚡ Fast and responsive UI
- 🧠 Clean GetX architecture

---

## 🧠 State Management

This project uses **GetX** for:

- Dependency Injection (Bindings)
- Reactive State Management (Obx)
- Route Management
- Controller lifecycle handling

---

## 🔌 API Layer

- Repository pattern used for abstraction
- Mock API implemented for development
- Ready for integration with **Dio HTTP client**

---

## 📦 Installation

```bash
git clone https://github.com/your-username/grocery_app.git
cd grocery_app
flutter pub get
flutter run
🧪 Environment
Flutter SDK: 3.41.0
Dart SDK: Latest stable
Platform: Android / iOS
📸 Screenshots

Add app screenshots here

/screenshots/login.png
/screenshots/home.png
/screenshots/cart.png
📌 Roadmap
 Authentication (Login + OTP)
 GetX Architecture Setup
 Product listing (API integration)
 Cart system
 Payment gateway
 Order tracking
 Admin panel (future)
🤝 Contribution

Pull requests are welcome. For major changes, please open an issue first.

📄 License

This project is licensed under the MIT License.

👨‍💻 Developer

Built with ❤️ using Flutter by Luffy
```
