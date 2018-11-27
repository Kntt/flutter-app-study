import 'package:fluro/fluro.dart';
import './handlers.dart';

class Routes {
  static String scaner = '/scaner';
  static String visa = '/visa';

  static void configureRoutes(Router router) {
    router.define(scaner, handler: scanerHandler);
    router.define(visa, handler: visaHandler);
  }
}