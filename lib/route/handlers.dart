import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:xiaofaner/pages/scaner/ScanerPage.dart';
import 'package:xiaofaner/pages/visa/visaPage.dart';

var scanerHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    return new ScanerPage();
  }
);

var visaHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    return new VisaPage();
  }
);