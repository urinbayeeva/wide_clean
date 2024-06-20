import 'package:flutter/material.dart';
import 'package:wide_clean/config/theme/light_app_textstyle.dart';

class UserDisplayBottomSheet extends StatefulWidget {
  final Function(bool) onAvatarTappedCallback;

  const UserDisplayBottomSheet(
      {super.key, required this.onAvatarTappedCallback});

  @override
  _UserDisplayBottomSheetState createState() => _UserDisplayBottomSheetState();
}

class _UserDisplayBottomSheetState extends State<UserDisplayBottomSheet> {
  List<bool> selectedAvatars = List.generate(14, (index) => false);

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
                  (i) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatars[index * 7 + i] =
                              !selectedAvatars[index * 7 + i];
                          widget.onAvatarTappedCallback(selectedAvatars[index *
                                  7 +
                              i]); // Call the callback function with the new state
                        });
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: selectedAvatars[index * 7 + i]
                                ? Colors.blue
                                : Colors.grey.shade200,
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
            ),
          ],
        );
      },
    );
  }
}
