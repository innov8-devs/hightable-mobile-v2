// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../al_flutter_core.dart';

part 'gql_result.freezed.dart';

@freezed
abstract class GQLResult<T> with _$GQLResult<T> {
  const factory GQLResult.success({required T data}) = Success<T>;

  const factory GQLResult.failure({required GQLExceptions error}) = Failure<T>;
}
