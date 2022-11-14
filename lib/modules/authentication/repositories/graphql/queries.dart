String get queryGetUser {
  return r'''
      query FindOneCustomer($customer: QueryCustomerInput!) {
        findOneCustomer(data: $customer) {
          _id
          email
          username
          firstName
          lastName
          middleName
          gender
          about
          dob
          instagram
          twitter
          address
          verified
          followerCount
          followingCount
          reviewCount
          profileImage
          interests {
            _id
            name
          }
          youFollow
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

String get queryVerifyCustomer {
  return r'''
    query VerifyCustomer($code: Int!) {
      verifyCustomer (code: $code) {
        email
      }
    }
''';
}

String get queryCustomerPasswordReset {
  return r'''
    query CustomerPasswordReset($email: String!) {
      customerPasswordReset (email: $email) {
        email
      }
    }
''';
}
