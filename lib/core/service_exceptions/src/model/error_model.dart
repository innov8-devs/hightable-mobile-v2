class GQLErrorModel {
  const GQLErrorModel({
    this.code,
    this.message,
    this.data,
  });

  final String? code;
  final String? message;
  final String? data;
}
