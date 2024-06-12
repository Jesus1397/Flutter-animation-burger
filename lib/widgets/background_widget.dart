import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            color: const Color(0xff9D2D35),
          ),
          // Container(
          //   width: size.width,
          //   height: (size.height * 0.7) - 24,
          //   // height: size.height * 0.7,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}
