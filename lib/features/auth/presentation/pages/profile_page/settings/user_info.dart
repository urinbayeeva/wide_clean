import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
          title: "Information of the account", isSearch: false),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          String username = "John Doe";
          String password = "********";
          String gmail = "johndoe@gmail.com";
          String phoneNumber = "+1234567890";

          return Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1, color: AppColors.grey))),
                        child: Text("Username: $username")),
                    SizedBox(height: 20),
                    Text("Password: $password"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gmail: $gmail"),
                    SizedBox(height: 20),
                    Text("Phone Number: $phoneNumber"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
