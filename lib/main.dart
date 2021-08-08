import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'constants/colors_constant.dart';
import 'screens/about_us.dart';
import 'screens/home.dart';
import 'screens/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((val) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Avenir",
          primaryColor: kPrimaryColor,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kPrimaryColor,
            foregroundColor: kAccentColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
          )),
          textTheme: const TextTheme().apply(
            bodyColor: kAccentColor,
            displayColor: kAccentColor,
          )),
      debugShowCheckedModeBanner: false,
      home: const PseudoHome(),
    );
  }
}

class PseudoHome extends StatefulWidget {
  const PseudoHome({Key? key}) : super(key: key);

  @override
  _PseudoHomeState createState() => _PseudoHomeState();
}

class _PseudoHomeState extends State<PseudoHome> {
  int selectedIndex = 0;
  bool goBack = false;

  final GlobalKey<CurvedNavigationBarState> navBarKey =
      GlobalKey<CurvedNavigationBarState>();
  KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[selectedIndex].currentState!.maybePop();

        debugPrint(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());
        debugPrint("keyboard visibile:" +
            keyboardVisibilityController.isVisible.toString());

        if (isFirstRouteInCurrentTab) {
          if (keyboardVisibilityController.isVisible == false) {
            if (selectedIndex != 0) {
              setState(() {
                navBarKey.currentState!.setPage(0);
                selectedIndex = 0;
              });
            } else {
              setState(() {
                goBack = true;
              });
            }
          }
        }
        if (goBack == false) {
          return goBack;
        } else {
          return goBack;
        }
      },
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: navBarKey,
          backgroundColor: Colors.transparent,
          color: kPrimaryColor,
          items: const [
            Icon(
              Icons.home_outlined,
              color: kAccentColor,
            ),
            Icon(
              Icons.info_outline,
              color: kAccentColor,
            ),
            Icon(
              Icons.monetization_on_outlined,
              color: kAccentColor,
            ),
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          height: 50,
          index: 0,
          animationDuration: const Duration(milliseconds: 400),
          animationCurve: Curves.easeIn,
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Home(navBarKey: navBarKey),
          const AboutUs(),
          const Services(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
