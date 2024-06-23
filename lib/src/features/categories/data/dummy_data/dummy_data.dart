import '../dto/categories_tree_dto.dart';

const data = [
  CategoryTreeDto(
    id: 1,
    name: 'category #1',
    thumbnail:
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/107355/01/sv02/fnd/THA/fmt/png/FUTURE-ULTIMATE-FG/AG-Men's-Football-Boots",
    children: [
      CategoryTreeDto(
        id: 2,
        name: 'category #2',
        thumbnail:
            "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/586668/47/fnd/THA/fmt/png/Essentials-Small-Logo-Tee-Men",
        children: [
          CategoryTreeDto(
            id: 3,
            name: 'category #3',
            thumbnail:
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/023148/21/fnd/THA/fmt/png/Essentials-Running-Cap",
          ),
          CategoryTreeDto(
            id: 4,
            name: 'category #4',
            thumbnail:
                "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/023148/21/fnd/THA/fmt/png/Essentials-Running-Cap",
          ),
        ],
      ),
    ],
  ),
  CategoryTreeDto(
    id: 1,
    name: 'category #4',
    thumbnail:
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/935700/06/fnd/THA/fmt/png/PUMA-Unisex-Classic-Socks-1-pack",
    children: [
      CategoryTreeDto(
        id: 2,
        name: 'category #5',
        thumbnail:
            "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/675898/01/mod01/fnd/THA/fmt/png/OPEN-ROAD-Men's-Cargo-Pants",
      ),
    ],
  ),
  CategoryTreeDto(
    id: 1,
    name: 'category #6',
    thumbnail:
        "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/083787/07/fnd/THA/fmt/png/PUMA-Orbita-6-MS-Football",
  ),
];
