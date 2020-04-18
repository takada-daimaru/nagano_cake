# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Customer.create!(
  first_name: '神崎',
  last_name: '歩',
  first_name_kana: 'カンザイ',
  last_name_kana: 'アユミ',
  email: 'aaa@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '松尾',
  last_name: '毅雄',
  first_name_kana: 'マツオ',
  last_name_kana: 'タケオ',
  email: 'bbb@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '越智',
  last_name: '穂乃香',
  first_name_kana: 'オチ',
  last_name_kana: 'ホノカ',
  email: 'ccc@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '宮下',
  last_name: '寧音',
  first_name_kana: 'ミヤシタ',
  last_name_kana: 'シズネ',
  email: 'ddd@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '棚橋',
  last_name: '遥菜',
  first_name_kana: 'タナハシ',
  last_name_kana: 'ハルナ',
  email: 'eee@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '大野',
  last_name: '菜帆',
  first_name_kana: 'オオノ',
  last_name_kana: 'ナホ',
  email: 'fff@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '花井',
  last_name: '喜晴',
  first_name_kana: 'ハナイ',
  last_name_kana: 'ヨシハル',
  email: 'ggg@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 1,
)
Customer.create!(
  first_name: '金沢',
  last_name: '秀子',
  first_name_kana: 'カナザワ',
  last_name_kana: 'ヒデコ',
  email: 'hhh@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '前田',
  last_name: '里沙',
  first_name_kana: 'マエダ',
  last_name_kana: 'リサ',
  email: 'iii@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 0,
)
Customer.create!(
  first_name: '小野',
  last_name: '長次郎',
  first_name_kana: 'オノ',
  last_name_kana: 'チョウジロウ',
  email: 'jjj@test.jp',
  password: '111111',
  postcode: '1000005',
  address: '東京都千代田区丸の内1丁目',
  phone_number: '000-0000-0000',
  status: 1,
)

Type.create!(
  # id:1
  name: 'ケーキ',
  status: 'true',
)

Type.create!(
  # id:2
  name: 'プリン',
  status: 'false',
)

Type.create!(
  # id:3
  name: '焼き菓子',
  status: 'false',
)

Type.create!(
  # id:4
  name: 'キャンディ',
  status: 'false',
)

Type.create!(
  # id:5
  name: 'クッキー',
  status: 'false',
)

Type.create!(
  # id:6
  name: 'ゼリー',
  status: 'false',
)

Item.create!(
  type_id: 1,
  name: '洋梨のチーズタルト',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '1200',
  image: File.open('./app/assets/images/items/cheese-tart.jpg'),
  status: 0,
)

Item.create!(
  type_id: 1,
  name: 'ザッハトルテ',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '2900',
  image: File.open('./app/assets/images/items/sachertorte.png'),
  status: 0,
)

Item.create!(
  type_id: 1,
  name: 'いちごのショートケーキ',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '500',
  image: File.open('./app/assets/images/items/shortcake.jpg'),
  status: 0,
)

Item.create!(
  type_id: 2,
  name: '卵たっぷり濃厚プリン',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '500',
  image: File.open('./app/assets/images/items/pudding.jpg'),
  status: 0,
)

Item.create!(
  type_id: 5,
  name: '紅茶のクッキー',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '800',
  image: File.open('./app/assets/images/items/coockie.jpg'),
  status: 0,
)

Item.create!(
  type_id: 1,
  name: 'フルーツタルト',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '2900',
  image: File.open('./app/assets/images/items/fruit-tart.jpg'),
  status: 1,
)

Item.create!(
  type_id: 6,
  name: '大きな桃のゼリー',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '480',
  image: File.open('./app/assets/images/items/peach-jelly.png'),
  status: 0,
)

Item.create!(
  type_id: 3,
  name: 'マカロンセット（8個）',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '1200',
  image: File.open('./app/assets/images/items/macaroon-8.jpg'),
  status: 0,
)

Item.create!(
  type_id: 3,
  name: 'マカロン（16個）',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '2000',
  image: File.open('./app/assets/images/items/macaroon-16.png'),
  status: 0,
)

Item.create!(
  type_id: 1,
  name: 'バナナケーキ',
  explanation: '説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。説明文です。',
  excluded: '980',
  image: File.open('./app/assets/images/items/banana-cake.jpg'),
  status: 0,
)