part of 'author.dart';

mixin _State {
  final pageData = _PageData();
  final sectionLink = SectionLink();
  //
  // Load page
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isNoneContent;
  var isViewDescriptionLink = false;
}

final class _PageData {
  int idApp = 0;
  String nick = '';
  String about = '';
  final image = ImageProfile();
  final stat = StatProfile();
  List<SectionLink> links = [];

  void _clear() {
    idApp = 0;
    about = '';
    stat.clear();
    links.clear();
  }

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(AuthorEntity data) {}
}
