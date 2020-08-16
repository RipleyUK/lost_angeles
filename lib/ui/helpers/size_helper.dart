import 'package:flutter/material.dart';
import 'package:lost_angeles/core/models/safe_area_dimensions.dart';
import 'package:provider/provider.dart';

double panelHeight(BuildContext context) {
  return Provider.of<SafeAreaDimensions>(context).height - 20;
}

double bodyHeight(BuildContext context) {
  return Provider.of<SafeAreaDimensions>(context).height;
}
