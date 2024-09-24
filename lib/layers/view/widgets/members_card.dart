import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/configuration/styles.dart';

class members_card extends StatelessWidget {
  final String mainImage;
  final String member_name;
  final String member_position;
  final String member_info;

  const members_card(
      {super.key,
      required this.mainImage,
      required this.member_name,
      required this.member_position,
      required this.member_info});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0XFFF8F0E5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 6.0,
                offset: Offset(2.0, 3.0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            member_name,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Styles.colorPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          CommonSizes.vSmallSpace,
          Text(
            member_position,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          CommonSizes.vSmallSpace,
          Text(
            member_info,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
