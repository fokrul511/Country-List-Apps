class Country {
  String? countryName;
  String? flagImage;
  String? officialName;
  String?nativeName;

  Country({
    this.countryName,
    this.flagImage,
    this.officialName,
    this.nativeName,

  });

  Country.formJson(Map<String, dynamic> json) {
    countryName = json['name']['common'];
    flagImage = json['flags']['png'];
    officialName = json['name']['official'];

  }
}
