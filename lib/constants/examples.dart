// List<TransactionModel> transactionModelExamples = [
//   TransactionModel(
//     id: 1,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-07-08 12:30:00"),
//     asset: 1,
//     price: 50000.0,
//     title: "점심 식사",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "친구들과 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "홍길동", amount: 25000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "김철수", amount: 25000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 2,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-07-07 09:00:00"),
//     asset: 2,
//     price: 1000000.0,
//     title: "월급",
//     mainCategory: 4,
//     subCategory: 7,
//     memo: "6월 급여",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "이영희", amount: 1000000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 3,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-07-06 14:00:00"),
//     asset: 3,
//     price: 200000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 3,
//     memo: "저축용",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "박민수", amount: 200000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 4,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-07-05 18:00:00"),
//     asset: 4,
//     price: 30000.0,
//     title: "저녁 식사",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "가족과 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "최지우", amount: 15000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "강호동", amount: 15000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 5,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-07-04 11:00:00"),
//     asset: 5,
//     price: 500000.0,
//     title: "보너스",
//     mainCategory: 5,
//     subCategory: 9,
//     memo: "성과급",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "유재석", amount: 500000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 6,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-07-03 16:00:00"),
//     asset: 6,
//     price: 150000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 4,
//     memo: "비상금 마련",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "신동엽", amount: 150000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 7,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-07-02 10:00:00"),
//     asset: 7,
//     price: 70000.0,
//     title: "영화 관람",
//     mainCategory: 6,
//     subCategory: 11,
//     memo: "친구와 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "정준하", amount: 35000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "박나래", amount: 35000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 8,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-07-01 15:00:00"),
//     asset: 8,
//     price: 2000000.0,
//     title: "투자 수익",
//     mainCategory: 5,
//     subCategory: 9,
//     memo: "주식 투자",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "홍길동", amount: 2000000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 9,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-30 13:00:00"),
//     asset: 9,
//     price: 100000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 4,
//     memo: "생활비",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "김철수", amount: 100000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 10,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-29 17:00:00"),
//     asset: 1,
//     price: 40000.0,
//     title: "카페",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "친구와 대화",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "이영희", amount: 20000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "박민수", amount: 20000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 11,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-28 12:30:00"),
//     asset: 1,
//     price: 60000.0,
//     title: "점심 식사",
//     mainCategory: 1,
//     subCategory: 2,
//     memo: "동료들과 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "최지우", amount: 20000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "강호동", amount: 20000.0, received: true),
//       SplitModel(
//           id: 3, asset: 0, name: "유재석", amount: 20000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 12,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-06-27 09:00:00"),
//     asset: 1,
//     price: 1100000.0,
//     title: "월급",
//     mainCategory: 4,
//     subCategory: 7,
//     memo: "7월 급여",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "신동엽", amount: 1100000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 13,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-26 14:00:00"),
//     asset: 1,
//     price: 250000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 3,
//     memo: "적금용",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "정준하", amount: 250000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 14,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-25 18:00:00"),
//     asset: 1,
//     price: 35000.0,
//     title: "저녁 식사",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "가족과 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "박나래", amount: 17500.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "유재석", amount: 17500.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 15,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-06-24 11:00:00"),
//     asset: 1,
//     price: 550000.0,
//     title: "보너스",
//     mainCategory: 5,
//     subCategory: 9,
//     memo: "성과급",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "홍길동", amount: 550000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 16,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-23 16:00:00"),
//     asset: 1,
//     price: 170000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 4,
//     memo: "비상금 마련",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "김철수", amount: 170000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 17,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-22 10:00:00"),
//     asset: 1,
//     price: 75000.0,
//     title: "영화 관람",
//     mainCategory: 6,
//     subCategory: 11,
//     memo: "친구와 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "이영희", amount: 37500.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "박민수", amount: 37500.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 18,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-06-21 15:00:00"),
//     asset: 1,
//     price: 2100000.0,
//     title: "투자 수익",
//     mainCategory: 5,
//     subCategory: 9,
//     memo: "주식 투자",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "최지우", amount: 2100000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 19,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-20 13:00:00"),
//     asset: 1,
//     price: 120000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 4,
//     memo: "생활비",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "강호동", amount: 120000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 20,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-19 17:00:00"),
//     asset: 20,
//     price: 45000.0,
//     title: "카페",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "친구와 대화",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "유재석", amount: 22500.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "신동엽", amount: 22500.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 21,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-18 12:30:00"),
//     asset: 1,
//     price: 52000.0,
//     title: "점심 식사",
//     mainCategory: 1,
//     subCategory: 2,
//     memo: "동료들과 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "정준하", amount: 26000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "박나래", amount: 26000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 22,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-06-17 09:00:00"),
//     asset: 2,
//     price: 1050000.0,
//     title: "월급",
//     mainCategory: 4,
//     subCategory: 7,
//     memo: "8월 급여",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "홍길동", amount: 1050000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 23,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-16 14:00:00"),
//     asset: 3,
//     price: 260000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 3,
//     memo: "적금용",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "김철수", amount: 260000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 24,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-15 18:00:00"),
//     asset: 4,
//     price: 37000.0,
//     title: "저녁 식사",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "가족과 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "이영희", amount: 18500.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "박민수", amount: 18500.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 25,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-06-14 11:00:00"),
//     asset: 5,
//     price: 520000.0,
//     title: "보너스",
//     mainCategory: 5,
//     subCategory: 9,
//     memo: "성과급",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "최지우", amount: 520000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 26,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-13 16:00:00"),
//     asset: 6,
//     price: 180000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 4,
//     memo: "비상금 마련",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "강호동", amount: 180000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 27,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-12 10:00:00"),
//     asset: 7,
//     price: 80000.0,
//     title: "영화 관람",
//     mainCategory: 6,
//     subCategory: 11,
//     memo: "친구와 함께",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "유재석", amount: 40000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "신동엽", amount: 40000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 28,
//     type: TransactionType.income,
//     datetime: DateTime.parse("2023-06-11 15:00:00"),
//     asset: 8,
//     price: 2200000.0,
//     title: "투자 수익",
//     mainCategory: 5,
//     subCategory: 9,
//     memo: "주식 투자",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "정준하", amount: 2200000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 29,
//     type: TransactionType.transfer,
//     datetime: DateTime.parse("2023-06-10 13:00:00"),
//     asset: 9,
//     price: 130000.0,
//     title: "계좌 이체",
//     mainCategory: 2,
//     subCategory: 4,
//     memo: "생활비",
//     split: [
//       SplitModel(
//           id: 1, asset: 1, name: "박나래", amount: 130000.0, received: true),
//     ],
//   ),
//   TransactionModel(
//     id: 30,
//     type: TransactionType.expense,
//     datetime: DateTime.parse("2023-06-09 17:00:00"),
//     asset: 1,
//     price: 50000.0,
//     title: "카페",
//     mainCategory: 1,
//     subCategory: 1,
//     memo: "친구와 대화",
//     split: [
//       SplitModel(
//           id: 1, asset: 0, name: "홍길동", amount: 25000.0, received: true),
//       SplitModel(
//           id: 2, asset: 0, name: "김철수", amount: 25000.0, received: true),
//     ],
//   ),
// ];

