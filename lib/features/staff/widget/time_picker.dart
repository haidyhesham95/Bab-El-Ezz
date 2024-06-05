import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

TextButton timePicker(BuildContext context, String text, state) {
  return TextButton(
    onPressed: () async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.dial,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: ColorsAsset.kGreen,
                selectionColor: Colors.white,
                selectionHandleColor: Colors.white,
              ),
              dialogBackgroundColor: ColorsAsset.kGreen,
              dataTableTheme: DataTableThemeData(
                headingCellCursor: MaterialStateMouseCursor.clickable,
                dataRowCursor: MaterialStateMouseCursor.clickable,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => ColorsAsset.kGreen),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => ColorsAsset.kGreen),
                dataTextStyle: AppStyles.styleRegular14(context)
                    .copyWith(color: ColorsAsset.kGreen),
                headingTextStyle: AppStyles.styleRegular14(context)
                    .copyWith(color: ColorsAsset.kGreen),
              ),
              colorScheme: const ColorScheme.dark().copyWith(
                onBackground: ColorsAsset.kGreen,
                onPrimaryContainer: ColorsAsset.kGreen,
                onSurface: ColorsAsset.kGreen,
                onSecondary: ColorsAsset.kGreen,
                secondary: ColorsAsset.kGreen,
                primary: ColorsAsset.kGreen,
                onPrimary: Colors.white,
                onError: ColorsAsset.kGreen,
                scrim: ColorsAsset.kGreen,
                shadow: ColorsAsset.kGreen,
                primaryContainer: Colors.white,
                onSecondaryContainer: ColorsAsset.kGreen,
                secondaryContainer: ColorsAsset.kGreen,
                inversePrimary: ColorsAsset.kGreen,
                onInverseSurface: ColorsAsset.kGreen,
                inverseSurface: ColorsAsset.kGreen,
                tertiary: Colors.white,
                onTertiary: Colors.white,
                onTertiaryContainer: Colors.white,
                tertiaryContainer: ColorsAsset.kGreen,
                error: ColorsAsset.kGreen,
                onErrorContainer: ColorsAsset.kGreen,
                background: Colors.white,
              ),
            ),
            child: child!,
          );
        },
      );
      if (pickedTime != null) {
        state(pickedTime);
      }
    },
    child: Text(
      text ?? 'اختر الوقت',
      style: AppStyles.styleRegular14(context).copyWith(color: Colors.white),
    ),
  );
}
