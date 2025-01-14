# 🛍️ Kwaju Africa - Flutter Technical Assessment

## 📱 Project Overview
This project demonstrates implementation of two UI pages in Flutter, focusing on product display and API integration. The assessment showcases proper state management, API handling, and modern UI design.

![Flutter Version](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Dart Version](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## ✨ Features

### 🏠 Home Screen
- Displays featured products fetched from the API
- Implements horizontal scrollable categories
- Search functionality
- Clean and intuitive UI design

### 📦 Products Screen
- Dynamic product filtering based on:
  - Categories
  - Subcategories
  - Types
  - Brands
- Responsive grid layout for product display
- Error handling and loading states

## 🔧 Technical Implementation

### API Integration
The project integrates with 3 key APIs:

#### 1. Featured Products API
- No input parameters required
- Handles response data to display featured products
- Implements error handling and loading states

#### 2. Brand Variants API
- Required Parameters:
  ```json
  {
    "category_id": "UUID",
    "sub_category_id": "UUID",
    "type_id": "UUID",
    "brand_id": "UUID"
  }
  ```
- Implements parameter validation
- Handles API responses and errors appropriately

#### 3. Category Tree API
- Retrieves hierarchical category structure
- No input parameters required
- Response includes:
  - Categories
  - Subcategories
  - Types
  - Brands
- Handles nested data structure efficiently

### 🏗️ Architecture
- Implements GetX for state management
- Uses repository pattern for API calls
- Follows clean architecture principles

## 🎯 Key Features Implemented

### Error Handling
- Network error handling
- API error responses
- Timeout handling
- User-friendly error messages

### State Management
- Loading states
- Error states
- Empty states
- Data states

### UI Components
- Custom widgets for reusability
- Responsive design
- Smooth animations
- Proper spacing and layout

### Error Handling Strategy
```dart
try {
  // API calls with proper timeout
  await apiCall().timeout(Duration(seconds: 30));
} on SocketException {
  // Network error handling
} on TimeoutException {
  // Timeout handling
} catch (e) {
  // General error handling
}
```


## 🚀 Getting Started

1. Clone the repository:
```bash
git clone https://github.com/nalugala-vc/KwajuAfrica
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📝 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6  # State management
  http: ^0.13.5  # API calls
  heroicons: ^0.11.0 # Appealing icons
  google_fonts: ^6.2.1 #Appealing fonts
```

## 🎨 Screenshots
[Add screenshots of your implementation here]
<img src='https://github.com/nalugala-vc/HabitQuest/blob/main/vid1.gif' title='Video Walkthrough' alt='Video Walkthrough' />
## 🤝 Assignment Requirements Met

✅ Implemented two UI pages
✅ Integrated Featured Products API
✅ Implemented Brand Variants API with proper validation
✅ Added error handling and loading states
✅ Created responsive and user-friendly interface
✅ Followed Flutter best practices

## 📫 Contact

For any queries regarding this assessment, please reach out at:
- Email: vanessachebukwa@gmail.com
- Phone: +254 75989 0740

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

<div align="center">
Made with ❤️ for Kwaju Africa
</div>