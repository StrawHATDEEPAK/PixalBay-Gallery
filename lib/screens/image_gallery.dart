import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_test_project/widgets/show_options.dart';

import '../controller/image_controller.dart';
import '../widgets/image_card.dart';

class ImageGallery extends StatelessWidget {
  ImageGallery({super.key});
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Load initial set of images
    imageController.fetchImages();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Image Gallery'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            fontSize: screenWidth > 500 ? 30 : 20),
        centerTitle: true,
      ),
      body: Obx(() {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification.metrics.pixels ==
                scrollNotification.metrics.maxScrollExtent) {
              imageController.loadMoreImages();
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: "Type Search Word Here",
                          hintStyle:
                              const TextStyle(fontStyle: FontStyle.italic),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onSubmitted: (value) {
                          imageController.images.clear();
                          imageController.page = 1;
                          imageController.searchWord = value;
                          imageController.fetchImages();
                        },
                      ),
                    ),
                    ShowOptionsWidget()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                imageController.isLoading.value &&
                        imageController.images.isEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      )
                    : imageController.images.isEmpty
                        ? const Center(
                            child: Text('No Images Found'),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: getCrossAxisCount(context),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: imageController.images.length,
                              itemBuilder: (context, index) {
                                final image = imageController.images[index];
                                return ImageCard(image: image);
                              },
                            ),
                          ),
              ],
            ),
          ),
        );
      }),
    );
  }

  int getCrossAxisCount(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 5;
    } else if (screenWidth > 800) {
      return 4;
    } else if (screenWidth > 600) {
      return 3;
    } else {
      return 2;
    }
  }
}
