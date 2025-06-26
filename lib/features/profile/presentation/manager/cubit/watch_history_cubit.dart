import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinezone_app/features/home/models/movie.dart';

part 'watch_history_state.dart';

class WatchHistoryCubit extends Cubit<WatchHistoryState> {
  WatchHistoryCubit() : super(WatchHistoryInitial());

  List<Movie> watchList = [];
  List<Movie> history = [];

  void loadData() {
    watchList = [];
    history = [
      Movie(
        title: 'Captain America',
        image: 'assets/images/onboard2.png',
        rating: 7.7,
        genre: 'Action',
        summary: Movie.defaultSummary,
        cast: Movie.defaultCast,
      ),
    ];

    emit(WatchHistoryLoaded(watchList: watchList, history: history));
  }
}
