abstract class HomeEvent {}

class GetUsersEvent extends HomeEvent {
  final int? name;

  GetUsersEvent({this.name});
}

class GetUserByIdEvent extends HomeEvent {
  final int? id;

  GetUserByIdEvent({this.id});
}
