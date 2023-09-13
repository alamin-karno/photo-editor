import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:photo_editor/features/crop/presentation/widgets/bottom_icon_button_widget.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(CupertinoIcons.checkmark_alt),
          ),
        ],
      ),
      body: Center(
        child: Consumer<AppImageProvider>(
          builder: (context, state, child) {
            if (state.currentImage != null) {
              return Image.memory(state.currentImage!);
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
            height: 60,
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: const Icon(
                      Icons.rotate_90_degrees_cw_outlined,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: const Icon(
                      Icons.rotate_90_degrees_ccw_outlined,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: const Icon(
                      Icons.crop_free,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: const Icon(
                      Icons.crop_square,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: Text(
                      '1:2',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: Text(
                      '2:1',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: Text(
                      '4:3',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: Text(
                      '3:4',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: Text(
                      '16:9',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {},
                    child: Text(
                      '9:16',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
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
