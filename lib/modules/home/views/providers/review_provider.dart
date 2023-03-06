import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hightable_mobile_v2/core/al_flutter_core.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/review_model.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/get_reviews.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/like_review.dart';
import 'package:hightable_mobile_v2/modules/home/domain/usecases/unlike_review.dart';

ChangeNotifierProvider<ReviewProvider> signInProvider =
    ChangeNotifierProvider((ref) => ReviewProvider(ref: ref));

class ReviewProvider extends ChangeNotifier {
  ReviewProvider({required this.ref});

  Ref ref;
  List<Review> _reviews = [];

  List<Review> get reviews => _reviews;

  Future<bool> getReviews() async {
    bool requestStatus = false;
    final GetReviews getReviews = locator();
    final response = await getReviews(NoParams());
    response.when(success: (data) {
      _reviews = data;
      requestStatus = true;
    }, failure: (error) {
      requestStatus = false;
    });

    return requestStatus;
  }

  Future<bool> likeReview(String id) async {
    bool requestStatus = false;
    final LikeReviews likeReview = locator();
    final response = await likeReview(id);
    response.when(success: (data) {
      requestStatus = true;
    }, failure: (error) {
      requestStatus = false;
    });

    return requestStatus;
  }

  Future<bool> unlikeReview(String id) async {
    bool requestStatus = false;
    final UnLikeReviews unlikeReview = locator();
    final response = await unlikeReview(id);
    response.when(success: (data) {
      requestStatus = true;
    }, failure: (error) {
      requestStatus = false;
    });

    return requestStatus;
  }
}