List<String> assetGroupExamples = [
  "현금",
  "계좌",
  "카드",
];

List<Map<String, dynamic>> assetModelExamples = [
  {
    "id": 1,
    "name": "국민은행",
    "group": 1,
    "initialValue": 1000000.0,
    "linkedApp": "",
    "memo": "",
    "currentValue": 1200000.0,
    "isVisible": true
  },
  {
    "id": 2,
    "name": "서울카드",
    "group": 2,
    "initialValue": 500000000.0,
    "linkedApp": "",
    "memo": "",
    "currentValue": 550000000.0,
    "isVisible": true
  },
  {
    "id": 3,
    "name": "현대카드",
    "group": 2,
    "initialValue": 30000000.0,
    "linkedApp": "",
    "memo": "출퇴근용",
    "currentValue": 25000000.0,
    "isVisible": true
  },
  {
    "id": 4,
    "name": "국민은행 예금",
    "group": 1,
    "initialValue": 10000000.0,
    "linkedApp": "",
    "memo": "비상금",
    "currentValue": 10200000.0,
    "isVisible": true
  },
  {
    "id": 5,
    "name": "회사채 계좌",
    "group": "투자",
    "initialValue": 2000000.0,
    "linkedApp": "",
    "memo": "",
    "currentValue": 2050000.0,
    "isVisible": true
  },
  {
    "id": 6,
    "name": "비상금",
    "group": 0,
    "initialValue": 500000.0,
    "linkedApp": "",
    "memo": "비상금",
    "currentValue": 500000.0,
    "isVisible": true
  },
  {
    "id": 7,
    "name": "골드바",
    "group": "투자",
    "initialValue": 3000000.0,
    "linkedApp": "",
    "memo": "안전 자산",
    "currentValue": 3200000.0,
    "isVisible": true
  },
  {
    "id": 8,
    "name": "Apple",
    "group": "투자",
    "initialValue": 1500000.0,
    "linkedApp": "",
    "memo": "장기 투자",
    "currentValue": 1800000.0,
    "isVisible": true
  },
  {
    "id": 9,
    "name": "뉴욕 은행",
    "group": 1,
    "initialValue": 800000000.0,
    "linkedApp": "",
    "memo": "상가 임대",
    "currentValue": 850000000.0,
    "isVisible": true
  },
  {
    "id": 10,
    "name": "현금",
    "group": 0,
    "initialValue": 40000000.0,
    "linkedApp": "",
    "memo": "",
    "currentValue": 38000000.0,
    "isVisible": true
  }
];

