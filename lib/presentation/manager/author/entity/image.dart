import 'package:facetomini/core/config/entity.dart';

class ImageProfile {
  String logo = '';
  String banner = '';
  final typeOriginLogo = TypeSourceImage.server;
  final typeOriginBanner = TypeSourceImage.server;

  setData(_data) {
    logo = _data['logo'].toString();
    banner = _data['banner'].toString();
  }
}
