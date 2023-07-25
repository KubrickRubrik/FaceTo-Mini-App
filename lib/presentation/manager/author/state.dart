part of 'author.dart';

mixin _State {
  final pageData = _PageData();
  //
  // Load page
  var statePage = StatusContent.isNoneContent;
  // var stateSpinPage = StatusContent.isNoneContent;
}

final class _PageData {
  int idApp = 0;
  String nick = '';
  String about = '';
  final image = ImageProfile();
  final stat = StatProfile();
  List<Link> links = [];

  clear() {
    idApp = 0;
    about = '';
    stat.clear();
    links.clear();
  }
}
