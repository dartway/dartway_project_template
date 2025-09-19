part of '../ui_kit.dart';

class NitValidation {
  static String? Function(T? value) required<T>({
    String errorText = 'Обязательное поле',
  }) =>
      (T? value) => (value == null || (value is String && value.isEmpty))
          ? 'Обязательноe поле'
          : null;
}
