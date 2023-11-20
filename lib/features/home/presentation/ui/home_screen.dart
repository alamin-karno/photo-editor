import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:photo_editor/core/shared/shared.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Photo Editor',
        actionIcon: Icons.save,
        actionPressed: () {},
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
                  BottomButtonWidget(
                    icon: CupertinoIcons.crop_rotate,
                    title: 'Crop',
                    onTap: () {
                      Navigator.pushNamed(context, '/crop');
                    },
                  ),
                  BottomButtonWidget(
                    icon: Icons.filter_vintage_outlined,
                    title: 'Filters',
                    onTap: () {
                      Navigator.pushNamed(context, '/filter');
                    },
                  ),
                  BottomButtonWidget(
                    icon: Icons.tune,
                    title: 'Adjust',
                    onTap: () {
                      Navigator.pushNamed(context, '/adjust');
                    },
                  ),
                  BottomButtonWidget(
                    icon: Icons.fit_screen_sharp,
                    title: 'Fit',
                    onTap: () {
                      Navigator.pushNamed(context, '/fit');
                    },
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
