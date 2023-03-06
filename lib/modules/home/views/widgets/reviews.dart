import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/modules/home/views/providers/review_provider.dart';
import 'package:hightable_mobile_v2/modules/home/views/widgets/review_card.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer(
        builder: (_, ref, child) {
          final reviewController = ref.watch(reviewProvider);
          reviewController.getReviews();
          return ListView.builder(
            itemBuilder: (context, index) {
              final review = reviewController.reviews[index];
              return HomeReviewCard(review: review);
            },
            itemCount: reviewController.reviews.length,
          );
        },
      ),
    );
  }
}
