abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class DatabaseCreateLoading extends DatabaseState {}

class DatabaseCreateSuccess extends DatabaseState {}

class DatabaseCreateFailed extends DatabaseState {
  final String errorMessage;

  DatabaseCreateFailed(this.errorMessage);
}
