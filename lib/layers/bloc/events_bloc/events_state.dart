part of 'events_cubit.dart';

@immutable
abstract class EventsState extends Equatable {}

class EventsInitial extends EventsState {
  @override
  List<Object?> get props => [];
}

class EventsLoading extends EventsState {
  @override
  List<Object?> get props => [];
}

class EventsLoaded extends EventsState {
  final List<Event> events;

  @override
  List<Object?> get props => [this.events];

  EventsLoaded({
    required this.events,
  });
}
