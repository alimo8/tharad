import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tharad/core/ui/app_image.dart';
import 'package:tharad/generated/l10n.dart';

class DocumentUploadWidget extends StatefulWidget {
  const DocumentUploadWidget({super.key});

  @override
  State<DocumentUploadWidget> createState() => _DocumentUploadWidgetState();
}

class _DocumentUploadWidgetState extends State<DocumentUploadWidget> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() => _pickedImage = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickImageFromGallery,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(10.r),
            dashPattern: const [8, 4],
            color: Colors.grey,
            strokeWidth: 2,
          ),
          child: Container(
            alignment: Alignment.center,
            child: _pickedImage == null
                ? Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppImage(imageUrl: 'camera.svg', height: 30),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).upload_note,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 260.w,
                        maxHeight: 180.h,
                      ),
                      child: Image.file(
                        File(_pickedImage!.path),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
