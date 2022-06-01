class UserInfo {
  UserInfo({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Dob? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  factory UserInfo.fromJson(Map<String?, dynamic> json) => UserInfo(
        gender: json["gender"] == null ? null : json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        email: json["email"] == null ? null : json["email"],
        login: json["login"] == null ? null : Login.fromJson(json["login"]),
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        registered: json["registered"] == null
            ? null
            : Dob.fromJson(json["registered"]),
        phone: json["phone"] == null ? null : json["phone"],
        cell: json["cell"] == null ? null : json["cell"],
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        picture:
            json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"] == null ? null : json["nat"],
      );
}

class Dob {
  Dob({
    this.date,
    this.age,
  });

  DateTime? date;
  int? age;

  factory Dob.fromJson(Map<String?, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"] == null ? null : json["age"],
      );

  Map<String?, dynamic> toJson() => {
        "date": date == null ? null : date!.toIso8601String(),
        "age": age == null ? null : age,
      };
}

class Id {
  Id({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory Id.fromJson(Map<String?, dynamic> json) => Id(
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String?, dynamic> toJson() => {
        "name": name == null ? null : name,
        "value": value == null ? null : value,
      };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  Street? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  factory Location.fromJson(Map<String?, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        postcode: json["postcode"] == null ? null : json["postcode"].toString(),
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
      );
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  factory Coordinates.fromJson(Map<String?, dynamic> json) => Coordinates(
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
      );

  Map<String?, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
      };
}

class Street {
  Street({
    this.number,
    this.name,
  });

  int? number;
  String? name;

  factory Street.fromJson(Map<String?, dynamic> json) => Street(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String?, dynamic> toJson() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
      };
}

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  String? offset;
  String? description;

  factory Timezone.fromJson(Map<String?, dynamic> json) => Timezone(
        offset: json["offset"] == null ? null : json["offset"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String?, dynamic> toJson() => {
        "offset": offset == null ? null : offset,
        "description": description == null ? null : description,
      };
}

class Login {
  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  factory Login.fromJson(Map<String?, dynamic> json) => Login(
        uuid: json["uuid"] == null ? null : json["uuid"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        salt: json["salt"] == null ? null : json["salt"],
        md5: json["md5"] == null ? null : json["md5"],
        sha1: json["sha1"] == null ? null : json["sha1"],
        sha256: json["sha256"] == null ? null : json["sha256"],
      );

  Map<String?, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "salt": salt == null ? null : salt,
        "md5": md5 == null ? null : md5,
        "sha1": sha1 == null ? null : sha1,
        "sha256": sha256 == null ? null : sha256,
      };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  String? title;
  String? first;
  String? last;

  factory Name.fromJson(Map<String?, dynamic> json) => Name(
        title: json["title"] == null ? null : json["title"],
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
      );

  Map<String?, dynamic> toJson() => {
        "title": title == null ? null : title,
        "first": first == null ? null : first,
        "last": last == null ? null : last,
      };
}

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  String? large;
  String? medium;
  String? thumbnail;

  factory Picture.fromJson(Map<String?, dynamic> json) => Picture(
        large: json["large"] == null ? null : json["large"],
        medium: json["medium"] == null ? null : json["medium"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
      );

  Map<String?, dynamic> toJson() => {
        "large": large == null ? null : large,
        "medium": medium == null ? null : medium,
        "thumbnail": thumbnail == null ? null : thumbnail,
      };
}
