import 'package:bab_el_ezz/features/setting/manager/theme/theme_cubit.dart';
import 'package:bab_el_ezz/features/setting/widget/list_tile_widget.dart';
import 'package:bab_el_ezz/features/setting/widget/theme_container.dart';
import 'package:bab_el_ezz/features/setting/widget/toggle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/assets.dart';
import '../manager/drop_menu/drop_menu_cubit.dart';

class DropMenuWidget extends StatelessWidget {
  const DropMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => DropMenuCubit(),
      child: BlocBuilder<DropMenuCubit, DropMenuState>(
        builder: (context, state) {
          DropMenuCubit cubit = DropMenuCubit.get(context);
          return PopupMenuButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            padding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  enabled: false,
                  child: Center(
                    child: BlocConsumer<ThemeCubit, ThemeState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        ThemeCubit cubit1 = ThemeCubit.get(context);
                        return toggleContainer(context,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cubit.changeIndex(0);
                                  cubit1.toggleLightTheme();
                                },
                                child:themeContainer(context, Assets.imagesDarkMode, cubit.selectedIndex == 0)

                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.changeIndex(1);
                                  cubit1.toggleDarkTheme();
                                },
                                child:themeContainer(context, Assets.imagesLightMode,cubit.selectedIndex == 1 )

                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  enabled: false,
                  child: listTileWidget(context, Assets.imagesUser, 'الملف الشخصي', () { Navigator.pushNamed(context, 'editProfile'); })
                ),
                PopupMenuItem(
                  enabled: false,
                  child: listTileWidget(context,
                    Assets.imagesLogoutIcon, 'تسجيل خروج',
                        () {Navigator.pop(context); },
                    radius: 8,
                     colors: [
                        Color.fromRGBO(26, 96, 69, 95),
                        Color.fromRGBO(40, 145, 104, 93),
                      ], )
                ),
              ];
            },
          );
        },
      ),
    );
  }
}
