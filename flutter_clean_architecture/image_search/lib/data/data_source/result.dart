import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  factory Result.success(T data) = Success<T>;
  factory Result.error(String message) = Error<T>;
}
// class Success<T> implements Result<T> {
//   final T data;
//   Success(this.data);
// }

// class Error<T> implements Result<T> {
//   final String message;
//   Error(this.message);
// }
