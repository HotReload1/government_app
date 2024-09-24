import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/fake_data.dart';
import '../../data/model/decision.dart';

part 'decision_state.dart';

class DecisionCubit extends Cubit<DecisionState> {
  DecisionCubit() : super(DecisionInitial());

  void getDecisions() async {
    emit(DecisionLoading());
    await Future.delayed(Duration(seconds: 3), () {
      emit(DecisionLoaded(decisions: FakeData.decision));
    });
  }
}
