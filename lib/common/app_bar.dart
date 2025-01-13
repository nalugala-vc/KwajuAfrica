import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:kwajuafrica/common/widgets/app_bar_actions.dart';
import 'package:kwajuafrica/utils/spacers/spacers.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      leading: IconButton(
          icon: const HeroIcon(
            HeroIcons.bars3,
            style: HeroIconStyle.outline,
            size: 20,
          ),
          onPressed: () {}),
      actions: [
        AppBarActions(
          icon: const HeroIcon(
            HeroIcons.mapPin,
            style: HeroIconStyle.outline,
            size: 20,
          ),
          onTap: () {},
        ),
        spaceW15,
        AppBarActions(
          icon: const HeroIcon(
            HeroIcons.shoppingCart,
            style: HeroIconStyle.outline,
            size: 20,
          ),
          onTap: () {},
        ),
        spaceW15,
        AppBarActions(
          icon: const HeroIcon(
            HeroIcons.bell,
            style: HeroIconStyle.outline,
            size: 20,
          ),
          onTap: () {},
        ),
        spaceW10
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
