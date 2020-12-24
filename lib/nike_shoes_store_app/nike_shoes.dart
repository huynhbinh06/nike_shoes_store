class NikeShoes {
  NikeShoes(
      {this.model,
      this.oldPrice,
      this.currentPrice,
      this.images,
      this.modelNumber,
      this.color});
  final String model;
  final double oldPrice;
  final currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;
}

final shoes = <NikeShoes>[
  NikeShoes(
    model: 'AIR JORDAN 1 MID',
    currentPrice: 299,
    oldPrice: 399,
    images: [
      'assets/nike_shoes_store/shoes1_1.png',
      'assets/nike_shoes_store/shoes1_2.png',
      'assets/nike_shoes_store/shoes1_3.png',
    ],
    modelNumber: 1,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: 'AIR JORDAN 10 LOW SE',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/nike_shoes_store/shoes2_1.png',
      'assets/nike_shoes_store/shoes2_2.png',
      'assets/nike_shoes_store/shoes2_3.png',
    ],
    modelNumber: 10,
    color: 0xFFFCF5EB,
  ),
  NikeShoes(
    model: 'AIR JORDAN 6 LOW SE',
    currentPrice: 149,
    oldPrice: 299,
    images: [
      'assets/nike_shoes_store/shoes3_1.png',
      'assets/nike_shoes_store/shoes3_2.png',
      'assets/nike_shoes_store/shoes3_3.png',
    ],
    modelNumber: 6,
    color: 0xFFEDF3FE,
  ),
  NikeShoes(
      model: 'AIR JORDAN 21 LOW SE',
      currentPrice: 149,
      oldPrice: 299,
      images: [
        'assets/nike_shoes_store/shoes4_1.png',
        'assets/nike_shoes_store/shoes4_2.png',
        'assets/nike_shoes_store/shoes4_3.png',
      ],
      modelNumber: 21,
      color: 0xFFFEEFEF),
];
