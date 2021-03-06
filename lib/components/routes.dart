

import 'package:login/components/root_page.dart';
import 'package:login/components/switcher_page.dart';
import 'package:login/pages/page_login.dart';

getRoutes() {
    return {
      '/': (context) => new RootPage(),
      '/loginPage': (context) => new LoginPage(),
      '/switcher': (context) => new PageSwitcher(),
   };
  }