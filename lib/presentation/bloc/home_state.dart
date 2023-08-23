part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool numberVisible;

  const HomeState({
    this.numberVisible = true,
  });

  HomeState copyWith({
    bool? numberVisible,
  }) =>
      HomeState(
        numberVisible: numberVisible ?? this.numberVisible,
      );

  @override
  List<Object?> get props => [numberVisible];
}