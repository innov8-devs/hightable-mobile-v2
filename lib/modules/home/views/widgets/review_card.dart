import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'package:hightable_mobile_v2/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hightable_mobile_v2/utils/ui/app_colors.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeReviewCard extends StatelessWidget {
  final Review review;
  const HomeReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    backgroundImage: CachedNetworkImageProvider(
                      (review.user?.profileImage ?? '').toString().isEmpty
                          ? AppConstants.sampleProfilePlaceHolder
                          : review.user?.profileImage,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${review.user?.lastName ?? ''} ${review.user?.firstName ?? ''}',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF0F264C),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(SvgAssets.dotIcon),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              timeago.format(
                                  DateTime.parse(review.meta?.createdAt ?? '')),
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF0F264C),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '@${review.user?.username ?? ''}',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF8D8D8D),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     AppSvgs.homeMoreSVG,
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  // Text(
                  //   'Danfo Bistro',
                  //   style: GoogleFonts.montserrat(
                  //     color: const Color(0xFF0055FF),
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 13,
                  //   ),
                  // ),
                  Text(
                    review.business?.name ?? '',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF0055FF),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${review.reviewType ?? ''} Review",
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFF8D8D8D),
                      fontWeight: FontWeight.w500,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
              RatingBar.builder(
                initialRating: review.rating?.toDouble() ?? 0,
                minRating: 1,
                ignoreGestures: true,
                direction: Axis.horizontal,
                glow: true,
                itemSize: 20,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => SvgPicture.asset(
                  SvgAssets.homeRatingStarSVG,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                review.body ?? '',
                style: GoogleFonts.montserrat(
                  color: const Color(0xFF666670),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              // Text(
              //   '... See more',
              //   style: GoogleFonts.montserrat(
              //     color: const Color(0xFF666670),
              //     fontWeight: FontWeight.w400,
              //     fontSize: 12,
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 138,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: NetworkImage(
                      AppConstants.sampleDanfoImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LikeButton(
                    size: 24,
                    onTap: (isLiked) async => false,
                    circleColor: const CircleColor(
                      start: Color(0xff00ddff),
                      end: Color(0xff0099cc),
                    ),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    isLiked: review.likedByUser,
                    likeBuilder: (bool isLiked) {
                      return SvgPicture.asset(
                        SvgAssets.homeLikeSVG,
                        color: isLiked
                            ? AppColors.prim1
                            : Colors.grey.withOpacity(0.5),
                      );
                    },
                    likeCount: review.likes ?? 0,
                    countPostion: CountPostion.right,
                    countBuilder: (int? count, bool isLiked, String text) {
                      Widget result;

                      result = Text(
                        text,
                        style: const TextStyle(
                          color: Color(0xFF0F264C),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      );

                      return result;
                    },
                  ),
                  LikeButton(
                    size: 24,
                    onTap: (isLiked) async => false,
                    circleColor: const CircleColor(
                      start: Color(0xff00ddff),
                      end: Color(0xff0099cc),
                    ),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff0099cc),
                    ),
                    isLiked: review.likedByUser,
                    likeBuilder: (bool isLiked) {
                      return SvgPicture.asset(
                        SvgAssets.homeDisLikeSVG,
                        color: isLiked
                            ? AppColors.prim1
                            : Colors.grey.withOpacity(0.5),
                      );
                    },
                    likeCount: review.likes ?? 0,
                    countPostion: CountPostion.right,
                    countBuilder: (int? count, bool isLiked, String text) {
                      Widget result;

                      result = Text(
                        text,
                        style: const TextStyle(
                          color: Color(0xFF0F264C),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      );

                      return result;
                    },
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.homeCommentSVG,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '24',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF0F264C),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    SvgAssets.homeShareSVG,
                    width: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
