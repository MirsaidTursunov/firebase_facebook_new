part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
}

class LoginWithEmailEvent extends HomeEvent{
  final String email;
  final String password;
  LoginWithEmailEvent({required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}


class SignUpEvent extends HomeEvent{
  final String email;
  final String password;
  SignUpEvent({required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class GoogleEvent extends HomeEvent{
  GoogleEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FacebookEvent extends HomeEvent{
  FacebookEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}