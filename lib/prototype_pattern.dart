// Звісно, ось приклад шаблону Prototype в Dart з використанням радіопрограми:

// У цьому прикладі ми маємо абстрактний клас Radio, який визначає основні
// властивості радіоприймача, такі як марка, модель та ціна.
abstract class Radio {
  String brand;
  String model;
  int price;

  Radio(this.brand, this.model, this.price);

  Radio clone();
}

// У нас також є дві конкретні реалізації класу Radio: BasicRadio та DeluxeRadio,
// які представляють простий та більш просунутий радіоприймач відповідно.

class BasicRadio extends Radio {
  BasicRadio(String brand, String model, int price)
      : super(brand, model, price);

  @override
  Radio clone() {
    return BasicRadio(brand, model, price);
  }
}

class DeluxeRadio extends Radio {
  DeluxeRadio(String brand, String model, int price)
      : super(brand, model, price);

  @override
  Radio clone() {
    return DeluxeRadio(brand, model, price);
  }
}

// Клас RadioStore виступає в ролі клієнта паттерну Prototype. Він містить два
// екземпляри об'єктів Radio, які є прототипами для створення нових радіоприймачів.
// Методи createBasicRadio() і createDeluxeRadio() створюють нові радіоприймачі
// шляхом клонування відповідних прототипів.

class RadioStore {
  Radio basicRadioPrototype;
  Radio deluxeRadioPrototype;

  RadioStore(this.basicRadioPrototype, this.deluxeRadioPrototype);

  Radio createBasicRadio() {
    return basicRadioPrototype.clone();
  }

  Radio createDeluxeRadio() {
    return deluxeRadioPrototype.clone();
  }
}

void main() {
  // створюємо об'єкти радіо
  var basicRadio = BasicRadio('Sony', 'XDR-S41D', 99);
  var deluxeRadio = DeluxeRadio('Bose', 'Wave SoundTouch IV', 599);

  // створюємо об'єкт радіомагазин
  var radioStore = RadioStore(basicRadio, deluxeRadio);

  // клонуємо (створюємо з прототипа радіо)
  var myRadio = radioStore.createBasicRadio();

  print(
      'My radio is a ${myRadio.brand} ${myRadio.model} that cost me ${myRadio.price} dollars.');

  // клонуємо (створюємо з прототипа радіо)
  var expensiveRadio = radioStore.createDeluxeRadio();

  print(
      'I also have a ${expensiveRadio.brand} ${expensiveRadio.model} that cost me ${expensiveRadio.price} dollars.');
}

// Клас Radio є абстрактним класом, який має поля для марки (brand), моделі
// (model) та ціни (price). Він містить абстрактний метод clone(), який
// повертає об'єкт типу Radio.

// Клас BasicRadio та DeluxeRadio наслідують клас Radio та реалізують метод
// clone() для створення копії об'єкта.

// Клас RadioStore має два поля типу Radio, які є прототипами для створення
// нових об'єктів. Методи createBasicRadio() та createDeluxeRadio() повертають
// нові об'єкти радіоприймачів шляхом клонування відповідних прототипів.