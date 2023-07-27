part of 'author.dart';

mixin _State {
  final pageData = _PageData();
  // Load page
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isNoneContent;
  var isViewDescriptionLink = false;
}

final class _PageData {
  var author = AuthorEntity.empty();
  final sectionLink = SectionLink();
  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(AuthorEntity data) {
    author = data;
  }
}
