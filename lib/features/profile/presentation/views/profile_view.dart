// ملف: profile_view.dart
import 'package:cinezone_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:cinezone_app/features/profile/presentation/widgets/watch_history_tabs.dart';
import 'package:flutter/material.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: const [
          ProfileHeader(),
          Expanded(child: WatchHistoryTabs()),
        ],
      ),
    );
  }
}
