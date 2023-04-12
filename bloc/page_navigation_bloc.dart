import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_authentication/bloc/bottom_navbar_items.dart';
import 'package:mobile_authentication/bloc/event_functions.dart';

part 'page_navigation_event.dart';
part 'page_navigation_state.dart';

class PageNavigationBloc extends Bloc<PageNavigationEvent, NavigationState> {
  PageNavigationBloc() : super(NavigationState(NavbarItems.home, 0)) {
    on<NavigateToHomePage>(navigateToHomePage);
    on<NavigateToSearchPage>(navigateToSearchPage);
    on<NavigateToSettingPage>(navigateToSettingPage);
  }
}
