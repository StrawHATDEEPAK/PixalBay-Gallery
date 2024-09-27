import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';
import '../utils/http_response_handler.dart';
import 'dart:developer' as dev;

class ImageService {
  Future<dynamic> getImages(
      {required int page,
      required String searchWord,
      required String imageType}) async {
    var data;
    try {
      // Map<String, String> header = {
      //   'Content-Type': 'application/json; charset=utf-8',
      // };
      var query = Uri.encodeComponent(searchWord);
      final response = await http.get(
        Uri.parse(
            'https://pixabay.com/api/?key=${AppConstants.pixabayApiKey}&q=$query&image_type=photo&pretty=true&per_page=20&page=$page&image_type=$imageType'),
      );

      httpResponseHandle(
          onSuccessMsgTag: 'Get Images',
          onSuccessMsg: 'Image GET Success',
          response: response,
          onSuccess: () {
            data = jsonDecode(response.body)['hits'];
            // print(data);
            // dev.log(data.toString(), name: 'Get Images');
          });
    } catch (e) {
      dev.log(e.toString(), name: 'Get Faculty Error');
    }

    return data;
  }
}
