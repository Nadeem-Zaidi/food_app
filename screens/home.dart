import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/authentication_bloc/user_authentication_bloc.dart';
import 'package:mobile_authentication/bloc/bottom_navbar_items.dart';
import 'package:mobile_authentication/bloc/page_navigation_bloc.dart';

import 'package:mobile_authentication/helper_screen/phone_loading_screen.dart';
import 'package:mobile_authentication/screens/bottom_navitation_item.dart';
import 'package:mobile_authentication/screens/settings/settings.dart';
import 'package:mobile_authentication/screens/user_profile/user_profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    PageNavigationBloc bloc = BlocProvider.of<PageNavigationBloc>(context);
    return Scaffold(
      bottomNavigationBar: BlocBuilder<PageNavigationBloc, NavigationState>(
        builder: ((context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                bloc.add(NavigateToHomePage());
              } else if (index == 1) {
                bloc.add(NavigateToSearchPage());
              } else if (index == 2) {
                bloc.add(NavigateToSettingPage());
              }
            },
          );
        }),
      ),
      body: Stack(children: [
        // HomePage(),

        BlocConsumer<PageNavigationBloc, NavigationState>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            if (state is PhoneLoadingState) {
              return PhoneLoadingScreen();
            } else if (state.navBarItems == NavbarItems.settings) {
              print(state);
              return Settings();
            } else if (state.navBarItems == NavbarItems.search) {
              print(state);
              return UserProfile();
            }
            return Container();
          }),
        ),
      ]),
    );
  }
}
