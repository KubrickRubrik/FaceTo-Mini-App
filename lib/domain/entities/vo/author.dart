import 'package:facetomini/core/config/entity.dart';

final class AuthorEntity {
  final int idApp;
  final String nick;
  final String description;
  final ImageAuthor image;
  final StatAuthor stat;
  final List<LinkAuthor> links;
  final int follower;

  AuthorEntity({
    required this.idApp,
    required this.nick,
    required this.description,
    required this.image,
    required this.stat,
    required this.links,
    required this.follower,
  });

  AuthorEntity.empty()
      : idApp = 0,
        nick = '',
        description = '',
        image = ImageAuthor.empty(),
        stat = StatAuthor.empty(),
        links = [],
        follower = -1;
}

class ImageAuthor {
  final String logo;
  final String banner;
  final typeOriginLogo = TypeSourceImage.server;
  final typeOriginBanner = TypeSourceImage.server;

  ImageAuthor({
    required this.logo,
    required this.banner,
  });

  ImageAuthor.empty()
      : logo = '',
        banner = '';
}

class StatAuthor {
  final RankAuthor rank;
  final int level;
  final int rating;
  final int countSub;
  StatAuthor({
    required this.rank,
    required this.level,
    required this.rating,
    required this.countSub,
  });

  StatAuthor.empty()
      : rank = RankAuthor.empty(),
        level = 0,
        rating = 0,
        countSub = 0;
}

class RankAuthor {
  final int id;
  final String title;

  RankAuthor({
    required this.id,
    required this.title,
  });

  RankAuthor.empty()
      : id = 0,
        title = '';
}

class LinkAuthor {
  final int id;
  final String address;
  final IconAuthor icon;

  LinkAuthor({
    required this.id,
    required this.address,
    required this.icon,
  });

  LinkAuthor.empty()
      : id = 0,
        address = '',
        icon = IconAuthor.empty();
}

class IconAuthor {
  final int id;
  final int redirect;
  final String title;
  final String url;
  final String pattern;

  IconAuthor({
    required this.id,
    required this.redirect,
    required this.title,
    required this.url,
    required this.pattern,
  });

  IconAuthor.empty()
      : id = 0,
        redirect = 0,
        title = '',
        url = '',
        pattern = '';
}
