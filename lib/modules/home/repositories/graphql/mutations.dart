String get mutateLikeEvent {
  return r'''
      mutation LikeEvent($id: ID!) {
        likeEvent(id: $id) {
          status
        }
      }
        ''';
}

String get mutateUnlikeEvent {
  return r'''
      mutation UnLikeEvent($id: ID!) {
        unlikeEvent(id: $id) {
          status
        }
      }
        ''';
}

String get mutateLikeReview {
  return r'''
      mutation LikeReview($id: ID!) {
        likeReview(id: $id) {
          status
        }
      }
        ''';
}

String get mutateUnlikeReviews {
  return r'''
      mutation UnLikeReview($id: ID!) {
        unlikeReview(id: $id) {
          status
        }
      }
        ''';
}
