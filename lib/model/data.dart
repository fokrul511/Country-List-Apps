class Country {
  String? countryName;
  String? flagImage;
  String? officialName;
  int? population;
  String? startOfWeek;
  String ? region;
  String ? subregion;

  Country({
    this.countryName,
    this.flagImage,
    this.officialName,
    this.population,
    this.startOfWeek,
    this.region,
    this.subregion,
  });

  Country.formJson(Map<String, dynamic> json) {
    countryName = json['name']['common'];
    flagImage = json['flags']['png'];
    officialName = json['name']['official'];
    population = json['population'];
    startOfWeek = json['startOfWeek'];
    region = json['region'];
    subregion = json['subregion'];
  }
}
