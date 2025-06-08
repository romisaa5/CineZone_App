part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}
final class NavBarChanged extends NavBarState {
  final int index;

  NavBarChanged(this.index);
}
