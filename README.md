# Flutter Image Gallery App

This is a simple Flutter application that displays a gallery of images fetched from the [Pixabay API](https://pixabay.com/api/docs/). The app is built with **Flutter** and uses **GetX** for state management. It is designed to dynamically load images as the user scrolls and display the number of likes and views for each image.

The project was created as a part of the test task for a Flutter Developer position.

## Features

- Display images in a responsive grid layout (number of columns based on screen size).
- Fetch images from Pixabay API.
- Display the number of likes and views for each image.
- Infinite scrolling: Automatically load more images when scrolling down.
- Web version of the app deployed via GitHub Pages.

## Technologies Used

- **Language**: Dart
- **Framework**: Flutter
- **State Management**: GetX
- **Deployment**: GitHub Pages (for the web version)

## Installation

To run this project locally:

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/flutter-image-gallery.git
    cd flutter-image-gallery
    ```

2. Install the required dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app on your device or emulator:

    ```bash
    flutter run
    ```

## Usage

- The app displays a gallery of images in a grid format, adapting to the screen size.
- Scroll down to load more images.
- Each image shows the number of likes and views underneath.

## Documentation and Code Standards

- The code is documented following **Effective Dart** guidelines.
- All features and functions are well-commented to enhance readability and maintainability.

## Web Deployment

You can access the live web version of the app here: [Link to GitHub Pages Deployment](https://strawhatdeepak.github.io/)

## Pixabay API

This application uses the Pixabay API to fetch images. You will need an API key from Pixabay to run the project. Add the API key in your `.env` file.

```dotenv
PIXABAY_API_KEY=your_pixabay_api_key
