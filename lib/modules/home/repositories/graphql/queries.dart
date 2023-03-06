String get queryRecommendedResturants {
  return '''
    query{
      recommendRestaurants{
        _id,
        shortId,
        name,
        email,
        telephone,
        verified,
        reviewCount,
        followerCount,
        followingCount,
        address,
        description,
        rating,
        youFollow,
        logo,
        pdfMenu,
        followers {
            data {
              ... on Restaurant {
                _id
                name
                rating
                youFollow
              }
              ... on Customer {
                _id
                firstName
                lastName
                username
                youFollow
              }
            }
          }
          followings {
            data {
              ... on Restaurant {
                _id
                name
                rating
                youFollow
              }
              ... on Customer {
                _id
                firstName
                lastName
                username
                youFollow
              }
            } 
          }
      }
    }
    ''';
}

String get queryRecommendedEvents {
  return '''
    query{
      recommendEvents{
        _id
        title
        description
        images
        likedByUser
        start
        end
         address{
          street
          city
          state
          country
        }
        user{
          _id
          email
          username
          firstName
          lastName
          middleName
          profileImage
          gender
          dob
          followerCount
          followingCount
        }
        location {
          latitude
          longitude        
        }
      }
    }
    ''';
}

String get queryReviews {
  return r'''
    query($data: QueryReviewInput!){
      findReviews(data: $data){
        body,
        _id,
        body,
        images,
        user{
          _id,
          email,
          username,
          firstName,
          lastName,
          middleName,
          profileImage,
          gender,
          dob,
          followerCount,
          followingCount,
        },
        businessId,
        businessType,
        reviewType,
        meta{
          active,
          createdAt,
          activatedAt,
          deactivatedAt,
          updatedAt,
        },
        likes,
        likesCount,
        likedByUser,
        rating,
        business {
          ... on Restaurant {
            _id
            name
          }
          ... on Hotel {
            _id
            name
          }
        }
      }
    }
    ''';
}
