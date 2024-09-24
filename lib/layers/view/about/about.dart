import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:government_project/core/configuration/styles.dart';
import 'package:government_project/layers/view/widgets/members_card.dart';

import '../widgets/custom_drawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> subImages = [
    "https://cdn.alsaudinews.com/wp-content/uploads/2024/07/%D8%A7%D9%84%D8%B3%D9%88%D8%B1%D9%8A.jpg",
    "https://media.alalam.ir/uploads/855x495/2022/05/28/165375998830242100.jpg",
    "https://al-hiwarnews.com/wp-content/uploads/2022/05/IMG-20220529-WA0035.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("عن المجلس"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/United_Nations_Trusteeship_Council_chamber_in_New_York_City_2.JPG/277px-United_Nations_Trusteeship_Council_chamber_in_New_York_City_2.JPG",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          CommonSizes.vSmallSpace,
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
          CommonSizes.vBigSpace,
          titleAndDescription(
              "التأسيس:",
              "تأسس مجلس بلدية مدينتنا في عام 1950، ومنذ ذلك الحين، يعتبر ركيزة أساسية في تشكيل هوية المدينة وتوجهها. يضم المجلس مجموعة متنوعة من الأعضاء المنتخبين الملتزمين بخدمة المجتمع وتحسين جودة الحياة للسكان."
                  "على مر السنوات، قام المجلس بأداء مهامه بجدية ومسؤولية، حيث عمل على تطوير البنية التحتية للمدينة وتوفير الخدمات الأساسية للمجتمع. من خلال التخطيط الحكيم والتعاون مع الجهات المعنية، شهدت المدينة تحسنًا كبيرًا في مجالات مثل النقل العام، والصحة، والتعليم، والترفيه."),
          CommonSizes.vBigSpace,
          titleAndDescription("قطاع البلدية:",
              "قطاع مجلس البلدية يلعب دورًا حيويًا في تقديم الخدمات الأساسية للمجتمع. يشمل القطاع تنظيم وإدارة النقل العام، وتوفير الرعاية الصحية، وصيانة البنية التحتية، وتنظيم الأنشطة الثقافية والترفيهية. يعمل فريق القطاع بكفاءة لتلبية احتياجات السكان وتحسين جودة حياتهم. بفضل جهود قطاع مجلس البلدية، تشهد المدينة تنمية مستدامة وتقدم متواصل في مختلف المجالات."),
          CommonSizes.vBigSpace,
          titleAndDescription("الرؤية:",
              "تتمحور حول بناء مدينة مستدامة تتمتع بالتنمية الشاملة والتقدم الاقتصادي والاجتماعي. يهدف المجلس إلى توفير بنية تحتية متطورة، وتعزيز الخدمات العامة، وتشجيع الابتكار والريادة، وتعزيز روح المشاركة المجتمعية. من خلال رؤيته الطموحة، يسعى المجلس لخلق بيئة حضرية متناغمة ومستدامة توفر رفاهية وجودة حياة متميزة لجميع السكان."),
          CommonSizes.vBigSpace,
          titleAndDescription("الأهداف:",
              "تشمل تحسين جودة الحياة وتلبية احتياجات المجتمع من خلال توفير خدمات عالية الجودة وتعزيز التنمية الاقتصادية والاجتماعية وتعزيز المشاركة المجتمعية والاستدامة البيئية."),
          CommonSizes.vSmallSpace,
          Text(
            "الأعضاء:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return members_card(
                  mainImage:
                      "https://cdns-images.dzcdn.net/images/artist/b6abeae1b41f4ac998ec370a9f20c648/500x500-000000-80-0-0.jpg",
                  member_name: "قيصر القصير",
                  member_position: "رئيس مجلس بلدية المزة",
                  member_info:
                      "رئيس مجلس بلدية المزة، حاصل على شهادة دكتوراة من كذا، رئيس مجلس بلدية المزة، حاصل على شهادة دكتوراة من كذا، رئيس مجلس بلدية المزة، حاصل على شهادة دكتوراة من كذا،");
            },
          )
        ],
      ),
    );
  }

  Column titleAndDescription(String title, desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          desc,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
