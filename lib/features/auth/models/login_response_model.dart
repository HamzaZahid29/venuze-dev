class LoginResponseModel {
  bool? success;
  String? message;
  Data? data;

  LoginResponseModel({this.success, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Tokens? tokens;
  User? user;

  Data({this.tokens, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    tokens =
    json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Tokens {
  String? accessToken;
  String? refreshToken;
  String? tokenType;

  Tokens({this.accessToken, this.refreshToken, this.tokenType});

  Tokens.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? name;
  String? phone;
  Null? profileImage;
  String? role;
  Profile? profile;
  String? status;
  bool? emailVerified;
  bool? phoneVerified;
  String? authProvider;
  String? createdAt;

  User(
      {this.id,
        this.email,
        this.name,
        this.phone,
        this.profileImage,
        this.role,
        this.profile,
        this.status,
        this.emailVerified,
        this.phoneVerified,
        this.authProvider,
        this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    profileImage = json['profile_image'];
    role = json['role'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    status = json['status'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
    authProvider = json['auth_provider'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
    data['role'] = this.role;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['status'] = this.status;
    data['email_verified'] = this.emailVerified;
    data['phone_verified'] = this.phoneVerified;
    data['auth_provider'] = this.authProvider;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Profile {
  String? id;
  List<VenueListings>? venueListings;
  String? createdAt;
  String? updatedAt;

  Profile({this.id, this.venueListings, this.createdAt, this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['venue_listings'] != null) {
      venueListings = <VenueListings>[];
      json['venue_listings'].forEach((v) {
        venueListings!.add(new VenueListings.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.venueListings != null) {
      data['venue_listings'] =
          this.venueListings!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class VenueListings {
  String? id;
  String? slug;
  bool? isCompleted;
  Location? location;
  Pricing? pricing;
  String? createdAt;

  VenueListings(
      {this.id,
        this.slug,
        this.isCompleted,
        this.location,
        this.pricing,
        this.createdAt});

  VenueListings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    isCompleted = json['is_completed'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    pricing =
    json['pricing'] != null ? new Pricing.fromJson(json['pricing']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['is_completed'] = this.isCompleted;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.pricing != null) {
      data['pricing'] = this.pricing!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Location {
  String? id;
  String? venueId;
  String? country;
  String? state;
  String? city;
  String? streetAddress;
  String? suite;
  String? zipCode;
  double? latitude;
  double? longitude;
  bool? isActive;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
        this.venueId,
        this.country,
        this.state,
        this.city,
        this.streetAddress,
        this.suite,
        this.zipCode,
        this.latitude,
        this.longitude,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    venueId = json['venue_id'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    streetAddress = json['street_address'];
    suite = json['suite'];
    zipCode = json['zip_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['venue_id'] = this.venueId;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['street_address'] = this.streetAddress;
    data['suite'] = this.suite;
    data['zip_code'] = this.zipCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pricing {
  String? id;
  int? hourlyRate;
  int? dailyRate;
  bool? overnightAllowed;
  String? currencyId;

  Pricing(
      {this.id,
        this.hourlyRate,
        this.dailyRate,
        this.overnightAllowed,
        this.currencyId});

  Pricing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hourlyRate = json['hourly_rate'];
    dailyRate = json['daily_rate'];
    overnightAllowed = json['overnight_allowed'];
    currencyId = json['currency_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hourly_rate'] = this.hourlyRate;
    data['daily_rate'] = this.dailyRate;
    data['overnight_allowed'] = this.overnightAllowed;
    data['currency_id'] = this.currencyId;
    return data;
  }
}
