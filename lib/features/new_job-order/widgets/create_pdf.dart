import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class PdfGenerator {
  static late pw.Font arFont;

  static init() async {
    arFont = pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo-Arabic-Regular.ttf"));
  }

  static Future<void> createPdf() async {
    await init();
    final pdf = pw.Document();

    List<Map<String, dynamic>> items = [
      {'الصنف': 'صنف 1', 'الكمية': 2, 'السعر': 200, 'ملاحظات': 'ملاحظه'},
      {'الصنف': 'صنف 2', 'الكمية': 3, 'السعر': 150, 'ملاحظات': 'ملاحظه'},
    ];

    double total = items.fold(0, (sum, item) => sum + item['الكمية'] * item['السعر']);
    double discount = 50;
    double workmanship = 100;

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),
        textDirection: pw.TextDirection.rtl,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                padding: pw.EdgeInsets.only(right: 20, top: 15, bottom: 15),
                decoration: pw.BoxDecoration(
                  color: PdfColors.grey200,
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Text("اسم المركز: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("الاسم ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text("اسم الفرع: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("الاسم ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text("اسم العميل: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("الاسم ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text("نوع السيارة: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("النوع ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text("موديل السيارة: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("النوع ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text("عدد الكيلو متر: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("200 ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text("نوع الصيانة: ", style: pw.TextStyle(fontSize: 20)),
                        pw.Text("النوع ", style: pw.TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xff289168)),
                    children: [
                      pw.Text('ملاحظات', style: pw.TextStyle(color: PdfColors.white), textAlign: pw.TextAlign.center),
                      pw.Text('السعر', style: pw.TextStyle(color: PdfColors.white), textAlign: pw.TextAlign.center),
                      pw.Text('الكمية', style: pw.TextStyle(color: PdfColors.white), textAlign: pw.TextAlign.center),
                      pw.Text('الصنف', style: pw.TextStyle(color: PdfColors.white), textAlign: pw.TextAlign.center),
                    ],
                  ),
                  ...items.map((item) => pw.TableRow(
                    children: [
                      pw.Text(item['الصنف'].toString(), textAlign: pw.TextAlign.center),
                      pw.Text(item['الكمية'].toString(), textAlign: pw.TextAlign.center),
                      pw.Text(item['السعر'].toString(), textAlign: pw.TextAlign.center),
                      pw.Text(item['ملاحظات'].toString(), textAlign: pw.TextAlign.center),
                    ],
                  )).toList(),
                  pw.TableRow(
                    children: [
                      pw.Container(),
                      pw.Container(),
                      pw.Container(),
                      pw.Container(),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('${discount.toString()}', textAlign: pw.TextAlign.center),
                      pw.Text('', textAlign: pw.TextAlign.center),
                      pw.Text('', textAlign: pw.TextAlign.center),
                      pw.Text('الخصم',  textAlign: pw.TextAlign.center),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('${workmanship.toString()}', textAlign: pw.TextAlign.center),

                      pw.Text('', textAlign: pw.TextAlign.center),
                      pw.Text('', textAlign: pw.TextAlign.center),
                      pw.Text('المصنعية',  textAlign: pw.TextAlign.center),

                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text('${total.toString()}', textAlign: pw.TextAlign.center),

                      pw.Text('', textAlign: pw.TextAlign.center),
                      pw.Text('', textAlign: pw.TextAlign.center),
                      pw.Text('الاجمالي', textAlign: pw.TextAlign.center),

                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/انهاء امر الشغل.pdf");
    await file.writeAsBytes(await pdf.save());

    await OpenFile.open(file.path);
  }
}


