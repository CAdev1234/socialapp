class Contact {
  String id;
  String firstname;
  String lastname;
  String username;
  String email;
  String birth;
  String? mobile;
  String country;
  String? bio;
  String image;
  bool isVerified;

  Contact({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.birth, 
    this.mobile,
    required this.country,
    this.bio,
    required this.image,
    required this.isVerified
  });
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
    image: "assets/images/user0.jpg",
    isVerified: true
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
    isVerified: false
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
    isVerified: true
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
    isVerified: true
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
    isVerified: false
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
    isVerified: false
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
    isVerified: true
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
    isVerified: true
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
    isVerified: false
  ),
];