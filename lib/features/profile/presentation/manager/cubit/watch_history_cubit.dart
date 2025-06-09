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
        title: 'The Mask',
        image: 'assets/images/onboard1.png',
        rating: 7.0,
        genre: 'Comedy',
      ),
    ];

    emit(WatchHistoryLoaded(watchList: watchList, history: history));
  }
}
