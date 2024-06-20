import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';

class MyFollowesPage extends StatefulWidget {
  const MyFollowesPage({super.key});

  @override
  State<MyFollowesPage> createState() => _MyFollowesPageState();
}

class _MyFollowesPageState extends State<MyFollowesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ResponsiveAppBar(title: "Followers", isSearch: false),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              isThreeLine: true,
              title: const Row(
                children: [
                  CircleAvatar(radius: 33, backgroundColor: AppColors.grey),
                  Text("user000001", style: AppTextStyle.profileUserName),
                ],
              ),
              trailing: ButtonResponse(
                text: 'Follow',
                onPressed: () {},
              ),
            );
          }),
    );
  }
}
