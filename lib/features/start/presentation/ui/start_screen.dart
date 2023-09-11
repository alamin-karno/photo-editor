import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editor/core/helper/helper.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late AppImageProvider imageProvider;

  @override
  void initState() {
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/bg_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Photo Editor',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          wordSpacing: 10,
                        ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AppImagePicker(source: ImageSource.gallery).pick(
                          onPick: (File? image) {
                            if (image != null) {
                              imageProvider.onChangeImage(image);
                              Navigator.of(context).pushNamed('/home');
                            }
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.photo_fill_on_rectangle_fill,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Gallery',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AppImagePicker(source: ImageSource.camera).pick(
                          onPick: (File? image) {
                            if (image != null) {
                              imageProvider.onChangeImage(image);
                              Navigator.of(context).pushNamed('/home');
                            }
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.camera),
                          const SizedBox(width: 5),
                          Text(
                            'Camera',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
