import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/widgets/circle_button.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(null, Icons.search, 25.0, () => {print('Search')}),
              CircleButton(null, MdiIcons.facebookMessenger, 25.0,
                  () => {print('Messenger')}),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(null, currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(null, onlineUsers),
            ),
          )
        ],
      ),
    );
  }
}
