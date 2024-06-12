import 'package:flutter/material.dart';
import 'package:flutter_animation_burger/db/ingredients_db.dart';

class BurgerWidget extends StatelessWidget {
  const BurgerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 500,
        child: Stack(
          children: [
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ingredientsList.length,
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    var ingredient = ingredientsList[index];
                    return Align(
                      heightFactor: 0.6,
                      alignment: Alignment.topCenter,
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        height: ingredient.selected ? 100 : 0,
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Image(
                          image: AssetImage(
                            ingredient.image,
                          ),
                          width: ingredient.width,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
