class Link {
  int id = 0;
  String address = '';
  var icon = _IconLinks();

  setData(_data) {
    id = _data['id'];
    address = _data['address'];
    icon.setData(_data['icon']);
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

  setData(Map _data) {
    id = _data['id'];
    title = _data['title'];
    url = _data['url'];
    redirect = _data['redirect'];
    pattern = _data['pattern'];
  }
}
