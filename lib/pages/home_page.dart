import 'package:flutter/material.dart';
import 'package:flutter_animation_burger/db/ingredients_db.dart';
import 'package:flutter_animation_burger/widgets/background_widget.dart';
import 'package:flutter_animation_burger/widgets/bottom_bar_widget.dart';
import 'package:flutter_animation_burger/widgets/burger_widget.dart';
import 'package:flutter_animation_burger/widgets/ingredient_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundWidget(),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.keyboard_backspace_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Customize a burger that suits your taste',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BurgerWidget(),
                      SizedBox(
                        width: 80,
                        height: 500,
                        child: Consumer<IngredientsModel>(
                          builder: (context, ingredientsModel, child) {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: ingredientsModel.ingredients.length,
                              reverse: true,
                              itemBuilder: (BuildContext context, int index) {
                                var ingredient =
                                    ingredientsModel.ingredients[index];
                                return index == 0 || index == 7 || index == 2
                                    ? Container()
                                    : IngredientWidget(
                                        name: ingredient.name,
                                        image: ingredient.image,
                                        selected: ingredient.selected,
                                        onTap: () {
                                          ingredientsModel
                                              .toggleSelection(index);
                                        },
                                      );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
