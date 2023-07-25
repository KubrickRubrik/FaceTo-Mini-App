class StatProfile {
  int countSub = 0;
  int countSeriesCreate = 0;
  int countSeriesFavorite = 0;
  int countSeriesOffline = 0;
  int rating = 0;
  int level = 0;
  Rank rank = Rank();

  setData(Map _data) {
    countSub = _data['count_sub'];
    countSeriesOffline = _data['count_series_offline'];
    rating = _data['rating'];
    level = _data['level'];
    rank.setData(_data['rank']);
  }

  clear() {
    countSub = 0;
    rating = 0;
    level = 0;
    rank.clear();
  }
}

class Rank {
  int id = 0;
  String title = '';
  setData(_data) {
    id = _data['id'];
  }

  clear() {
    id = 0;
    title = '';
  }
}