List<Map<String, dynamic>> mainCategoryExamples = [
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
  {
    "id": 3,
    "name": "주거",
    "type": 0,
    "subCategories": [5, 6],
    "isVisible": true
  },
  {
    "id": 4,
    "name": "주수입",
    "type": 1,
    "subCategories": [7, 8],
    "isVisible": true
  },
  {
    "id": 5,
    "name": "부수입",
    "type": 1,
    "subCategories": [9, 10],
    "isVisible": true
  },
  {
    "id": 6,
    "name": "오락",
    "type": 0,
    "subCategories": [11, 12],
    "isVisible": true
  },
  {
    "id": 7,
    "name": "교통",
    "type": 0,
    "subCategories": [13, 14],
    "isVisible": true
  },
  {
    "id": 8,
    "name": "의료",
    "type": 0,
    "subCategories": [15, 16],
    "isVisible": true
  },
  {
    "id": 9,
    "name": "교육",
    "type": 0,
    "subCategories": [17, 18],
    "isVisible": true
  },
  {
    "id": 10,
    "name": "기타",
    "type": 0,
    "subCategories": [19, 20],
    "isVisible": true
  }
];

List<Map<String, dynamic>> subCategoryExamples = [
  {"id": 1, "name": "외식", "isVisible": true},
  {"id": 2, "name": "식료품", "isVisible": true},
  {"id": 3, "name": "정기 적금", "isVisible": true},
  {"id": 4, "name": "비상금", "isVisible": true},
  {"id": 5, "name": "월세", "isVisible": true},
  {"id": 6, "name": "관리비", "isVisible": true},
  {"id": 7, "name": "월급", "isVisible": true},
  {"id": 8, "name": "보너스", "isVisible": true},
  {"id": 9, "name": "투자 수익", "isVisible": true},
  {"id": 10, "name": "임대 수익", "isVisible": true},
  {"id": 11, "name": "영화", "isVisible": true},
  {"id": 12, "name": "게임", "isVisible": true},
  {"id": 13, "name": "버스", "isVisible": true},
  {"id": 14, "name": "택시", "isVisible": true},
  {"id": 15, "name": "병원비", "isVisible": true},
  {"id": 16, "name": "약값", "isVisible": true},
  {"id": 17, "name": "학원비", "isVisible": true},
  {"id": 18, "name": "교재비", "isVisible": true},
  {"id": 19, "name": "기부", "isVisible": true},
  {"id": 20, "name": "기타", "isVisible": true}
];

List<Map<String, dynamic>> splitModelExamples = [
  {"id": 1, "asset": 1, "name": "홍길동", "amount": 100000.0, "received": true},
  {"id": 2, "asset": 1, "name": "김철수", "amount": 250000.0, "received": false},
  {"id": 3, "asset": 1, "name": "이영희", "amount": 30000.0, "received": true},
  {"id": 4, "asset": 1, "name": "박민수", "amount": 150000.0, "received": true},
  {"id": 5, "asset": 1, "name": "최지우", "amount": 50000.0, "received": false},
  {"id": 6, "asset": 0, "name": "강호동", "amount": 70000.0, "received": true},
  {"id": 7, "asset": 9, "name": "유재석", "amount": 80000.0, "received": false},
  {"id": 8, "asset": 9, "name": "신동엽", "amount": 120000.0, "received": true},
  {"id": 9, "asset": 9, "name": "정준하", "amount": 900000.0, "received": false},
  {"id": 10, "asset": 9, "name": "박나래", "amount": 45000.0, "received": true}
];
