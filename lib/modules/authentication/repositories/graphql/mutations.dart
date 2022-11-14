String mutateLogin() {
  return r'''
      mutation LogInCustomer($customer: CustomerLoginInput) {
        loginCustomer(data: $customer) {
          jwt
          expires
        }
      }
    ''';
}

String get mutateSignUp {
  return r'''
            mutation CreateCustomer($customer: CreateCustomerInput!) {
              createCustomer(data: $customer) {
                customer {
                  _id
                  email
                  firstName
                  lastName
                  username
                }
                otp {
                  userId
                  expiresAt
                  meta {
                    active
                    createdAt
                  }
                }
                token {
                  jwt
                  expires
                }
              }
            }
        ''';
}

String get mutateUpdateCustomerPassword {
  return r'''
    mutation UpdateCustomerPassword($code: Int!, $password: String!) {
    updateCustomerPassword(data: { code: $code, password: $password }) {
      email
    }
  }
''';
}
