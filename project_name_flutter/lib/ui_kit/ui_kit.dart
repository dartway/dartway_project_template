import 'dart:async';
import 'dart:math';

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:collection/collection.dart';
import 'package:conditional_parent_widget/conditional_parent_widget.dart';
import 'package:dartway_app/dartway_app.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nit_router/nit_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part '1_essentials/app_button.dart';
part '1_essentials/app_checkbox.dart';
part '1_essentials/app_text.dart';
part '1_essentials/app_text_form_field.dart';
part '2_frequent/multi_link_text.dart';
part '2_frequent/phone_text_field.dart';
part '2_frequent/show_app_bottom_sheet_extension.dart';
part '3_special/auth/checkbox_form_field.dart';
part '3_special/auth/pin_code_text_field.dart';
part '3_special/qr_floating_action_button.dart';
part 'nit_legacy/nit_build_context_extension.dart';
part 'nit_legacy/nit_device_frame.dart';
part 'nit_legacy/nit_validation.dart';
part 'private/app_button_style.dart';
part 'private/app_text_style.dart';
part 'private/guarded_button.dart';
part 'utils/formatters.dart';

DwCallback wipProgressNotificationCallback = DwCallback.create(
  () => dw.notify.success('Функция в разработке'),
);
