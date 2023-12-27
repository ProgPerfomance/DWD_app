import 'package:untitled1/model/adverb_category_model.dart';

List<AdverbCategoryModel> adsCategories = [
  AdverbCategoryModel(id: 1, name: 'Транспорт', pods: [AdverbCategoryModel(id: 1001, name: 'Автомобили', pods: []),
  AdverbCategoryModel(id: '1002', name: 'Мотоциклы и мототехника', pods: [
    AdverbCategoryModel(id: 10021, name: 'Мотоциклы', pods: []),
    AdverbCategoryModel(id: 10022, name: 'Мопеды и скутеры', pods: [
      AdverbCategoryModel(id: 100221, name: 'Мопеды', pods: []),
      AdverbCategoryModel(id: 100222, name: 'Скутеры', pods: []),
    ]),
    AdverbCategoryModel(id: 10023, name: 'Вездеходы', pods: []),
    AdverbCategoryModel(id: 10024, name: 'Снегоходы', pods: []),
    AdverbCategoryModel(id: 10025, name: 'Картинг', pods: []),
    AdverbCategoryModel(id: 10026, name: 'Квадроциклы и картинг', pods: []),
  ]),

  ]),
  AdverbCategoryModel(id: 2, name: 'Недвижимость', pods: []),
]; 
