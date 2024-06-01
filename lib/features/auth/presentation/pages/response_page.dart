import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/response_page_w/navigation_rail_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/response_page_w/pages_widget.dart';

class ResponsePage extends StatefulWidget {
  final int selectedPageIndex;
  const ResponsePage({super.key, required this.selectedPageIndex});

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  int selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedPageIndex;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectedIndex != 0
              ? NavigationRailWidget(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                )
              : const SizedBox.shrink(),
          Expanded(child: PagesWidget(selectedIndex: selectedIndex)),
        ],
      ),
    );
  }
}





// class CameraOrGalleryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             _getImage(ImageSource.camera, context);
//           },
//           child: const Text('Take Photo'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _getImage(ImageSource.gallery, context);
//           },
//           child: const Text('Choose from Gallery'),
//         ),
//       ],
//     );
//   }

  // Future<void> _getImage(ImageSource source, BuildContext context) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);

  //   if (pickedFile != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const CameraScreen(),
  //       ),
  //     );
  //   }
  // }

