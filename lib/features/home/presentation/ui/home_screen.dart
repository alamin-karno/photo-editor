import 'package:flutter/material.dart';
import 'package:photo_editor/core/providers/providers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
    );
  }
}
