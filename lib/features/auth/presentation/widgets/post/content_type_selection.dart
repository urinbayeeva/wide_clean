import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_state.dart';


class ContentTypeSelection extends StatelessWidget {
  const ContentTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            color: AppColors.grey,
            child: Row(
              children: [
                BlocBuilder<PostPostBloc, PostPostState>(
                  builder: (context, state) {
                    return Radio(
                      // ignore: deprecated_member_use
                      fillColor: MaterialStateProperty.all(AppColors.mainColor),
                      value: 'Pullik',
                      groupValue: state.contentType,
                      onChanged: (value) {
                        if (value == 'Pullik') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
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
                            },
                          );
                        }
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
                BlocBuilder<PostPostBloc, PostPostState>(
                  builder: (context, state) {
                    return Radio(
                      fillColor: MaterialStateProperty.all(AppColors.mainColor),
                      value: 'Bepul',
                      groupValue: state.contentType,
                      onChanged: (value) {
                        context.read<PostPostBloc>().add(ChangeContentTypeEvent(value!));
                      },
                    );
                  },
                ),
                Text("Bepul", style: AppTextStyle.category)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
