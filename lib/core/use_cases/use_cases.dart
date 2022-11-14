import 'package:equatable/equatable.dart';

mixin UseCases<T, Params> {
  Future<T> call(Params params);
}

mixin StreamUseCases<T, Params> {
  Stream<T> call(Params params);
}

class NoParams extends Equatable {
  @override
  @override
  List<Object> get props => [];
}
