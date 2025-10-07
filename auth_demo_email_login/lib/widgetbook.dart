import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'widgets/dummy_button.dart';
import 'widgets/dummy_button.dart';
import 'widgets/dummy_card.dart';
import 'widgets/dummy_avatar.dart';

void main() {
  runApp(const MyWidgetbook());
}

class MyWidgetbook extends StatelessWidget {
  const MyWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Required, but you can leave it empty
      directories: [
        // 🟢 Folder for Buttons
        WidgetbookFolder(
          name: 'Buttons',
          children: [
            WidgetbookComponent(
              name: 'Dummy Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const DummyButton(),
                ),
              ],
            ),
          ],
        ),

        // 🟢 Folder for Cards
        WidgetbookFolder(
          name: 'Cards',
          children: [
            WidgetbookComponent(
              name: 'Dummy Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const DummyCard(),
                ),
              ],
            ),
          ],
        ),

        // 🟢 Folder for Avatars
        WidgetbookFolder(
          name: 'Avatars',
          children: [
            WidgetbookComponent(
              name: 'Dummy Avatar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const DummyAvatar(),
                ),
              ],
            ),
          ],
        ),
      ],

      // Optional, you can remove this too if you don’t want addons
      addons: const [],
    );
  }
}
