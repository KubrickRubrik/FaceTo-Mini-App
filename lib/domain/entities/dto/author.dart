import 'package:facetomini/data/models/dto/dto.dart';

/// A class for transferring data between layers `Presentation` -> `Domain` -> `Data`
final class AuthorDTO extends Dto {
  final int idAuthor;

  AuthorDTO({
    required this.idAuthor,
  });

  @override
  Map<String, dynamic> toMapRequest() {
    return {
      "action": super.actionApi,
      "data": {
        "id_app": idAuthor,
      },
    };
  }
}
