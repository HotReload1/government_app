part of 'decision_cubit.dart';

@immutable
abstract class DecisionState extends Equatable {}

class DecisionInitial extends DecisionState {
  @override
  List<Object?> get props => [];
}

class DecisionLoading extends DecisionState {
  @override
  List<Object?> get props => [];
}

class DecisionLoaded extends DecisionState {
  final List<Decision> decisions;

  @override
  List<Object?> get props => [this.decisions];

  DecisionLoaded({
    required this.decisions,
  });
}
