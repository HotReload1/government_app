import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:government_project/layers/data/model/service.dart';
import 'package:meta/meta.dart';

import '../../data/fake_data.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  void getServices(String category) async {
    emit(ServicesLoading());
    await Future.delayed(Duration(seconds: 3), () {
      emit(ServicesLoaded(
          services: FakeData.services
              .where((element) =>
                  element.category == category || category == "الكل")
              .toList()));
    });
  }
}
