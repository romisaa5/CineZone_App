import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/features/profile/presentation/manager/cubit/watch_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinezone_app/features/profile/presentation/widgets/empty_section.dart';
import 'package:cinezone_app/features/profile/presentation/widgets/movies_grid.dart';

class WatchHistoryTabs extends StatelessWidget {
  const WatchHistoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchHistoryCubit>().loadData();
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: AppColors.yellowcolor,
            unselectedLabelColor: Colors.white,
            indicatorColor: AppColors.yellowcolor,
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Watch List'),
              Tab(icon: Icon(Icons.folder), text: 'History'),
            ],
          ),
          Expanded(
            child: BlocBuilder<WatchHistoryCubit, WatchHistoryState>(
              builder: (context, state) {
                if (state is WatchHistoryLoaded) {
                  return TabBarView(
                    children: [
                      state.watchList.isEmpty
                          ? const EmptySection()
                          : MoviesGrid(movies: state.watchList),
                      state.history.isEmpty
                          ? const EmptySection()
                          : MoviesGrid(movies: state.history),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowcolor,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
