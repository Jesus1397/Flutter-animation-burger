import 'package:flutter/material.dart';
import 'package:flutter_animation_burger/db/ingredients_db.dart';
import 'package:provider/provider.dart';

class BurgerWidget extends StatelessWidget {
  const BurgerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: SizedBox(
        height: size.height * 0.75,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -180,
              left: -20,
              right: 0,
              child: SizedBox(
                height: size.height * 0.75,
                child: Consumer<IngredientsModel>(
                  builder: (context, ingredientsModel, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: ingredientsModel.ingredients.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        var ingredient = ingredientsModel.ingredients[index];
                        return Align(
                          heightFactor: 0.55,
                          alignment: Alignment.topCenter,
                          child: AnimatedContainer(
                            curve: Curves.decelerate,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            height: ingredient.selected ? 110 : 0,
                            width: ingredient.selected
                                ? (ingredient ==
                                        ingredientsModel.ingredients.first
                                    ? size.width * 0.5
                                    : size.width * 0.6)
                                : 0,
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                ingredient.image,
                              ),
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
