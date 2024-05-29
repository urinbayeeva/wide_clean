import 'package:wide_clean/core/constants/pages/all_pages.dart';

typedef PhoneNumberChangedCallback = void Function(
    String phoneCode, String phoneNumber);

class PhoneNumberTextFields extends StatefulWidget {
  final TextEditingController codeController;
  final TextEditingController numberController;
  final String hintText;
  final String? Function(String?)? validator;
  final PhoneNumberChangedCallback? onChanged;

  const PhoneNumberTextFields({
    super.key,
    required this.codeController,
    required this.numberController,
    required this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberTextFieldsState createState() => _PhoneNumberTextFieldsState();
}

class _PhoneNumberTextFieldsState extends State<PhoneNumberTextFields> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.2,
          height: 52,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: widget.codeController,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value, widget.numberController.text);
              }
            },
            decoration: InputDecoration(
              hintText: "+998",
              hintStyle: AppTextStyle.textFieldHintStyle,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldColor,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.mainColor,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldError,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldError,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: SizeConfig.screenWidth * 0.69,
          height: 52,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.numberController,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(widget.codeController.text, value);
              }
            },
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: AppTextStyle.textFieldHintStyle,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldColor,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.mainColor,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldError,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textFieldError,
                  width: 1.0,
                ),
              ),
              suffixIcon: widget.numberController.text.isNotEmpty
                  ? IconButton(
                      icon: SvgPicture.asset(
                        AppImages.textfFieldClear,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.numberController.clear();
                        });
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
