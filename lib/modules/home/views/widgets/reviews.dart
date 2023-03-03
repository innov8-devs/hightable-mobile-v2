import 'package:flutter/material.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/meta.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeReviewCard(
        review: Review(
          body: "Wow",
          id: "1",
          images: [],
          likes: 1,
          meta: const Meta(
            activatedAt: "",
            active: true,
            upddatedAt: "",
            deactivatedAt: "",
            createdAt: "2022-01-23T15:00:00.00Z",
          ),
          rating: 5,
          restaurantId: "2213",
          user: null,
          business: null,
          businessType: "restaurant",
          likedByUser: true,
          reviewType: "review",
        ),
      ),
    );
  }
}
