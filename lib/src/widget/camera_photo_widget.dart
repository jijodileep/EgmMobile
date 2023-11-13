import 'package:flutter/material.dart';

import '../constant/constant.dart';

class CameraPhotoWidget extends StatelessWidget {
  const CameraPhotoWidget({
    Key? key,
    required this.gallery,
    required this.camera,
  }) : super(key: key);

  final Function camera, gallery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Material(
        child: Column(
          children: [
            const SizedBox(height: 12.00),
            Text('SelectSource',
                style: FontConstant.inter
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16.00),
            InkWell(
              onTap: () {
                camera();
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.00),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera),
                      const SizedBox(width: 8.00),
                      Text(
                        'FromCamera',
                        style: FontConstant.inter,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.00),
            InkWell(
              onTap: () {
                gallery();
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.00),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.photo),
                      const SizedBox(width: 8.00),
                      Text(
                        'FromGallery',
                        style: FontConstant.inter,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
