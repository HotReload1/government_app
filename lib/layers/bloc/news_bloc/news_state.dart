part of 'news_cubit.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  final List<News> news;

  @override
  List<Object?> get props => [this.news];

  NewsLoaded({
    required this.news,
  });
}
