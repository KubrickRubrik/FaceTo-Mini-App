final class AuthorModel {
  final int idApp;
  final String nick;
  final String description;
  final ImageAuthorModel image;
  final StatAuthorModel stat;
  final List<LinkAuthorModel> links;
  final int follower;

  AuthorModel(Map<String, dynamic> data)
      : idApp = data['id_app'],
        nick = data['nick'],
        description = data['about'],
        image = ImageAuthorModel(data['image']),
        stat = StatAuthorModel(data['stat']),
        links = _makeListIcons(data['links']),
        follower = data['follower'];

  // Forming a list of these icons
  static List<LinkAuthorModel> _makeListIcons(List<Map<String, dynamic>> data) {
    return data.map((link) {
      return LinkAuthorModel(
        id: link['id'],
        address: link['address'],
        icon: IconAuthorModel(link['icon']),
      );
    }).toList();
  }
}

class ImageAuthorModel {
  final String logo;
  final String banner;
  final List<LinkAuthorModel> links = [];
  ImageAuthorModel(Map<String, dynamic> data)
      : logo = data['logo'],
        banner = data['banner'];
}

class StatAuthorModel {
  final RankAuthorModel rank;
  final int level;
  final int rating;
  final int countSub;
  StatAuthorModel(Map<String, dynamic> data)
      : rank = RankAuthorModel(
          id: data['rank']['id'],
          title: data['rank']['title'],
        ),
        level = data['level'],
        rating = data['rating'],
        countSub = data['count_sub'];
}

class RankAuthorModel {
  final int id;
  final String title;

  RankAuthorModel({
    required this.id,
    required this.title,
  });
}

class LinkAuthorModel {
  final int id;
  final String address;
  final IconAuthorModel icon;

  LinkAuthorModel({
    required this.id,
    required this.address,
    required this.icon,
  });
}

class IconAuthorModel {
  final int id;
  final int redirect;
  final String title;
  final String url;
  final String pattern;

  IconAuthorModel(Map<String, dynamic> data)
      : id = data['id'],
        redirect = data['redirect'],
        title = data['title'],
        url = data['url'],
        pattern = data['pattern'];
}
