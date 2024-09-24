import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_project/layers/data/fake_data.dart';
import 'package:government_project/layers/data/model/news.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  void getNews() async {
    emit(NewsLoading());
    await Future.delayed(Duration(seconds: 3),(){
      emit(NewsLoaded(news: FakeData.news));
    });
  }
}
