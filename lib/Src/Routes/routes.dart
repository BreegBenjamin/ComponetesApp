import 'package:componetes_app/Src/Pages/card_pages.dart';
import 'package:componetes_app/Src/Pages/form_page.dart';
import 'package:componetes_app/Src/Pages/input_page.dart';
import 'package:componetes_app/Src/Pages/listview_page.dart';
import 'package:componetes_app/Src/Pages/slider_page.dart';
import 'package:componetes_app/Src/Pages/HomePage.dart';
import 'package:componetes_app/Src/Pages/alert_page.dart';
import 'package:componetes_app/Src/Pages/avatar_page.dart';
import 'package:componetes_app/Src/Pages/animated_container.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "home": (_) => HomePage(),
    "alert": (_) => AlertPage(),
    "avatar": (_) => AvatarPage(),
    "card": (_) => CardPage(),
    "form": (_) => FormPage(),
    "animatedContainer": (_) => AnimatedContainerPage(),
    "input": (_) => InputPage(),
    "slider": (_) => SliderPage(),
    "list": (_) => ListViewPage(),
  };
}
