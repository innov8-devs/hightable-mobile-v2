String get mutateAddManyInterests {
  return r'''
      mutation AddManyToInterests($interests: [ID!]!) {
        addManyToInterests(interests: $interests) {
          status
        }
      }
        ''';
}
