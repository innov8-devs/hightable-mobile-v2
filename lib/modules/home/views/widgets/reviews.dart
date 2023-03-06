import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/modules/home/views/providers/review_provider.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Consumer(
          builder: (_, ref, child) {
            final reviewController = ref.watch(reviewProvider);
            reviewController.getReviews();
            return ListView.separated(
              itemBuilder: (context, index) {
                final review = reviewController.reviews[index];
                return HomeReviewCard(review: review);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemCount: reviewController.reviews.length,
            );
          },
        ),
      ),
    );
  }
}
