import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../al_flutter_core.dart';
import '../../db/user_db.dart';

/// The service responsible for networking requests
class ALGQLClient {
  ALGQLClient(this._gqlConfig);

  final GQLConfig _gqlConfig;

  ///[getGraphQLClient]
  ValueNotifier<GraphQLClient> defaultGraphQLClient() {
    final HttpLink httpLink = HttpLink(_gqlConfig.baseUrl);
    return ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );
  }

  Future<ValueNotifier<GraphQLClient>> _getGraphQLClient() async {
    return ValueNotifier(
      GraphQLClient(
        link: await _getAuthLink().then((value) {
          return value.concat(
            HttpLink(
              _gqlConfig.baseUrl,
            ),
          );
        }),
        cache: GraphQLCache(),
      ),
    );
  }

  Future<AuthLink> _getAuthLink() async {
    String? getAuthToken;

    if (_gqlConfig.bearerToken != null) {
      final token = await _gqlConfig.bearerToken!();
      if (token.isNotEmpty) {
        getAuthToken = token;
      } else {
        getAuthToken = UserDb.getInstance()?.accessToken ?? '';
      }
    }

    return AuthLink(
      getToken: () async => getAuthToken!,
    );
  }

  /// Expose the [graphlQlClient]
  Future<ValueNotifier<GraphQLClient>> get getGraphQlClient =>
      _getGraphQLClient();

  ///
  Future<QueryResult> gpMutate({
    required String mutationDocument,
    Map<String, dynamic>? data,
  }) async {
    QueryResult queryResult;
    try {
      queryResult = await _getGraphQLClient().then((value) {
        return value.value.mutate(
          MutationOptions(
            document: gql(mutationDocument),
            variables: data!,
          ),
        );
      });

      // ignore: unused_catch_stack
    } on OperationException catch (error, stacktrace) {
      log('Operation Error is: $error');
      rethrow;
      // ignore: unused_catch_stack
    } on SocketException catch (error, stacktrace) {
      throw SocketException(error.toString());
    } catch (e, s) {
      log('Error is: $e');
      log(s.toString());
      rethrow;
    }

    if (queryResult.hasException) {
      throw OperationException(
        linkException: queryResult.exception!.linkException,
        graphqlErrors: queryResult.exception!.graphqlErrors,
      );
    } else {
      return queryResult;
    }
  }

  ///.
  Future<QueryResult> gpQuery({
    required String queryDocument,
    Map<String, dynamic>? data,
  }) async {
    QueryResult queryResult;
    try {
      queryResult = await _getGraphQLClient().then((value) {
        return value.value.query(
          QueryOptions(
            document: gql(queryDocument),
            variables: data ?? {},
          ),
        );
      });
      // ignore: unused_catch_stack
    } on OperationException catch (error, stacktrace) {
      rethrow;
      // ignore: unused_catch_stack
    } on SocketException catch (error, stacktrace) {
      throw SocketException(error.toString());
    } catch (e) {
      rethrow;
    }
    if (queryResult.hasException) {
      throw OperationException(
        linkException: queryResult.exception!.linkException,
        graphqlErrors: queryResult.exception!.graphqlErrors,
      );
    } else {
      return queryResult;
    }
  }
}
