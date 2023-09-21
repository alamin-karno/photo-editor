import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:photo_editor/core/shared/shared.dart';
import 'package:photo_editor/features/adjust/presentation/state/adjust_provider.dart';
import 'package:photo_editor/features/adjust/presentation/widgets/custom_slider_widget.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class AdjustScreen extends StatefulWidget {
  const AdjustScreen({Key? key}) : super(key: key);

  @override
  State<AdjustScreen> createState() => _AdjustScreenState();
}

class _AdjustScreenState extends State<AdjustScreen> {
  AdjustProvider? adjustProvider;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      adjustProvider = Provider.of<AdjustProvider>(context, listen: false);
      if (adjustProvider != null) {
        adjustProvider!.adjustImage();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Adjust',
        actionIcon: CupertinoIcons.checkmark_alt,
        actionPressed: () {},
      ),
      body: adjustProvider != null
          ? Stack(
              children: [
                Center(
                  child: Consumer<AppImageProvider>(
                    builder: (context, state, child) {
                      if (state.currentImage != null) {
                        return Screenshot(
                          controller: screenshotController,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.matrix(
                              adjustProvider!.adj.matrix,
                            ),
                            child: Image.memory(state.currentImage!),
                          ),
                        );
                      }
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomSliderWidget(
                              value: adjustProvider!.brightness,
                              onChanged: (value) {
                                setState(() {
                                  adjustProvider!.changeBrightness(value);
                                  adjustProvider!.adjustImage(b: value);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'RESET',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BottomButtonWidget(
                    icon: CupertinoIcons.brightness,
                    title: 'Brightness',
                    onTap: () {},
                  ),
                  BottomButtonWidget(
                    icon: Icons.contrast,
                    title: 'Contrast',
                    onTap: () {},
                  ),
                  BottomButtonWidget(
                    icon: Icons.water_drop,
                    title: 'Saturation',
                    onTap: () {},
                  ),
                  BottomButtonWidget(
                    icon: Icons.filter_tilt_shift,
                    title: 'Hue',
                    onTap: () {},
                  ),
                  BottomButtonWidget(
                    icon: Icons.motion_photos_on,
                    title: 'Sepia',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
