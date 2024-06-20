import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/models/auth/change_language_model.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int? selectedLanguageIndex;
  bool isLoading = false;

  void _onLanguageSelected(int index) {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        selectedLanguageIndex = index;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        isSearch: true,
        title: "",
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(.0),
                child: ListView.builder(
                  itemCount: listOfLanguage.length * 2 - 1,
                  itemBuilder: (context, index) {
                    if (index.isOdd) {
                      return Divider(height: 1, color: AppColors.grey);
                    }
                    final languageIndex = index ~/ 2;
                    return ListTile(
                      // isThreeLine: true,
                      title: Text(
                        listOfLanguage[languageIndex].country!,
                        style: AppTextStyle.languageCountry,
                      ),
                      subtitle: Text(
                        listOfLanguage[languageIndex].language!,
                        style: AppTextStyle.language,
                      ),
                      trailing: Checkbox(
                        activeColor: AppColors.mainColor,
                        focusColor: AppColors.mainColor,
                        value: selectedLanguageIndex == languageIndex,
                        onChanged: isLoading
                            ? null
                            : (bool? value) {
                                if (value == true) {
                                  _onLanguageSelected(languageIndex);
                                } else {
                                  setState(() {
                                    selectedLanguageIndex = null;
                                  });
                                }
                              },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
                backgroundColor: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
