import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachingImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final Color? color;

  const CachingImage(this.imageUrl, {super.key, this.fit, this.color});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.contain,
      imageUrl: imageUrl ?? '',
      width: double.infinity,
      color: color,
      placeholder: (context, url) {
        return const ColoredBox(color: Color(0xFFE9E9E9));
      },
      errorWidget: (context, url, e) {
        return const SizedBox.expand(
          child: ColoredBox(
            color: Color(0xFFE9E9E9),
          ),
        );
      },
      // progressIndicatorBuilder: (context, _, progress) {
      //   return const ColoredBox(
      //     color: Color(0xFFE9E9E9),
      //   );
      // },
    );
  }
}
