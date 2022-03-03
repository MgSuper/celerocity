// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Widget adsenseAdsView() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'adViewType',
      (int viewID) => IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = 'adview.html'
        ..style.border = 'none');

  return SizedBox(
    width: 320.0,
    height: 100.0,
    child: HtmlElementView(
      viewType: 'adViewType',
    ),
  );
}
