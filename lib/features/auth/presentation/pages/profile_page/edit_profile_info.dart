import 'dart:io';

import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/models/profile/change_photo.dart';
import 'package:wide_clean/features/auth/presentation/widgets/profile/edit_photo_bottomsheet.dart';
import 'package:wide_clean/features/auth/presentation/pages/main_page.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({super.key});

  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text("Edit Profile", style: AppTextStyle.appBarTextStyle),
        automaticallyImplyLeading: false,
        leadingWidth: 32,
        leading: GestureDetector(
          child: SvgPicture.asset(
            AppImages.returnBack,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(
                  selectedPageIndex: 1,
                ),
              ),
            );
          },
        ),
        toolbarHeight: 56,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildProfileColumn(),
            buildEditColumn(),
          ],
        ),
      ),
    );
  }

  Widget buildProfileColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: ChangePhoto.changePhoto != null
              ? AssetImage(ChangePhoto.changePhoto.picture)
              : AssetImage('assets/default_profile_photo.png'),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            editPhotoBottomSheet(context);
          },
          child: Text(
            "Change profile image",
            style: AppTextStyle.changePassword,
          ),
        ),
      ],
    );
  }

  Widget buildEditColumn() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEditField("User name"),
          const SizedBox(height: 20),
          buildEditField("Email"),
          const SizedBox(height: 20),
          buildEditField("Phone number"),
          const SizedBox(height: 25),
          Text("Save informations", style: AppTextStyle.changePassword),
        ],
      ),
    );
  }

  Widget buildEditField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.editUserName),
        SizedBox(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              hintText: label,
              hintStyle: AppTextStyle.textFieldHintStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


