import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lost_angeles/core/models/safe_area_dimensions.dart';

class SafeAreaService {
  StreamController<SafeAreaDimensions> safeAreaController =
      StreamController<SafeAreaDimensions>();

  update(BoxConstraints constraints) {
    safeAreaController.add(new SafeAreaDimensions(
        height: constraints.maxHeight, width: constraints.maxWidth));
  }
}
