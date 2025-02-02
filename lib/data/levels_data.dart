import 'package:vocabulary_tv/models/level_model.dart';

class LevelsData {
  static List<Level> getEasyLevels() {
    return [
      Level(
        id: 1,
        theme: "Animals",
        items: [
          'Lion',
          'Banana',
          'Mango',
          'Star',
          'Moon',
          'Apple',
          'Avocado',
          'Shoes',
          'Orange',
          'Cat',
          'Dog',
          'Monkey',
          'Cherry',
          'Donkey',
          'Pear',
          'Pineapple',
          'Strawberry',
          'Grapes',
          'Watermelon',
          'Peach',
        ],
        correctItems: ['Lion', 'Cat', 'Monkey', 'Donkey', 'Dog'],
        imageAsset: 'assets/images/animal_tv.png',
      ),

      // Level 2
      Level(
        id: 2,
        theme: "Fruits",
        items: [
          'Laptop',
          'Mountain',
          'River',
          'Cloud',
          'Shadow',
          'Apple',
          'Banana',
          'Mango',
          'Orange',
          'Pineapple',
          'Notebook',
          'Whisper',
          'Galaxy',
          'Voyager',
          'Telescope',
          'Paradox',
          'Cipher',
          'Labyrinth',
          'Chronicle',
          'Phantom',
        ],
        correctItems: ['Apple', 'Banana', 'Mango', 'Orange', 'Pineapple'],
        imageAsset: 'assets/images/fruits_tv.png',
      ),

      // Level 3
      Level(
        id: 3,
        theme: "Buildings",
        items: [
          'Ocean',
          'Desert',
          'Forest',
          'Mountain',
          'River',
          'Compass',
          'Lantern',
          'Mirror',
          'Thunder',
          'Whisper',
          'House',
          'Skyscraper',
          'Cottage',
          'Bungalow',
          'Castle',
          'Chronicle',
          'Phantom',
          'Shadow',
          'Echo',
          'Galaxy',
        ],
        correctItems: ['House', 'Skyscraper', 'Cottage', 'Bungalow', 'Castle'],
        imageAsset: 'assets/images/buildings_tv.png',
      ),

      // Level 4
      Level(
        id: 4,
        theme: "Stationery",
        items: [
          'Galaxy',
          'Thunder',
          'Lantern',
          'Shadow',
          'Voyager',
          'Pen',
          'Pencil',
          'Eraser',
          'Sharpener',
          'Ruler',
          'Telescope',
          'Whisper',
          'Phantom',
          'Mirror',
          'Compass',
          'River',
          'Desert',
          'Mountain',
          'Forest',
          'Ocean',
        ],
        correctItems: ['Pen', 'Pencil', 'Eraser', 'Sharpener', 'Ruler'],
        imageAsset: 'assets/images/stationery_tv.png',
      ),

      // Level 5
      Level(
        id: 5,
        theme: "Planets",
        items: [
          'Ocean',
          'Desert',
          'Forest',
          'Mountain',
          'River',
          'Lantern',
          'Compass',
          'Mirror',
          'Thunder',
          'Whisper',
          'Voyager',
          'Telescope',
          'Paradox',
          'Cipher',
          'Labyrinth',
          'Mercury',
          'Venus',
          'Earth',
          'Mars',
          'Jupiter',
        ],
        correctItems: ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter'],
        imageAsset: 'assets/images/planets_tv.png',
      ),
    ];
  }
  static List<Level> getNormalLevels() {
    return [
      Level(
        id: 1,
        theme: "Beach",
        items: [
            'Lantern', 'Compass', 'Mirror', 'Thunder', 'Whisper',
            'Voyager', 'Telescope', 'Paradox', 'Cipher', 'Labyrinth',
            'Chronicle', 'Phantom', 'Shadow', 'Echo', 'Mountain',
            'Sand', 'Wave', 'Shell', 'Sun', 'Surfboard',
        ],
        correctItems: ['Sand', 'Wave', 'Shell', 'Sun', 'Surfboard'],
        imageAsset: 'assets/images/beach_tv.png',
      ),
      // Level 2
      Level(
        id: 2,
        theme: "Kitchen",
        items: [
          'Sand', 'Table', 'Avocado', 'Lion', 'Surf',
          'Apple', 'Bird', 'Goat', 'Chair', 'Ant',
          'Waves', 'Earth', 'Sun', 'Shells', 'Mango',
          'Fork', 'Spoon', 'Knife', 'Plate', 'Cup',
        ],
        correctItems: ['Fork', 'Spoon', 'Knife', 'Plate', 'Cup'],
        imageAsset: 'assets/images/kitchen_tv.png',
      ),
      // Level 3
      Level(
        id: 3,
        theme: "Sea",
        items: [
          'Mountain', 'River', 'boat', 'Sky', 'Cloud',
          'Rock', 'Tree', 'Flower', 'Butterfly', 'Shadow',
          'Mirror', 'Lantern', 'Echo', 'Compass', 'Whisper',
          'Fish', 'Shark', 'Whale', 'Dolphin', 'Octopus',
        ],
        correctItems: ['Fish', 'Shark', 'Whale', 'Dolphin', 'Octopus'],
        imageAsset: 'assets/images/sea_tv.png',
      ),
      // Level 4
      Level(
        id: 4,
        theme: "Sea",
        items: [
          'Mountain', 'River', 'boat', 'Sky', 'Cloud',
          'Rock', 'Tree', 'Flower', 'Butterfly', 'Shadow',
          'Mirror', 'Lantern', 'Echo', 'Compass', 'Whisper',
          'Fish', 'Shark', 'Whale', 'Dolphin', 'Octopus',
        ],
        correctItems: ['Fish', 'Shark', 'Whale', 'Dolphin', 'Octopus'],
        imageAsset: 'assets/images/sea_tv.png',
      ),
      // Level 5
      Level(
        id: 5,
        theme: "Sea",
        items: [
          'Mountain', 'River', 'boat', 'Sky', 'Cloud',
          'Rock', 'Tree', 'Flower', 'Butterfly', 'Shadow',
          'Mirror', 'Lantern', 'Echo', 'Compass', 'Whisper',
          'Fish', 'Shark', 'Whale', 'Dolphin', 'Octopus',
        ],
        correctItems: ['Fish', 'Shark', 'Whale', 'Dolphin', 'Octopus'],
        imageAsset: 'assets/images/sea_tv.png',
      ),
    ];
  }
}
