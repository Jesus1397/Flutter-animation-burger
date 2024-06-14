import 'package:flutter/material.dart';
import 'package:flutter_animation_burger/db/ingredients_db.dart';
import 'package:provider/provider.dart';

class BurgerWidget extends StatelessWidget {
  const BurgerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 500,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 500,
                child: Consumer<IngredientsModel>(
                  builder: (context, ingredientsModel, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: ingredientsModel.ingredients.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        var ingredient = ingredientsModel.ingredients[index];
                        return Align(
                          heightFactor: 0.6,
                          alignment: Alignment.topCenter,
                          child: AnimatedContainer(
                            curve: Curves.easeInOut,
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
