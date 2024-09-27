import 'dart:async';

import 'package:get/get.dart';

import '../models/pixabay_image_model.dart';

import '../services/service.dart';

class ImageController extends GetxController {
  // Pixabay API URL
  var images = <PixabayImage>[].obs;
  var page = 1;
  var searchWord = '';
  var isLoading = false.obs;
  final _imageService = ImageService();
  var imageType = <String>["photo", "illustration", "vector", "all"];
  var selectedImageType = 3.obs;
  // Load images from Pixabay

  Future<void> fetchImages() async {
    if (isLoading.value) return;
    isLoading.value = true;
    var data = await _imageService.getImages(
        page: page,
        searchWord: searchWord,
        imageType: imageType[selectedImageType.value]);

    if (data != null) {
      List<PixabayImage> imagesList =
          (data as List).map((e) => PixabayImage.fromMap(e)).toList();
      images.addAll(imagesList);
      page++;
    }

    isLoading.value = false;
  }

  void loadMoreImages() async {
    if (!isLoading.value) {
      await fetchImages();
    }
  }

  void selectImageType(int index) {
    selectedImageType.value = index;
  }
}
