import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otus_food/core/constants/colors.dart';
import 'package:otus_food/core/extensions/context_extension.dart';

import '../../../../core/widgets/dashed_rounded_rectangle_border.dart';

class AddImages extends StatefulWidget {
  const AddImages({super.key});

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  File? _image;

  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => getImageGallery(),
        child: Container(
          height: 215,
          decoration: _image != null
              ? null
              : ShapeDecoration(
                  color: AppColors.scaffoldBackground,
                  shape: DashedRoundedRectangleBorder(
                    side: BorderSide(width: 1, color: context.colors.mainColor),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
          child: Center(
            child: _image == null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: context.colors.mainColor,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.addImages,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: context.colors.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.file(
                      _image!.absolute,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
          ),
        ),
      );
}
