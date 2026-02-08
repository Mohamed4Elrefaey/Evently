import 'package:evently/core/providers/User_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/Add_event/add_event_screen.dart';
import 'package:evently/ui/home/taps/Home_tab/Favorite/favorite_tab.dart';
import 'package:evently/ui/home/taps/Home_tab/Home_tap.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  static const routeName = "HomeScreen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTap(), FavoriteTab(), ProfileTab()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset(AssetsManager.add),
        onPressed: () {
          Navigator.pushNamed(context, AddEventScreen.routeName);
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.home),
            selectedIcon: SvgPicture.asset(AssetsManager.selectedHome),
            label: StringsManager.home,
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.heart),
            selectedIcon: SvgPicture.asset(AssetsManager.selectedHeart),
            label: StringsManager.favorite,
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AssetsManager.user),
            selectedIcon: SvgPicture.asset(AssetsManager.selectedUer),
            label: StringsManager.profile,
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
