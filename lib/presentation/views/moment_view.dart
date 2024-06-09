import 'package:flutter/material.dart';
import 'package:flutter_booking/presentation/controllers/moment_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';

class MomentPage extends GetView<MomentController> {
  const MomentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      _buildMomentItem(
                        avatar:
                            'https://www.w3schools.com/w3images/avatar1.png',
                        name: 'User name',
                        images: [
                          'https://www.w3schools.com/w3images/avatar2.png',
                          'https://www.w3schools.com/w3images/avatar3.png',
                          'https://www.w3schools.com/w3images/avatar4.png',
                        ],
                        description: '和哥哥一起慶祝生日！',
                        onTapMore: () {},
                        onTapLike: () {},
                        onTapComment: () {},
                      ),
                      massiveVerticalSpace,
                      _buildMomentItem(
                        avatar:
                            'https://www.w3schools.com/w3images/avatar1.png',
                        name: 'User name',
                        images: [
                          'https://www.w3schools.com/w3images/avatar2.png',
                          'https://www.w3schools.com/w3images/avatar3.png',
                          'https://www.w3schools.com/w3images/avatar4.png',
                        ],
                        description: '和哥哥一起慶祝生日！',
                        onTapMore: () {},
                        onTapLike: () {},
                        onTapComment: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: 79,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColorExtension("#FAFAFA"),
                  boxShadow: [
                    BoxShadow(
                      color: AppColorExtension("#A6A6AA"),
                      offset: const Offset(0, -0.33),
                    ),
                  ],
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: controller.addPost,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.darkGray,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 22,
                        color: AppColor.darkGray,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildMomentItem({
  required String avatar,
  required String name,
  required List<String> images,
  required String description,
  required Function onTapMore,
  required Function onTapLike,
  required Function onTapComment,
}) {
  return Column(
    children: [
      // Header
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            _buildAvatar(avatarUrl: avatar),
            smallHorizontalSpace,
            Text(
              name,
              style: AppTextStyle.mediumSizeRegularWeight(
                color: AppColor.darkGray,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => onTapMore.call(),
              child: const Icon(
                Icons.more_horiz,
                size: 22,
              ),
            )
          ],
        ),
      ),
      smallVerticalSpace,
      // Carousel Slider
      SizedBox(
        width: screenWidth,
        height: 375,
        child: PageView.builder(
          itemCount: images.length,
          itemBuilder: (_, pageIndex) {
            final String url = images[pageIndex];
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColorExtension('#121212').withOpacity(.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${pageIndex + 1}/${images.length}',
                        style: AppTextStyle.smallSizeRegularWeight(
                          color: AppColorExtension(
                            ('#F9F9F9'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: (screenWidth / 2) - (10 * (images.length)) + 14,
                    child: Row(
                      children: List.generate(
                        images.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                            width: index == pageIndex ? 10 : 6,
                            height: index == pageIndex ? 10 : 6,
                            decoration: BoxDecoration(
                              color: index == pageIndex
                                  ? AppColorExtension('#3897F0')
                                  : AppColor.black.withOpacity(.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
      mediumVerticalSpace,
      // Like & Comment Icons
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => onTapLike.call(),
              child: const Icon(
                Icons.favorite_border_outlined,
                size: 24,
              ),
            ),
            mediumHorizontalSpace,
            GestureDetector(
              onTap: () => onTapLike.call(),
              child: const Icon(
                Icons.mode_comment_outlined,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      mediumVerticalSpace,
      // Like Users
      _buildLikedUsers(),
      mediumVerticalSpace,
      // Post Description
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: AppTextStyle.mediumSizeMediumWeight(
                color: AppColor.darkGray,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: name,
                  style: AppTextStyle.mediumSizeRegularWeight(
                    color: AppColor.darkGray,
                  ),
                ),
                TextSpan(
                  text: '\t$description',
                ),
              ],
            ),
          ),
        ),
      ),
      mediumVerticalSpace,
      // Commented Users
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'View all 100 Comments',
            style: AppTextStyle.mediumSizeRegularWeight(
              color: AppColor.darkGray,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildLikedUsers() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        _buildAvatar(
          width: 22,
          height: 22,
          avatarUrl: 'https://www.w3schools.com/w3images/avatar1.png',
        ),
        smallHorizontalSpace,
        Text(
          '顏老師与9,840區友\t',
          style: AppTextStyle.mediumSizeSemiBoldWeight(
            color: AppColor.darkGray,
          ),
        ),
        Text(
          '按讚',
          style: AppTextStyle.mediumSizeRegularWeight(
            color: AppColor.darkGray,
          ),
        ),
      ],
    ),
  );
}

Widget _buildAvatar({
  double? width,
  double? height,
  required String avatarUrl,
}) {
  return Container(
    width: width ?? 35,
    height: height ?? 35,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(avatarUrl),
        fit: BoxFit.cover,
      ),
      shape: BoxShape.circle,
    ),
  );
}
