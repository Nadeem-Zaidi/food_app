import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_authentication/bloc/bottom_navbar_items.dart';
import 'package:mobile_authentication/bloc/page_navigation_bloc.dart';

Future<void> navigateToHomePage(
    NavigateToHomePage event, Emitter<NavigationState> emit) async {
  emit(NavigationState(NavbarItems.home, 0));
}

Future<void> navigateToSearchPage(
    NavigateToSearchPage event, Emitter<NavigationState> emit) async {
  emit(NavigationState(NavbarItems.search, 1));
}

Future<void> navigateToSettingPage(
    NavigateToSettingPage event, Emitter<NavigationState> emit) async {
  emit(NavigationState(NavbarItems.settings, 2));
}
