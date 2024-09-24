import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:government_project/core/configuration/styles.dart';
import 'package:government_project/layers/bloc/news_bloc/news_cubit.dart';
import 'package:government_project/layers/view/widgets/custom_drawer.dart';

import '../../../core/ui/waiting_widget.dart';
import '../../../injection_container.dart';
import '../widgets/custom_card.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _newsCubit = sl<NewsCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(_newsCubit.state is NewsLoaded)) {
      _newsCubit.getNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("الأخبار"),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        bloc: _newsCubit,
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(
              child: WaitingWidget(),
            );
          } else if (state is NewsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final news = state.news[index];
                return custom_card(
                  mainImage: news.mainImage,
                  subImages: news.subImages,
                  title: news.title,
                  date: news.date,
                  desc: news.desc,
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
