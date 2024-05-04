import 'package:bab_el_ezz/features/setting/theme_cubit.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/assets.dart';
import '../../../shared_utils/styles/colors.dart';
import '../drop_menu/drop_menu_cubit.dart';



class DropMenuWidget extends StatelessWidget {
  const DropMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return
      BlocProvider(
          create: (context) => DropMenuCubit(),
          child: BlocBuilder<DropMenuCubit, DropMenuState>(
          builder: (context, state) {
      DropMenuCubit cubit = DropMenuCubit.get(context);
        return GestureDetector(
        onTap: () {
          showMenu(

            context: context,
            position:RelativeRect.fromLTRB(0, 60, 50, 0), // Adjust the values as needed

            items: <PopupMenuEntry>[
              PopupMenuItem(
                enabled: false,
                child: Center(
                  child: BlocConsumer<ThemeCubit,ThemeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      ThemeCubit cubit1 = ThemeCubit.get(context);
                      return
                    Container(
                      width: size.width*0.45,
                      height: size.height*0.045,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff989090).withOpacity(0.3),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {

                              cubit.changeIndex(0);
                              cubit1.toggleLightTheme();
                            },

                            child: Container(
                              width: size.width*0.20,
                              height: size.height * 0.035,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: cubit.selectedIndex == 0
                                    ? ColorsAsset.kGreen
                                    :  Color(0xff989090).withOpacity(0.1),
                              ),
                              child: Center(
                                  child: SvgPicture.asset(Assets.imagesDarkMode),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.changeIndex(1);
                                cubit1.toggleDarkTheme();
                            },
                            child: Container(
                              width: size.width*0.20,
                              height: size.height * 0.035,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: cubit.selectedIndex == 1
                                    ? ColorsAsset.kGreen
                                    :  Color(0xff989090).withOpacity(0.1),

                              ),
                              child: Center(
                                child: SvgPicture.asset(Assets.imagesLightMode),
                              ),
                            ),
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
                child: ListTile(
                  leading:  SvgPicture.asset(
                    Assets.imagesUser,
                  ),
                  title: Text('الملف الشخصي', style: AppStyles.styleMedium16(context).copyWith(color: Colors.white)), // Adjust text color if needed
                  onTap: () {
                    Navigator.pushNamed(context, 'editProfile');
                  },
                ),
              ),
              PopupMenuItem(
                enabled: false,
                child: ListTile(
                  leading:  SvgPicture.asset(
                    Assets.imagesLogoutIcon,
                  ),
                  title: Text('تسجيل خروج', style: AppStyles.styleMedium16(context).copyWith(color: Colors.white)), // Adjust text color if needed
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

              ),
              // Add more PopupMenuItems as needed
            ],
          );
        },
        child: SvgPicture.asset(
          Assets.imagesSettings,
        ),

      );
    },
    ),
    );


  }
}


