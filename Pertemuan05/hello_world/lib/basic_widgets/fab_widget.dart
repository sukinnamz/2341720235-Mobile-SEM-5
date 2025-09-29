import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const FabWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed ?? () {},
      backgroundColor: Colors.pink,
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white, // supaya icon selalu kelihatan
      ),
    );
  }
}
