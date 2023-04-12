part of 'page_navigation_bloc.dart';

class NavigationState extends Equatable {
  final NavbarItems navBarItems;
  final int index;
  NavigationState(this.navBarItems, this.index);
  @override
  List<Object> get props => [this.navBarItems, this.index];
}
