import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String pixabayApiKey = dotenv.env["PIXABAY_API_KEY"]!;
}
