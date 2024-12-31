import 'package:evently_app/Add_Event.dart';
import 'package:evently_app/taps/favorite/love.dart';
import 'package:evently_app/taps/profile.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home/home.dart';
import 'taps/map.dart';

class HomeScreen1 extends StatefulWidget {
  static String routeName = "HomeScreen1";

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int selectedIndex = 0;
  List<Widget> taps = [Home(), MapTap(), Love(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data:
            Theme.of(context).copyWith(canvasColor: AppColors.transparentColor),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManger.iconHomeUnselected)),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManger.iconMap)),
                label: AppLocalizations.of(context)!.map,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManger.iconartUnSelected)),
                label: AppLocalizations.of(context)!.favorite,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManger.iconUserUnSelected)),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
          color: AppColors.WhiteColor,
          width: 4,
        )),
        onPressed: () {
          Navigator.of(context).pushNamed(AddEvent.routeName);
        },
        child: Icon(
          Icons.add,
          color: AppColors.WhiteColor,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: taps[selectedIndex],
    );
  }
}
