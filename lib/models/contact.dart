
import 'dart:convert';

class ContactsModel {
  ContactsModel({
    this.total,
    this.page,
    this.pages,
    this.contacts
  });

  String? total;
  int? page;
  int? pages;
  List<Contact>? contacts;


  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
    total: json["total"],
    page: json["page"],
    pages: json["pages"],
    contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))), 
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "pages": pages,
    "contacts": List<dynamic>.from(contacts!.map((x) => x.toJson())),
  };
}


class Contact {
  String id;
  String firstname;
  String lastname;
  String username;
  String email;
  String? password;
  String birth;
  String? mobile;
  String country;
  String? bio;
  String image;
  bool isVerified;
  String? lastSignedAt;
  String createdAt;
  String? updatedAt;
  String? deletedAt;
  String? deletedBy;

  Contact({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    this.password,
    required this.birth, 
    this.mobile,
    required this.country,
    this.bio,
    required this.image,
    required this.isVerified,
    this.lastSignedAt,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deletedBy
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json['id'],
    firstname: json['firstname'],
    lastname: json['lastname'],
    username: json['username'],
    email: json['email'],
    password: json['password'],
    birth: json['birth'],
    country: json['country'],
    bio: json['bio'],
    image: json['image'],
    isVerified: json['isVerified'],
    lastSignedAt: json['lastSignedAt'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    deletedAt: json['deletedAt'],
    deletedBy: json['deletedBy']
  );
  

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstname': firstname,
    'lastname': lastname,
    'username': username,
    'email': email,
    'password': password,
    'birth': birth,
    'country': country,
    'bio': bio,
    'image': image,
    'isVerified': isVerified,
    'lastSignedAt': lastSignedAt,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'deletedBy': deletedBy
  };
}




List demoContacts = [
  Contact(
    id: '0',
    firstname: "Jillian",
    lastname: "MacNab",
    username: "@jillian_macnav",
    email: "jillian@macnav.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "",
    isVerified: true,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '1',
    firstname: "Melissa",
    lastname: "Torres",
    username: "@melissa_torres",
    email: "jillian@macnav.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user1.jpg",
    isVerified: false,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '2',
    firstname: "Samuel",
    lastname: "Ajjar",
    username: "@samuel_ajjar",
    email: "samuel@ajjar.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user2.jpg",
    isVerified: true,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '3',
    firstname: "Laura",
    lastname: "Manso",
    username: "@laura_manso",
    email: "laura@manso.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user3.jpg",
    isVerified: true,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '4',
    firstname: "Wassim",
    lastname: "U",
    username: "@wassim_u",
    email: "wassim@u.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user4.jpg",
    isVerified: false,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '5',
    firstname: "Katelyn",
    lastname: "Young",
    username: "@katelyn_young",
    email: "katelyn@young.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user5.jpg",
    isVerified: false,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '6',
    firstname: "Preston",
    lastname: "Pope",
    username: "@preston_pope",
    email: "preston@pope.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user6.jpg",
    isVerified: true,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '7',
    firstname: "Alba",
    lastname: "Garrido",
    username: "@alba_garrido",
    email: "alba@garrido.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user7.jpg",
    isVerified: true,
    createdAt: '12/19/2021',
  ),
  Contact(
    id: '8',
    firstname: "Mike",
    lastname: "Valnev",
    username: "@mike_valnev",
    email: "mike@valnav.gmail",
    birth: "03/06/1990",
    country: "US",
    image: "assets/images/user8.jpg",
    isVerified: false,
    createdAt: '12/19/2021',
  ),
];