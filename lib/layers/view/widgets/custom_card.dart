import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/configuration/styles.dart';

class custom_card extends StatelessWidget {
  final String mainImage;
  final List<String> subImages;
  final bool withoutSubImages;
  final String title;
  final String desc;
  final String date;

  const custom_card(
      {super.key,
      required this.mainImage,
      this.subImages = const [],
      required this.title,
      required this.desc,
      required this.date,
      this.withoutSubImages = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 6.0,
                offset: Offset(2.0, 3.0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: mainImage,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          CommonSizes.vSmallSpace,
          Visibility(
            visible: !withoutSubImages,
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    children: List.generate(subImages.length, (index) {
                      final image = subImages[index];
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.fill,
                              height: 80,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                CommonSizes.vSmallerSpace,
              ],
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Styles.colorPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          CommonSizes.vBigSpace,
          Text(date),
          Text(desc,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
