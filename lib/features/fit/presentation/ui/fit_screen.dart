import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:photo_editor/core/shared/shared.dart';
import 'package:photo_editor/features/filter/presentation/widgets/ratio_items_widget.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class FitScreen extends StatefulWidget {
  const FitScreen({Key? key}) : super(key: key);

  @override
  State<FitScreen> createState() => _FitScreenState();
}

class _FitScreenState extends State<FitScreen> {
  late AppImageProvider imageProvider;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Fit',
        actionIcon: CupertinoIcons.checkmark_alt,
        actionPressed: () async {
          screenshotController.capture().then((Uint8List? image) {
            if (image != null) {
              imageProvider.onChangeImage(image);
              if (!mounted) return;
              Navigator.of(context).pop();
            }
          }).catchError((onError) {
            debugPrint(onError);
          });
        },
      ),
      body: Center(
        child: Consumer<AppImageProvider>(
          builder: (context, state, child) {
            if (state.currentImage != null) {
              return Screenshot(
                controller: screenshotController,
                child: Image.memory(state.currentImage!),
              );
            }
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: RatioItemsWidget(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BottomButtonWidget(
                        icon: Icons.aspect_ratio,
                        title: 'Ratio',
                        onTap: () {},
                      ),
                      BottomButtonWidget(
                        icon: Icons.blur_linear,
                        title: 'Blur',
                        onTap: () {},
                      ),
                      BottomButtonWidget(
                        icon: Icons.color_lens_outlined,
                        title: 'Color',
                        onTap: () {},
                      ),
                      BottomButtonWidget(
                        icon: Icons.texture,
                        title: 'Texture',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
