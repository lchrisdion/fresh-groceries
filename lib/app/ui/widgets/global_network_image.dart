import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlobalNetworkImage extends StatefulWidget {
  final String _imageURL;

  GlobalNetworkImage({
    Key? key,
    imageURL,
  })  : _imageURL = imageURL,
        super(key: key);

  @override
  State<GlobalNetworkImage> createState() => _GlobalNetworkImageState();
}

class _GlobalNetworkImageState extends State<GlobalNetworkImage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget._imageURL,
      fit: BoxFit.cover,
      enableMemoryCache: true,
      enableSlideOutPage: true,
      timeRetry: Duration(
        seconds: 5,
      ),
      retries: 5,
      printError: kDebugMode,
      clearMemoryCacheWhenDispose: true,
      clearMemoryCacheIfFailed: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            controller.reset();
            return SizedBox();
          case LoadState.completed:
            return FadeTransition(
              opacity: controller..forward(),
              alwaysIncludeSemantics: false,
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                fit: BoxFit.cover,
              ),
            );
          case LoadState.failed:
            controller.reset();
            return GestureDetector(
              child: SizedBox(),
              onTap: () {
                state.reLoadImage();
              },
            );
        }
      },
    );
  }
}
