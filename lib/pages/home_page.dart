import 'package:flutter/material.dart';
import 'package:flutter_animation_burger/db/ingredients_db.dart';
import 'package:flutter_animation_burger/widgets/background_widget.dart';
import 'package:flutter_animation_burger/widgets/bottom_bar_widget.dart';
import 'package:flutter_animation_burger/widgets/burger_widget.dart';
import 'package:flutter_animation_burger/widgets/ingredient_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  // const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BurgerWidget(),
                      SizedBox(
                        width: 80,
                        height: 500,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: ingredientsList.length,
                          reverse: true,
                          itemBuilder: (BuildContext context, int index) {
                            var ingrient = ingredientsList[index];
                            return index == 0 || index == 7 || index == 2
                                ? Container()
                                : IngredientWidget(
                                    name: ingrient.name,
                                    image: ingrient.image,
                                    selected: ingrient.selected,
                                    onTap: () {
                                      setState(() {
                                        ingrient.selected = !ingrient.selected;
                                      });
                                    },
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 60),
                ],
              ),
            ),
            // const BottomBar(),
          ],
        ),
      ),
    );
  }
}
