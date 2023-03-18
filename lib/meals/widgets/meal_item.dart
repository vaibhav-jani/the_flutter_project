import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;

  const MealItem(this._meal, {super.key});

  String get _complexityText {
    switch (_meal.complexity) {
      case MealComplexity.Challenging:
        return "Challenging";
      case MealComplexity.Simple:
        return "Simple";
      case MealComplexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get _affordabilityText {
    switch (_meal.affordability) {
      case MealAffordability.Affordable:
        return "Affordable";
      case MealAffordability.Pricey:
        return "Pricey";
      case MealAffordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          selectMeal();
        },
        radius: 16,
        splashColor: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    _meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    _meal.title,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 4),
                      Text('${_meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 4),
                      Text(_complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 4),
                      Text(_affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
