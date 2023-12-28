import '../configs/assets/assets_path.dart';

class FruitItem {
  final String title;
  final String iconPath;

  FruitItem({required this.title, required this.iconPath});
}

List<FruitItem> fruitList = [
  FruitItem(title: 'Abacaxi', iconPath: AssetsPath.ABACAXI),
  FruitItem(title: 'Banana', iconPath: AssetsPath.BANANA),
  FruitItem(title: 'Laranja', iconPath: AssetsPath.LARANJA),
  FruitItem(title: 'Limão', iconPath: AssetsPath.LIMAO),
  FruitItem(title: 'Maçã', iconPath: AssetsPath.MACA),
  FruitItem(title: 'Melancia', iconPath: AssetsPath.MELANCIA),
  FruitItem(title: 'Morango', iconPath: AssetsPath.MORANGO),
  FruitItem(title: 'Pera', iconPath: AssetsPath.PERA),
  FruitItem(title: 'Pêssego', iconPath: AssetsPath.PESSEGO),
  FruitItem(title: 'Uva', iconPath: AssetsPath.UVA),
];
