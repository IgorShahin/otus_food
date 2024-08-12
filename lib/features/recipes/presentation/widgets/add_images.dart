import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
                  color: const Color(0xFFEBEBEB),
                  shape: DashedRoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF165932)),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
          child: Center(
            child: _image == null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Color(0xFF165932),
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.addImages,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF165932),
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
