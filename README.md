# SaveBite 🥦
### Smart Pantry Management to Reduce Food Waste, Save Money, and Protect the Planet

SaveBite is a food inventory and pantry management application designed to help individuals track the food they own, monitor expiration dates, and make better decisions about food consumption. By making pantry contents easier to manage, SaveBite aims to reduce avoidable food waste, save money, and encourage more sustainable everyday habits.

The application is built with **Flutter and Dart**, with a **Serverpod backend** for server-side functionality and data management. It is designed to support a practical, user-friendly experience, with room for future enhancements such as smart meal recommendations, consumption analytics, and AI-powered food waste prevention.

---

## 📌 Table of Contents

- [The Problem](#-the-problem)
- [Our Solution](#-our-solution)
- [Key Features](#-key-features)
- [Technology Stack](#-technology-stack)
- [System Architecture](#-system-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Running the Application](#-running-the-application)
- [How to Use SaveBite](#-how-to-use-savebite)
- [Food Waste and Sustainability Impact](#-food-waste-and-sustainability-impact)
- [Testing and Code Quality](#-testing-and-code-quality)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [Limitations](#-limitations)
- [License](#-license)
- [Project Information](#-project-information)

---

## 🌍 The Problem

Food waste is an environmental, economic, and social challenge. Food often gets discarded because people forget what they have, overlook expiration dates, buy duplicate products, or fail to use ingredients before they deteriorate.

Common challenges include:

- **Limited visibility:** People do not always know what is available in their pantry or refrigerator.
- **Missed expiration dates:** Perishable products may expire before people remember to use them.
- **Unnecessary spending:** Food is purchased again even when similar items are already available.
- **Avoidable waste:** Food that could have been consumed is thrown away.
- **Limited awareness:** People may not understand the potential financial and environmental consequences of discarded food.

A practical food management tool should make it easier to understand what is available, identify what needs attention, and act before food goes to waste.

## 💡 Our Solution

SaveBite provides a digital pantry where users can record food items, quantities, storage locations, expiration dates, and optional cost information.

The application organizes pantry information into an actionable view, helping users identify items that need attention and track what they consume or discard.

SaveBite focuses on three goals:

1. **Prevent waste:** Make food approaching expiration easier to identify.
2. **Save money:** Help users make better use of food they have already purchased.
3. **Support sustainability:** Encourage more responsible food consumption habits.

The long-term vision is to evolve SaveBite into a personalized food management assistant that combines pantry tracking, meal planning, intelligent reminders, and measurable waste reduction.

---

## ✨ Key Features

### 1. Digital Pantry Inventory

Maintain a structured list of food items in one place.

Users can record information such as:

- Food name
- Food category
- Quantity and unit
- Storage type
- Expiration date
- Optional purchase cost
- Optional notes

This provides a clear overview of the food available at home.

### 2. Expiration Date Awareness

SaveBite uses expiration dates to help users prioritize food items.

The pantry interface can present urgency indicators and expiration-related labels to make it easier to identify items that need attention.

This supports a simple principle: **use food that needs attention before it becomes waste.**

*Note: Expiration dates entered by users are tracking information, not a food-safety determination. Always follow product labeling and appropriate food-safety guidance.*

### 3. Food Consumption Tracking

Users can mark pantry items as consumed instead of leaving them in the active inventory.

This separates active pantry items from consumed food and provides a foundation for understanding consumption habits.

### 4. Food Waste Tracking

Users can mark items as wasted, helping distinguish discarded food from food that was successfully consumed.

Waste tracking can support future reporting on:

- The types of food most frequently discarded
- Potential financial losses
- Common expiration-related waste patterns
- Opportunities to improve shopping and consumption habits

### 5. Add, Edit, and Delete Items

The pantry interface supports inventory management through item creation, editing, and deletion.

Users can update quantities, categories, storage information, expiration dates, and optional cost details as their pantry changes.

### 6. Search and Filtering

The pantry screen includes search and filtering capabilities to help users find and manage active items more easily.

These capabilities make the inventory more useful as the number of recorded products grows.

### 7. Estimated Savings and Waste Indicators

SaveBite includes pantry-level indicators intended to communicate the financial and environmental value of better food management.

Where the application uses recorded food costs or estimated environmental factors, these values should be interpreted as estimates rather than independently verified measurements.

### 8. Demo Data

Sample pantry data allows users to explore the application without having to enter every item from scratch.

The demo inventory includes example foods such as yogurt, spinach, sourdough bread, chicken, bananas, almond milk, avocado, and strawberries.

Demo data is intended for demonstration and testing. It should not be confused with a user's actual food inventory.

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform user interface |
| Dart | Application programming language |
| Material Design | UI components and visual consistency |
| Riverpod | Application state management |
| Serverpod | Dart backend framework and client-server communication |
| Serverpod Client | Communication between the Flutter app and backend |
| `intl` | Formatting dates, numbers, and currency |
| Git and GitHub | Source control and project collaboration |

The project is organized into application features, reusable widgets, shared utilities, theme configuration, and backend/client components.

---

## 🏗️ System Architecture

SaveBite follows a client-server architecture.

```text
┌─────────────────────────────────┐
│        Flutter Application      │
│                                 │
│  Pantry Screen                  │
│  Item Management Dialogs        │
│  Pantry Item Cards              │
│  Search and Inventory UI        │
└────────────────┬────────────────┘
                 │
                 ▼
┌─────────────────────────────────┐
│       Riverpod State Layer      │
│                                 │
│  Pantry State                   │
│  Inventory Operations            │
│  Demo Data / Loading / Errors   │
└────────────────┬────────────────┘
                 │
                 ▼
┌─────────────────────────────────┐
│        Serverpod Client         │
│                                 │
│  API Requests                   │
│  Authentication Integration     │
│  Backend Communication          │
└────────────────┬────────────────┘
                 │
                 ▼
┌─────────────────────────────────┐
│         Serverpod Server        │
│                                 │
│  API Endpoints                  │
│  Application Services           │
│  Database Integration           │
└─────────────────────────────────┘
```

The diagram illustrates the intended application architecture. Actual persistence and authentication behavior depend on the backend configuration and successful connection to the running Serverpod services.

### Application state

The pantry state layer manages inventory data and UI-related information, including loading status, search state, filters, and item groupings.

### Backend integration

The Flutter application initializes a Serverpod client using a configurable server URL. The client can communicate with backend endpoints when the server is running and the required configuration is correct.

### Demo mode

Sample data provides an accessible demonstration path. Demo operations should not be assumed to persist to the backend or synchronize across devices.

---

## 📁 Project Structure

The repository contains the following main components:

```text
savebite/
├── savebite_flutter/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── client.dart
│   │   ├── core/
│   │   │   ├── theme/
│   │   │   │   └── app_theme.dart
│   │   │   └── utils/
│   │   │       └── urgency_helper.dart
│   │   └── features/
│   │       ├── pantry/
│   │       │   ├── data/
│   │       │   │   └── sample_pantry_data.dart
│   │       │   └── presentation/
│   │       │       ├── pantry_screen.dart
│   │       │       ├── providers/
│   │       │       │   └── pantry_provider.dart
│   │       │       └── widgets/
│   │       │           ├── add_edit_item_dialog.dart
│   │       │           └── pantry_item_card.dart
│   │       └── meals/
│   │           └── presentation/
│   │               └── providers/
│   │                   └── meals_provider.dart
│   └── pubspec.yaml
├── savebite_client/
├── savebite_server/
├── pubspec.yaml
├── .gitignore
└── README.md
```

*Note: This is a guide to the expected main components. Your repository may contain additional files or generated code.*

### Main components

- `main.dart`: Application entry point and Flutter app configuration.
- `client.dart`: Serverpod client initialization.
- `app_theme.dart`: Shared application styling.
- `urgency_helper.dart`: Expiration urgency, category, and storage-related helper functions.
- `sample_pantry_data.dart`: Example pantry inventory for demonstration.
- `pantry_provider.dart`: Pantry state and inventory operations.
- `pantry_screen.dart`: Main pantry interface.
- `add_edit_item_dialog.dart`: Form for creating and editing food items.
- `pantry_item_card.dart`: Reusable widget for displaying an inventory item.
- `savebite_client/`: Serverpod client package.
- `savebite_server/`: Serverpod backend project.

---

## 🚀 Getting Started

### Prerequisites

Install the following tools before running the project:

- [Git](https://git-scm.com/)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) — included with Flutter
- A supported browser, such as Chrome
- [Serverpod documentation](https://docs.serverpod.dev/) for backend setup

For the development environment used during implementation, Flutter 3.47.7 and Dart 3.13.5 were installed.

Check your installed versions:

```bash
flutter --version
dart --version
git --version
```

### 1. Clone the repository

Replace `YOUR-USERNAME` with the GitHub account or organization that owns the repository.

```bash
git clone https://github.com/YOUR-USERNAME/savebite.git
cd savebite
```

### 2. Install dependencies

Enter the Flutter application directory:

```bash
cd savebite_flutter
flutter pub get
```

If you are using the workspace's root-level Dart configuration, follow the dependency instructions associated with that configuration as well.

### 3. Configure the backend URL

The Flutter application uses a `SERVER_URL` compile-time definition to configure the Serverpod API endpoint.

For a local development backend, the URL used in this project is:

```text
http://localhost:8180/
```

The Flutter client must be able to reach the configured backend. If the backend is unavailable, authenticated server operations may fail.

Do not commit passwords, API keys, private credentials, or production secrets to the repository.

---

## ▶️ Running the Application

### Option A: Run in a browser

From the repository root, enter the Flutter app directory:

```bash
cd savebite_flutter
```

Run the app using Flutter's web-server device:

```bash
flutter run -d web-server \
  --web-hostname 127.0.0.1 \
  --web-port 8081 \
  --dart-define=SERVER_URL=http://localhost:8180/
```

On Windows Command Prompt, the equivalent command can be written on one line:

```bat
flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8081 --dart-define=SERVER_URL=http://localhost:8180/
```

Open the URL displayed by Flutter, normally:

http://127.0.0.1:8081

The local backend should be started separately using the Serverpod project's configured development commands.

**Important:** `127.0.0.1` and `localhost` refer to the machine or environment running the browser/client. For a deployed website, the backend URL must be changed to a reachable deployed endpoint and configured for the relevant security requirements.

### Option B: Run on a connected device

List available Flutter devices:

```bash
flutter devices
```

Then run the application on a listed device, for example:

```bash
flutter run -d chrome
```

The exact device identifier may differ depending on your setup.

### Analyze the code

Run:

```bash
flutter analyze
```

The pantry implementation was analyzed during development with no remaining analyzer issues at that point. Re-run the command after making changes to verify the current checkout.

---

## 📖 How to Use SaveBite

### Step 1: Open the pantry

Launch the app and navigate to the pantry screen.

### Step 2: Review the inventory

Explore the sample food inventory and its expiration information. Identify items that may need attention.

### Step 3: Add food

Use the **Add food** action to create a pantry item. Enter the name, category, quantity, unit, storage type, expiration date, and any optional cost or notes.

### Step 4: Update items

Edit an existing entry when its quantity, storage information, or expiration date changes.

### Step 5: Track consumption

When an item has been used, mark it as consumed. This removes it from the active inventory and records its status within the application's state or backend workflow, depending on the current mode.

### Step 6: Record wasted food

If food is discarded, mark it as wasted instead of consumed. This helps distinguish successful consumption from food loss.

### Step 7: Review pantry indicators

Use the search, filters, and available summary indicators to understand the current inventory and prioritize items that need attention.

---

## 🌱 Food Waste and Sustainability Impact

SaveBite aims to help users make more informed decisions about food they have already purchased.

Potential benefits include:

- Less food forgotten in the refrigerator or pantry
- Better visibility of food approaching expiration
- Fewer unnecessary duplicate purchases
- Improved household food budgeting
- More awareness of food consumption and disposal patterns

### Measuring impact responsibly

A future production version could measure impact using real user data, including:

- Weight of food consumed before spoilage
- Weight of food discarded
- Estimated purchase value of discarded food
- Estimated cost of food saved from waste
- Estimated greenhouse-gas emissions avoided

Any financial or environmental impact figure should be based on documented assumptions and reliable conversion factors. The current demo's estimates should not be presented as independently verified environmental outcomes.

---

## 🧪 Testing and Code Quality

The project uses Flutter and Dart tooling to help maintain code quality.

### Static analysis

```bash
flutter analyze
```

### Automated tests

Run available Flutter tests from the application directory:

```bash
flutter test
```

The command may report that no tests are available if test files have not yet been created.

### Recommended test coverage

As the project develops, tests should cover:

- Adding a pantry item
- Editing item details
- Handling missing or invalid input
- Marking items as consumed
- Marking items as wasted
- Deleting items
- Expiration urgency calculations
- Search and filtering behavior
- Backend errors and unavailable connections
- Demo-mode versus authenticated behavior

---

## 🗺️ Roadmap

The following items are potential future enhancements, not claims that these capabilities are already implemented.

### Phase 1 — Core pantry experience

- [x] Flutter application structure
- [x] Pantry inventory interface
- [x] Add and edit item dialog
- [x] Consumed and wasted item actions
- [x] Expiration-related indicators
- [x] Sample pantry data
- [x] Initial static analysis

### Phase 2 — Reliable data management

- [ ] Verify persistent storage for all pantry operations
- [ ] Complete and test authenticated user workflows
- [ ] Add automated unit and widget tests
- [ ] Improve error handling and loading states
- [ ] Validate behavior across browser and mobile devices

### Phase 3 — Smarter food management

- [ ] Notifications for food approaching expiration
- [ ] Barcode scanning for faster item entry
- [ ] Shopping list integration
- [ ] Consumption history and waste reports
- [ ] Household or family pantry sharing

### Phase 4 — AI-assisted food waste prevention

- [ ] Meal suggestions based on available ingredients
- [ ] Prioritization of ingredients nearing expiration
- [ ] Personalized shopping recommendations
- [ ] Demand and consumption pattern analysis
- [ ] Explainable estimates of financial and environmental impact

These features should be implemented and validated before being advertised as available capabilities.

---

## 🤝 Contributing

Contributions, ideas, bug reports, and feedback are welcome.

A suggested contribution workflow:

1. Fork the repository.
2. Create a feature branch.
3. Implement and test your changes.
4. Run `flutter analyze`.
5. Run relevant tests.
6. Submit a pull request describing the change.

Please avoid including secrets, private user data, database exports, or production credentials in commits and issue reports.

---

## 🔐 Security and Privacy

SaveBite is intended to handle personal pantry and consumption information responsibly.

Before deploying the application for real users:

- Use HTTPS for production API communication.
- Keep credentials and secrets outside source control.
- Validate inputs on the server as well as the client.
- Apply appropriate authentication and authorization to user-specific records.
- Ensure users cannot access other users' pantry data.
- Define appropriate data retention and deletion policies.
- Review dependency vulnerabilities and update packages as needed.

The current development configuration is not, by itself, a production security guarantee.

---

## ⚠️ Limitations

SaveBite is under active development.

- Sample pantry data is for demonstration and is not a verified real-world inventory.
- Local demo operations may not persist across restarts.
- Backend persistence and synchronization require the backend to be configured and running correctly.
- Financial and environmental estimates depend on their formulas and input data.
- Food expiration tracking does not replace food-safety guidance.
- Future AI, notification, barcode, and recommendation features should not be considered available until implemented and tested.

---

## 📄 License

No license has been specified yet. Until a license is added, the source code remains subject to applicable copyright law, and reuse permissions should not be assumed.

If you intend to make the project open source, consider selecting an appropriate license and adding a `LICENSE` file.

---

## 👨‍💻 Project Information

**Project:** SaveBite  
**Category:** Sustainability, Food Waste Reduction, Flutter Application  
**Client:** Flutter / Dart  
**Backend:** Serverpod  
**Status:** Development prototype

### Project links

- **GitHub Repository:** `https://github.com/YOUR-USERNAME/savebite`
- **Live Demo:** Add your deployed application URL when available.
- **Demo Video:** Add your video URL when available.

### Project vision

SaveBite aims to make food management simpler, more visible, and more sustainable. By helping people understand what they own, prioritize what needs to be used, and learn from their consumption habits, the project seeks to turn everyday pantry management into a practical opportunity to reduce waste.

**Use what you have. Waste less. Save more.**

---

*Built with Flutter and Serverpod, with sustainability at its core.*
