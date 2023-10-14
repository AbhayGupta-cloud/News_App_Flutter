# News_App_Flutter
Created a News app in flutter and integrated the NewsApp.org API for fetching real time news.
# Flutter News App

This is a simple Flutter News App that fetches news articles from the [News API](https://newsapi.org/). It allows users to view top news, breaking news, and news from different categories.

## Features

- View top news, breaking news, and news from different categories.
- Read detailed news articles with images.
- Search for news articles.

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)
![Screenshot 2](screenshots/screenshot2.png)

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/News_App_Flutter.git

Navigate to the project directory:

bash
Copy code
cd flutter-news-app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
API Key
To run this app, you need to obtain an API key from News API and replace the placeholder in lib/screens/homepage.dart:

dart
Copy code
String url =
    "https://newsapi.org/v2/everything?q=tesla&from=2023-09-14&sortBy=publishedAt&apiKey=YOUR_API_KEY";
Dependencies
http: A package for making HTTP requests.
cached_network_image: A flutter library to show images from the internet and keep them in the cache directory.
Contributing
Contributions are welcome! Feel free to open issues or submit pull requests.
