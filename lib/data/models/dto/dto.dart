/// Extension class for passing data from the `Presentation` -> `Data`
abstract base class Dto {
  final String actionApi;
  Dto(this.actionApi);

  Map<String, dynamic> toMapRequest();
}
