class CollegeOfAgriculture {
  final String image;
  final String title;
  final String education;
  final String email;
  final String about;
  final String phone;

  CollegeOfAgriculture({
    required this.phone,
    required this.image,
    required this.title,
    required this.education,
    required this.email,
    required this.about,
  });
}

final softDocs = [
  CollegeOfAgriculture(
    phone: '',
    image: 'assets/images/Agriculture/dribrahem.jpg',
    title: 'د. ابراهيم الطاهات',
    education: '',
    email: '',
    about: 'رئيس قسم الإرشاد والتسويق الزراعي',
  ),
  CollegeOfAgriculture(
      phone: '',
      image: 'assets/images/Agriculture/drorwah.jpg',
      title: 'د. عروة الصليبي',
      education: '',
      email: '',
      about: 'أستاذ مساعد',
  ),
];
