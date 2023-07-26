class SectionLink {
  int id = 0;
  String address = '';
  var icon = _IconLinks();

  setData(SectionLink data) {
    id = data.id;
    address = data.address;
    icon.setData(data.icon);
  }

  clear() {
    address = '';
    icon = _IconLinks();
  }
}

final class _IconLinks {
  int id = 0;
  String title = '';
  String url = '';
  int redirect = 0;
  String pattern = '';

  setData(_IconLinks data) {
    id = data.id;
    title = data.title;
    url = data.url;
    redirect = data.redirect;
    pattern = data.pattern;
  }
}
