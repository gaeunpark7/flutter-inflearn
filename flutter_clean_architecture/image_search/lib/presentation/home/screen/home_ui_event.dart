import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_event.freezed.dart';

@freezed
sealed class HomeUiEvent<T> with _$HomeUiEvent<T> {
  factory HomeUiEvent.showSnackBar(String message) = ShowSnackBar;
}
