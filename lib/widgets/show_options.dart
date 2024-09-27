import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pixabay_test_project/controller/image_controller.dart';

class ShowOptionsWidget extends StatelessWidget {
  ShowOptionsWidget({super.key});
  final ImageController menuController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Open options menu with state management
            showOptionsMenu(context);
          },
        ),
      ],
    );
  }

  void showOptionsMenu(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx - renderBox.size.width * 6,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        position.dy,
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 'Image Type',
          child: Row(
            children: [
              OptionContainer(
                index: 0,
                text: "Image",
              ),
              OptionContainer(
                index: 1,
                text: "Illustration",
              ),
              OptionContainer(
                index: 2,
                text: "Vector",
              ),
              OptionContainer(
                index: 3,
                text: "All",
              )
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        // Update the state using GetX controller
      }
    });
  }
}

class OptionContainer extends StatelessWidget {
  final String text;
  final int index;
  OptionContainer({
    super.key,
    required this.text,
    required this.index,
  });

  bool isSelected = false;

  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
          onTap: () {
            imageController.selectImageType(index);
            imageController.images.clear();
            imageController.page = 1;
            imageController.fetchImages();
          },
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: index == imageController.selectedImageType.value
                    ? Colors.black
                    : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: index == imageController.selectedImageType.value
                        ? Colors.white
                        : Colors.black),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 11,
                    fontFamily: "Nunito",
                    color: index == imageController.selectedImageType.value
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          )),
    );
  }
}
