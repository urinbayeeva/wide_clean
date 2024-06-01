import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/text_style/app_textstyle.dart';

class UserDisplayBottomSheet extends StatelessWidget {
  const UserDisplayBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: List.generate(
                  7,
                  (index) => Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey.shade200,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "user",
                          style: AppTextStyle.bottomSheetUser,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
