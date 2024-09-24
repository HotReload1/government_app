import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/configuration/styles.dart';

class services_card extends StatelessWidget {
  final String mainImage;
  final List<String> required_papers;

  const services_card(
      {super.key, required this.mainImage, required this.required_papers});

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
          Text(
            "الأوراق المطلوبة:",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Styles.colorPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          CommonSizes.vSmallSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(required_papers.length, (index) {
              return Text(
                "${index + 1}." + required_papers[index],
                style: TextStyle(fontSize: 17),
              );
            }),
          )
        ],
      ),
    );
  }
}
