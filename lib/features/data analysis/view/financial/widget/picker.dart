import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class AppFunctions {
  static Future<DateTimeRange?> showPickerRange(
      BuildContext context, DateTimeRange? initialRange) async {
    DateTimeRange? selectedRange;

    await showDialog<DateTimeRange>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            surfaceTintColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SfDateRangePicker(
                  todayHighlightColor: ColorsAsset.kGreen,
                  startRangeSelectionColor: ColorsAsset.kGreen,
                  endRangeSelectionColor: ColorsAsset.kGreen,

                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is PickerDateRange) {
                      selectedRange = DateTimeRange(
                        start: (args.value as PickerDateRange).startDate ?? DateTime.now(),
                        end: (args.value as PickerDateRange).endDate ?? DateTime.now(),
                      );
                    }
                  },
                  cancelText: 'Cancel',
                  confirmText: 'OK',

                  selectionMode: DateRangePickerSelectionMode.range,
                  enablePastDates: true,
                  maxDate: DateTime.now(),
                  backgroundColor: Colors.black,
                  headerStyle: const DateRangePickerHeaderStyle(
                    backgroundColor: Colors.black,
                  ),

                  showActionButtons: true,
                  selectionColor: Colors.black,
                  rangeSelectionColor: ColorsAsset.kDarkGray,
                  rangeTextStyle: const TextStyle(color: Colors.white),

                 // selectionTextStyle: const TextStyle(color: Colors.white),
                  onSubmit: (value) {
                    Navigator.pop(context, selectedRange);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  initialSelectedRange: initialRange == null
                      ? null
                      : PickerDateRange(initialRange.start, initialRange.end),
                ),
              ],
            ),
          ),
        );
      },
    );

    return selectedRange;
  }
}
