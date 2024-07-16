class Constants {
  static const int firstDate = 1900;
  static const int lastDate = 2200;
}

List<Map<String, dynamic>> expenseMainCategories = [
  {
    "id": 1,
    "name": "식비",
    "type": 0,
    "subCategories": [1, 2],
    "isVisible": true
  },
  {
    "id": 2,
    "name": "저축",
    "type": 0,
    "subCategories": [3, 4],
    "isVisible": true
  },
];

List<Map<String, dynamic>> incomeMainCategories = [
  {
    "id": 1,
    "name": "월급",
    "type": 1,
    "subCategories": [1, 2],
    "isVisible": true
  },
  {
    "id": 2,
    "name": "기타",
    "type": 1,
    "subCategories": [3, 4],
    "isVisible": true
  },
];

List<Map<String, dynamic>> subCategories = [
  {"id": 1, "name": "외식", "amount": 0, "isVisible": true},
  {"id": 2, "name": "식료품", "amount": 0, "isVisible": true},
  {"id": 3, "name": "정기 적금", "amount": 0, "isVisible": true},
  {"id": 4, "name": "비상금", "amount": 0, "isVisible": true},
];
