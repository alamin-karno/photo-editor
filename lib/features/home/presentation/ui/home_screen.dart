import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:photo_editor/features/home/presentation/widgets/bottom_button_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Photo Editor'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.blue),
            ),
          )
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
        width: double.infinity,
        height: 60,
        color: Colors.black,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BottomButtonWidget(
                  icon: CupertinoIcons.crop_rotate,
                  title: 'Crop',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/crop');
                  },
                ),
                BottomButtonWidget(
                  icon: CupertinoIcons.add,
                  title: 'Title',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
