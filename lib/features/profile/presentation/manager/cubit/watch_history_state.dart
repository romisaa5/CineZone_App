part of 'watch_history_cubit.dart';

abstract class WatchHistoryState {}

class WatchHistoryInitial extends WatchHistoryState {}

class WatchHistoryLoaded extends WatchHistoryState {
  final List<Movie> watchList;
  final List<Movie> history;

  WatchHistoryLoaded({required this.watchList, required this.history});
}
