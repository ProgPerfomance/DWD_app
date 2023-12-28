import 'package:flutter/cupertino.dart';
import 'package:untitled1/model/adverb/moto_adverb_model.dart';
import 'package:untitled1/model/adverb_category_model.dart';
import 'package:untitled1/view/view_model/adv_car_viewmodel.dart';
import 'package:untitled1/view/view_model/adv_home_viewmodel.dart';

import '../view/view_model/adv_moto_viewmodel.dart';

List<AdverbCategoryModel> adsCategories = [
  AdverbCategoryModel(id: 1, name: 'Транспорт', pods: [
    AdverbCategoryModel(id: 1001, name: 'Автомобили', pods: [
    ], viewModel: CreateCarViewModel(), type: 'car'),
    AdverbCategoryModel(id: 1002, name: 'Мотоциклы и мототехника', pods: [
      AdverbCategoryModel(id: 10021, name: 'Мотоциклы', pods: [], viewModel: AdvMotoViewModel(), type: 'moto'),
      AdverbCategoryModel(id: 10022, name: 'Мопеды и скутеры', pods: [
        AdverbCategoryModel(id: 100221, name: 'Мопеды', pods: [], viewModel: AdvMotoViewModel(), type: 'moto'),
        AdverbCategoryModel(id: 100222, name: 'Скутеры', pods: [], viewModel: AdvMotoViewModel(), type: 'moto'),
      ]),
      AdverbCategoryModel(id: 10023, name: 'Вездеходы', pods: [],viewModel: AdvMotoViewModel(), type: 'moto'),
      AdverbCategoryModel(id: 10024, name: 'Снегоходы', pods: [],viewModel: AdvMotoViewModel(), type: 'moto'),
      AdverbCategoryModel(id: 10025, name: 'Картинг', pods: [],viewModel: AdvMotoViewModel(), type: 'moto'),
      AdverbCategoryModel(id: 10026, name: 'Квадроциклы и картинг', pods: [],viewModel: AdvMotoViewModel(), type: 'moto'),
    ]),
    AdverbCategoryModel(id: 1003, name: 'Грузовики и спецтехника', pods: [
      AdverbCategoryModel(id: 10031, name: 'Автобусы', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10032, name: 'Автодома', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10033, name: 'Автокраны', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10034, name: 'Бульдозеры', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10035, name: 'Грузовики', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10036, name: 'Коммунальная техника', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(
          id: 10037, name: 'Лёгкий коммерческий транспорт', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10038, name: 'Навесное оборудование', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10039, name: 'Погрузчики', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 100310, name: 'Прицепы', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 100311, name: 'Сельхозтехника', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 100312, name: 'Строительная техника', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(
          id: 100313, name: 'Техника для лесозаготовки', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 100314, name: 'Тягачи', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 100315, name: 'Экскаваторы', pods: [], viewModel: SizedBox()),
    ]),
    AdverbCategoryModel(id: 1004, name: 'Водный транспорт', pods: [
      AdverbCategoryModel(id: 10041, name: 'Вёсельные лодки', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10042, name: 'Гидроциклы', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10043, name: 'Катера и яхты', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Моторные лодки и моторы', pods: [] ,viewModel: SizedBox()),
    ]),
    AdverbCategoryModel(id: 1004, name: 'Запчасти и аксессуары', pods: [
      AdverbCategoryModel(id: 10041, name: 'Запчасти', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10042, name: 'Шины, диски и колёса', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10043, name: 'Аудио- и видеотехника', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Аксессуары', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Тюнинг', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Багажники и фаркопы', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Инструменты', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Прицепы', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Экипировка', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(
          id: 10044, name: 'Противоугонные устройства', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Масла и автохимия', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'GPS-навигаторы', pods: [], viewModel: SizedBox()),
    ]),
  ]),
  AdverbCategoryModel(id: 2, name: 'Недвижимость', pods: [
    AdverbCategoryModel(id: 10044, name: 'Купить жильё', pods: [
      AdverbCategoryModel(id: 10044, name: 'Квартиры', pods: [
        AdverbCategoryModel(id: 10044, name: 'Вторичка', pods: [], viewModel: CreateAvdHomeViewModel(), type: 'home'),
        AdverbCategoryModel(id: 10044, name: 'Новостройки', pods: [], viewModel: CreateAvdHomeViewModel(), type: 'home'),
      ]),
      AdverbCategoryModel(id: 10044, name: 'Дома, дачи, коттеджи', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Комнаты', pods: [], viewModel: SizedBox()),
    ]),
    AdverbCategoryModel(id: 10044, name: 'Снять посуточно', pods: [
      AdverbCategoryModel(id: 10044, name: 'Дома, дачи, коттеджи', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Комнаты', pods: [], viewModel: CreateAvdHomeViewModel(), type: 'home'),
      AdverbCategoryModel(id: 10044, name: 'Квартиры', pods: [], viewModel: CreateAvdHomeViewModel(), type: 'home'),
    ]),
    AdverbCategoryModel(id: 10044, name: 'Снять долгосрочно', pods: [
      AdverbCategoryModel(id: 10044, name: 'Дома, дачи, коттеджи', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Комнаты', pods: [], viewModel: CreateAvdHomeViewModel(), type: 'home'),
      AdverbCategoryModel(id: 10044, name: 'Квартиры', pods: [], viewModel: CreateAvdHomeViewModel(), type: 'home'),
    ]),
    AdverbCategoryModel(id: 10044, name: 'Коммерческая недвижимость', pods: [
      AdverbCategoryModel(id: 10044, name: 'Купить', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Снять', pods: [], viewModel: SizedBox()),
    ]),
    AdverbCategoryModel(id: 10044, name: 'Другие категории', pods: [
      AdverbCategoryModel(id: 10044, name: 'Земельные участки', pods: [], viewModel: SizedBox()),
      AdverbCategoryModel(id: 10044, name: 'Гаражи и машиноместа', pods: [], viewModel: SizedBox()),
    ]),
  ]),
  AdverbCategoryModel(id: 3, name: 'Личные вещи', pods: [
    AdverbCategoryModel(id: 10044, name: 'Одежда, обувь, аксессуары ', pods: [
      AdverbCategoryModel(id: 10044, name: 'Женская одежда', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Женская обувь', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Мужская одежда', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Мужская обувь', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Сумки, рюкзаки и чемоданы', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Аксессуары', pods: []),
      AdverbCategoryModel(id: 10044, name: 'Детская одежда и обувь', pods: [
        AdverbCategoryModel(id: 10044, name: 'Для девочек', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Для мальчиков', pods: []),
      ]),
    ]),
      AdverbCategoryModel(id: 10044, name: 'Товары для детей и игрушки', pods: [
        AdverbCategoryModel(id: 10044, name: 'Детские коляски', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Детская мебель', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Велосипеды и самокаты', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Товары для кормления', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Автомобильные кресла', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Постельные принадлежности', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Игрушки', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Товары для купания', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Товары для школы', pods: []),
      ]),
      AdverbCategoryModel(id: 10044, name: 'Красота и здоровье', pods: [
        AdverbCategoryModel(id: 10044, name: 'Приборы и аксессуары', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Парфюмерия', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Средства гигиены', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Косметика', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Средства для волос', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Медицинские изделия', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Другое', pods: []),
      ]),
      AdverbCategoryModel(id: 10044, name: 'Часы и украшения', pods: [
        AdverbCategoryModel(id: 10044, name: 'Ювелирные изделия', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Бижутерия', pods: []),
        AdverbCategoryModel(id: 10044, name: 'Часы', pods: []),
      ]),
  ]),
  AdverbCategoryModel(id: 3, name: 'Электроника', pods: [

  ]),
];

//
//
//
//