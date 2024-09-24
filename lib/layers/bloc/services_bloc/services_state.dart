part of 'services_cubit.dart';

@immutable
abstract class ServicesState extends Equatable {}

class ServicesInitial extends ServicesState {
  @override
  List<Object?> get props => [];
}

class ServicesLoading extends ServicesState {
  @override
  List<Object?> get props => [];
}

class ServicesLoaded extends ServicesState {
  final List<Service> services;

  @override
  List<Object?> get props => [this.services];

  ServicesLoaded({
    required this.services,
  });
}
