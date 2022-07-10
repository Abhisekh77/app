final List<String> imgList = [
  "assets/covidbanner.png",
  "assets/mountainelogo_2.png",
  "assets/details.png",
  "assets/Frame 2.png",
  "assets/Rectangle.png",
  "assets/mountainelogo 3.png",
];

class Places {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  int? selectedPeople;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;

  Places(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.stars,
      this.people,
      this.selectedPeople,
      this.img,
      this.location,
      this.createdAt,
      this.updatedAt});

  factory Places.fromJson(Map e) {
    return Places(
        id: e['id'],
        name: e['name'],
        description: e['description'],
        price: e['price'],
        stars: e['stars'],
        people: e['people'],
        selectedPeople: e['selectedPeople'],
        img: e['img'],
        location: e['location'],
        createdAt: e['createdAt'],
        updatedAt: e['updatedAt']);
  }
}
