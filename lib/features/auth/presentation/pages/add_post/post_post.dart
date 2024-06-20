import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';
import '../../../../../core/constants/pages/all_pages.dart';

class PostPost extends StatefulWidget {
  final String photoOrVideoPath;

  const PostPost({super.key, required this.photoOrVideoPath});

  @override
  State<PostPost> createState() => _PostPostState();
}

class _PostPostState extends State<PostPost> {
  String? selectedValue = "Bepul";
  List<Categories> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Categories> displayedCategories = [
      Categories.Boshqalar,
      Categories.Nasihat,
      Categories.AvtoOlam,
      Categories.Informativ,
      Categories.LifeHack,
      Categories.Podcast,
      Categories.Motivatsiyalar,
      Categories.Talim,
      Categories.Sayohat,
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        title: Row(
          children: const [],
        ),
        isSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.responsiveWidth(4)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.responsiveWidth(1),
                    ),
                    child: Image.file(
                      File(widget.photoOrVideoPath),
                      width: 288,
                      height: 162,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 162,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.responsiveWidth(1),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.responsiveWidth(1)),
                      child: TextFormField(
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "Izoh yozing",
                          hintStyle: AppTextStyle.postTextField,
                          fillColor: AppColors.grey,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: AppColors.grey,
                    child: Row(
                      children: [
                        Radio(
                          fillColor:
                              WidgetStateProperty.all(AppColors.mainColor),
                          value: 'Pullik',
                          groupValue: selectedValue,
                          onChanged: (value) {
                            AlertDialog alert = AlertDialog(
                              content: SizedBox(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Pullik kontentga o'tish uchun obunachilaringiz\nsoni 10.000 tadan ko'p bo'lishi kerak!",
                                  style: AppTextStyle.showDialogSubtitle,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                        ),
                        Text("Pullik", style: AppTextStyle.category)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: AppColors.grey,
                    child: Row(
                      children: [
                        Radio(
                          fillColor:
                              WidgetStateProperty.all(AppColors.mainColor),
                          value: 'Bepul',
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Bepul",
                          style: AppTextStyle.category,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: displayedCategories.length,
                itemBuilder: (context, index) {
                  Categories category = displayedCategories[index];
                  bool isSelected = selectedCategories.contains(category);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedCategories.remove(category);
                          } else {
                            selectedCategories.add(category);
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: category == Categories.Boshqalar
                              ? AppColors.mainColor
                              : AppColors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                          border: isSelected
                              ? Border.all(color: AppColors.mainColor, width: 2)
                              : null,
                        ),
                        child: Text(
                          category.name,
                          style: category == Categories.Boshqalar
                              ? AppTextStyle.otherCategory
                              : AppTextStyle.category,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
