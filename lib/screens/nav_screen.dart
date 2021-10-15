import 'package:facebook_clone/screens/homme_screen.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  title: const Text(
                    'facebook',
                    style: TextStyle(
                      color: Palette.facebookBlue,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                    CircleButton(
                        null, Icons.search, 25.0, () => {print('Search')}),
                    CircleButton(null, MdiIcons.facebookMessenger, 25.0,
                        () => {print('Messenger')}),
                  ],
                  bottom: Tab(
                    child: CustomTabBar(
                        icons: _icons,
                        selectedIndex: _selectedIndex,
                        onTab: (index) =>
                            setState(() => _selectedIndex = index)),
                  ),
                ),
              ];
            },
            body: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ));
  }
}
