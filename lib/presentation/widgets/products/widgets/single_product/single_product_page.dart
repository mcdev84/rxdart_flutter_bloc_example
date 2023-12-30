import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rx_dart/presentation/templates/page_template.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/sign_in_clipper.dart';
import 'package:rx_dart/presentation/widgets/network_image_chaced/cached_network_image.dart';

class CustomImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();
    // Set your image cache size
    imageCache.maximumSizeBytes = 1024 * 1024 * 100; // 100 MB
    return imageCache;
  }
}

class SingleProductPage extends StatelessWidget {
  final ProductEntity product;

  const SingleProductPage({required this.product, super.key});

  static const routeName = '/product';
  static const name = 'single product';

  @override
  Widget build(BuildContext context) => PageTemplate(
      child: SliverFillRemaining(
          hasScrollBody: true,
          fillOverscroll: true,
          child: Stack(children: [
            ClipPath(
                clipBehavior: Clip.antiAlias,
                clipper: AuthenticationClipper(),
                child: Container(
                    padding: const EdgeInsets.only(top: 40),
                    alignment: Alignment.topCenter,
                    height: viewSize.height * .4,
                    decoration: appBarGradient,
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.arrow_back_ios_rounded,
                                  color: Colors.white, size: 18),
                              Text(product.title!, style: titleStyle),
                              const Icon(Icons.menu,
                                  color: Colors.white, size: 18)
                            ]),
                        SizedBox(
                          height: viewSize.height * .01,
                        ),
                        Chip(
                            padding: EdgeInsets.zero,
                            side: BorderSide.none,
                            visualDensity: VisualDensity.compact,
                            backgroundColor: happyYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 6,
                            shadowColor: happyYellow,
                            label: Text(product.category!.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ))),
            Positioned(
                top: viewSize.height * .4 - viewSize.width * .35,
                left: viewSize.width * .5 - viewSize.width * .25,
                child: CircleAvatar(
                    radius: viewSize.width * .25,
                    backgroundImage:
                        cachedNetworkImage(imageUrl: product.images!.first))),
            Positioned(
                top: viewSize.height * .4 + 75,
                left: viewSize.width * .125,
                right: viewSize.width * .125,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text(product.description!, style: hintStyle)]))
          ])));
}
