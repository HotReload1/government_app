import 'package:flutter/material.dart';
import 'package:government_project/layers/data/fake_data.dart';
import '../../../core/configuration/styles.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/services_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("الرئيسية"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            buildPadding(
                "الأخبار",
                List.generate(FakeData.news.length, (index) {
                  final news = FakeData.news[index];
                  return custom_card(
                    mainImage: news.mainImage,
                    subImages: news.subImages,
                    title: news.title,
                    date: news.date,
                    desc: news.desc,
                  );
                })),
            buildPadding(
                "القرارات",
                List.generate(FakeData.decision.length, (index) {
                  final decision = FakeData.decision[index];
                  return custom_card(
                    mainImage: decision.mainImage,
                    withoutSubImages: true,
                    title: decision.title,
                    date: decision.date,
                    desc: decision.desc,
                  );
                })),
            buildPadding(
                "الفعاليات",
                List.generate(FakeData.events.length, (index) {
                  final event = FakeData.events[index];
                  return custom_card(
                    mainImage: event.mainImage,
                    withoutSubImages: true,
                    title: event.title,
                    date: event.date,
                    desc: event.desc,
                  );
                })),
            buildPadding(
                "الخدمات",
                List.generate(FakeData.services.length, (index) {
                  final service = FakeData.services[index];
                  return services_card(
                    mainImage: service.mainImage,
                    required_papers: service.required_papers,
                  );
                })),
          ],
        ),
      )),
    );
  }

  Padding buildPadding(String title, List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Styles.colorPrimary),
          ),
          ...widgets
        ],
      ),
    );
  }
}
