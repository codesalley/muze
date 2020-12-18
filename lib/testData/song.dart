import 'package:get/get.dart';

class Songs extends GetxController {
  Map<String, String> songs = {
    'Sapashini': 'Bana',
    'Sarkodi': 'happy day',
    'Omario': 'Goat',
    'De Donzy': 'fauza',
    'Fancy dadam': 'chmpion boy',
    'Maccasio': '69',
    'Fadlan': 'president',
    // ignore: equal_keys_in_map
    'Fadlan': 'Ankani',
    'kwesi arthur': 'suger',
    'shatta wale': 'sleepless night',
    'davido': 'fem',
  };

  static Songs get to => Get.find<Songs>();
}
