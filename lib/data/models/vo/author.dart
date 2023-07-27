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
        image = ImageAuthorModel(
          logo: data['image']['logo'],
          banner: data['image']['banner'],
        ),
        stat = StatAuthorModel(
          rank: RankAuthorModel(
            id: data['stat']['rank']['id'],
            title: data['stat']['rank']['title'],
          ),
          level: data['stat']['level'],
          rating: data['stat']['rating'],
          countSub: data['stat']['count_sub'],
        ),
        links = (data['links'] as List).map((link) {
          print(link);
          return LinkAuthorModel(
            id: link['id'],
            address: link['address'],
            icon: IconAuthorModel(
              id: link['icon']['id'],
              redirect: link['icon']['redirect'],
              title: link['icon']['title'],
              url: link['icon']['url'],
              pattern: link['icon']['pattern'],
            ),
          );
        }).toList(),
        follower = data['follower'] {
    print(data);
  }
}

class ImageAuthorModel {
  final String logo;
  final String banner;
  final List<LinkAuthorModel> links = [];
  ImageAuthorModel({
    required this.logo,
    required this.banner,
  });
}

class StatAuthorModel {
  final RankAuthorModel rank;
  final int level;
  final int rating;
  final int countSub;
  StatAuthorModel({
    required this.rank,
    required this.level,
    required this.rating,
    required this.countSub,
  });
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

  IconAuthorModel({
    required this.id,
    required this.redirect,
    required this.title,
    required this.url,
    required this.pattern,
  });
}


// {
//   author: {
   
//     nick: KubrickRubrik, 
//     about: Разработчик клиент-серверных приложений Android | iOS | Web. Developer of client-server applications for Android | iOS, 
//     image: {
//       logo: https://ft-gallery.oyavi.com/images/1ebf/7908/small/230.webp, 
//       banner: https://ft-gallery.oyavi.com/images/afc1/4ef3/middle/229.webp
//       }, 
//     stat: {
//         rank: {
//           id: 11, title: '',
//           }, 
//         level: 353, 
//         rating: 635897, 
//         count_sub: 7
//       }, 
//       links: [
//         {
//           id: 143, 
//           icon: {
//             id: 13, 
//             redirect: 1, 
//             title: Telegram, 
//             url: https://ft-gallery.oyavi.com/icons//13.png,
//             pattern: https://t.me/
//         }, 
//         address: regrevers
//         }
//       ], 
//       follower: -1
//   },
// }