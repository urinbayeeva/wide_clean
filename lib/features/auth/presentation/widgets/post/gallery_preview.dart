import 'dart:typed_data';
import 'package:photo_manager/photo_manager.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

Future<void> showMediaPicker(BuildContext context) async {
  List<AssetEntity> images = [];
  List<AssetEntity> videos = [];

  final PermissionState permission =
      await PhotoManager.requestPermissionExtend();
  if (permission.isAuth) {
    final List<AssetPathEntity> imageAlbums =
        await PhotoManager.getAssetPathList(
      type: RequestType.image,
      hasAll: true,
    );

    final List<AssetPathEntity> videoAlbums =
        await PhotoManager.getAssetPathList(
      type: RequestType.video,
      hasAll: true,
    );

    if (imageAlbums.isNotEmpty) {
      final int imageCount = await imageAlbums[0].assetCountAsync;
      images = await imageAlbums[0].getAssetListRange(
        start: 0,
        end: imageCount,
      );
    }

    if (videoAlbums.isNotEmpty) {
      final int videoCount = await videoAlbums[0].assetCountAsync;
      videos = await videoAlbums[0].getAssetListRange(
        start: 0,
        end: videoCount,
      );
    }
  } else {
    PhotoManager.openSetting();
    return;
  }

  showModalBottomSheet(
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.9,
    ),
    context: context,
    isDismissible: true,
    builder: (BuildContext context) {
      return DefaultTabController(
        length: 2,
        child: DraggableScrollableSheet(
          snap: true,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.deleteTextField),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: DefaultTabController(
                            length: 2,
                            child: TabBar(
                              unselectedLabelColor: AppColors.mainBlackColor,
                              labelColor: AppColors.mainBlackColor,
                              dividerColor: Colors.transparent,
                              indicatorColor: AppColors.mainColor,
                              tabs: [
                                Tab(text: 'Photos'),
                                Tab(text: 'Videos'),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text("Joylashtirish",
                            style: AppTextStyle.cameraPost),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      child: TabBarView(
                        children: [
                          mediaGridViewBuilder(context, 0, images),
                          mediaGridViewBuilder(context, 1, videos)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

Widget mediaGridViewBuilder(
    BuildContext context, int index, List<AssetEntity> mediaList) {
  return SizedBox.expand(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder<Uint8List?>(
          future: mediaList[index].thumbnailData,
          builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return GestureDetector(
                onTap: () async {},
                child: Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    ),
  );
}
