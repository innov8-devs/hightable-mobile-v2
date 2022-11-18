import 'dart:developer';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'gql_exceptions.freezed.dart';

@freezed
abstract class GQLExceptions with _$GQLExceptions {
  const factory GQLExceptions.unAuthorisedRequest() = UnauthorisedRequest;

  const factory GQLExceptions.noInternetConnection() = NoInternetError;

  const factory GQLExceptions.internalServerError() = InternalServerError;

  const factory GQLExceptions.formatException() = FormatException;

  const factory GQLExceptions.unableToProcess() = UnableToProcessError;

  const factory GQLExceptions.unExpectedError() = UnExpectedError;

  const factory GQLExceptions.defaultError(String error) = DefaultError;

  // ignore: type_annotate_public_apis, prefer_constructors_over_static_methods
  static GQLExceptions getGQLException(exception) {
    if (exception is Exception) {
      log('Exception is: $exception');
      try {
        GQLExceptions? gqlException;
        if (exception is OperationException) {
          final errorMessage = exception
              .graphqlErrors[0].extensions!['response']['body']['data'];
          gqlException = GQLExceptions.defaultError(errorMessage);
        } else if (exception is SocketException) {
          gqlException = const GQLExceptions.noInternetConnection();
        } else {
          gqlException = const GQLExceptions.unExpectedError();
        }
        return gqlException;
      } on FormatException {
        return const GQLExceptions.formatException();
      } catch (_) {
        return const GQLExceptions.unExpectedError();
      }
    } else {
      if (exception.toString().contains('Is not a subtype of')) {
        return const GQLExceptions.unableToProcess();
      } else {
        return const GQLExceptions.unExpectedError();
      }
    }
  }

  static String getErrorMessage(GQLExceptions gqlExceptions) {
    String errorMessage = '';
    gqlExceptions.when(
      unAuthorisedRequest: () {
        errorMessage = 'Unauthorised request';
      },
      noInternetConnection: () {
        errorMessage = 'No internet connection';
      },
      internalServerError: () {
        errorMessage = 'Internal Server Error';
      },
      formatException: () {
        errorMessage = 'Unexpected error occurred';
      },
      unableToProcess: () {
        errorMessage = 'Unable to process the data';
      },
      unExpectedError: () {
        errorMessage = 'Unexpected error occurred';
      },
      defaultError: (String error) {
        errorMessage = error;
      },
    );
    return errorMessage;
  }
}
