import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_state.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';


class CategorySelection extends StatelessWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Expanded(
      child: BlocBuilder<PostPostBloc, PostPostState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: displayedCategories.length,
            itemBuilder: (context, index) {
              Categories category = displayedCategories[index];
              bool isSelected = state.selectedCategories.contains(category);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    context.read<PostPostBloc>().add(ToggleCategoryEvent(category));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.symmetric(
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
          );
        },
      ),
    );
  }
}
