import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        title: "Admin",
        isSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            Center(
              child: Text(
                "Adminlar bilan bog'lanish uchun to'liq va asosli xabar yuboring, habaringiz 3 kun\nichida ko'rib chiqiladi va sizga javob qaytariladi",
                style: AppTextStyle.adminInfo,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            TextField(
              decoration: InputDecoration(
                hintText: "Shikoyat yoki taklifingizni yozing",
                hintStyle: AppTextStyle.textFieldHintStyle,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.textFieldColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text("Xabarni yuborish", style: AppTextStyle.sendToAdmin),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
