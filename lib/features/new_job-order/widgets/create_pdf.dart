import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfGenerator {
  static late Font arFont;

  static init() async {
    arFont = Font.ttf(
        (await rootBundle.load("assets/fonts/Cairo-Arabic-Regular.ttf")));
  }

  static Future<void> createPdf() async {
    await init();
    final pdf = Document();

    pdf.addPage(
      Page(
        theme: ThemeData.withFont(
          base: arFont,
        ),
        textDirection: TextDirection.rtl,
        build: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: PdfColors.grey200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("اسم المركز: ", style: TextStyle(fontSize: 20)),
                        Text("الاسم ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("اسم الفرع: ", style: TextStyle(fontSize: 20)),
                        Text("الاسم ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("اسم العميل: ", style: TextStyle(fontSize: 20)),
                        Text("الاسم ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("نوع السيارة: ", style: TextStyle(fontSize: 20)),
                        Text("النوع ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("موديل السيارة: ", style: TextStyle(fontSize: 20)),
                        Text("النوع ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("عدد الكيلو متر: ",
                            style: TextStyle(fontSize: 20)),
                        Text("200 ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("نوع الصيانة: ", style: TextStyle(fontSize: 20)),
                        Text("النوع ", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              TableHelper.fromTextArray(
                context: context,
                data: <List<String>>[
                  <String>[
                    'الاجمالي',
                    ' المصنعية ',
                    ' الخصم ',
                    'السعر',
                    'الكمية',
                    'الصنف'
                  ],
                  <String>['200', '200', '200', '200', '200', '200'],
                  <String>['200', '200', '200', '200', '200', '200'],
                ],
                cellAlignment: Alignment.center,
                headerStyle: TextStyle(color: PdfColors.white),
                cellHeight: 30,
                headerDecoration: BoxDecoration(
                  color: PdfColor.fromInt(0xff289168),
                ),
                headerHeight: 40,
                cellAlignments: {
                  for (int i = 0; i < 6; i++) i: Alignment.centerRight,
                },
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/${DateTime.now()}.pdf");
    await file.writeAsBytes(await pdf.save());

    await OpenFile.open(file.path, type: "application/pdf");
  }
}
