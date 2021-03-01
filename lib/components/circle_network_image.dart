import 'package:flutter/material.dart';

class CircleNetworkImage extends StatelessWidget {
  final double size;
  final String src;

  CircleNetworkImage({
    Key key,
    this.size = double.infinity,
    this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: size,
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            src,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
