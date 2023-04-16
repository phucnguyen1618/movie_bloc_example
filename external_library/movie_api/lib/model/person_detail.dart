class PersonDetail {
  String? birthday;
  String? knownForDepartment;
  String? deathday;
  int? id;
  String? name;
  List<String>? alsoKnownAs;
  int? gender;
  String? biography;
  double? popularity;
  String? placeOfBirth;
  String? profilePath;
  bool? adult;
  String? imdbId;
  String? homepage;

  PersonDetail(
      {this.birthday,
      this.knownForDepartment,
      this.deathday,
      this.id,
      this.name,
      this.alsoKnownAs,
      this.gender,
      this.biography,
      this.popularity,
      this.placeOfBirth,
      this.profilePath,
      this.adult,
      this.imdbId,
      this.homepage});

  PersonDetail.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    deathday = json['deathday'];
    id = json['id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as'].cast<String>();
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    imdbId = json['imdb_id'];
    homepage = json['homepage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birthday'] = birthday;
    data['known_for_department'] = knownForDepartment;
    data['deathday'] = deathday;
    data['id'] = id;
    data['name'] = name;
    data['also_known_as'] = alsoKnownAs;
    data['gender'] = gender;
    data['biography'] = biography;
    data['popularity'] = popularity;
    data['place_of_birth'] = placeOfBirth;
    data['profile_path'] = profilePath;
    data['adult'] = adult;
    data['imdb_id'] = imdbId;
    data['homepage'] = homepage;
    return data;
  }
}
