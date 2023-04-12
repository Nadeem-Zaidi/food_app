part of 'page_navigation_bloc.dart';

abstract class PageNavigationEvent extends Equatable {
  const PageNavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToUserProfilePage extends PageNavigationEvent {}

class NavigateToSettingPage extends PageNavigationEvent {}

class NavigateToHomePage extends PageNavigationEvent {}

class NavigateToSearchPage extends PageNavigationEvent {}
