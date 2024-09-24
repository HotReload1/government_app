import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_project/layers/data/model/events.dart';
import 'package:meta/meta.dart';

import '../../data/fake_data.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  void getEvents(String category) async {
    emit(EventsLoading());
    await Future.delayed(Duration(seconds: 3), () {
      emit(EventsLoaded(
          events: FakeData.events
              .where((element) =>
                  element.category == category || category == "الكل")
              .toList()));
    });
  }
}
