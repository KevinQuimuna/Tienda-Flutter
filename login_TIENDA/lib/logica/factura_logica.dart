import 'package:flutter/foundation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';
import 'dart:typed_data';
import '../modelo/item_carrito.dart';

class FacturaLogica {
  Future<void> generarPDF(List<ItemCarrito> items, double total) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Factura', style: pw.TextStyle(fontSize: 24)),
            pw.Divider(),
            ...items.map((item) => pw.Text(
                '${item.zapato.nombre} x${item.cantidad} - \$${item.subtotal.toStringAsFixed(2)}')),
            pw.Divider(),
            pw.Text('Total: \$${total.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );

    // Generate PDF bytes
    final bytes = await pdf.save();

    if (kIsWeb) {
      // Web-specific PDF download
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute('download', 'factura.pdf')
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // Mobile/desktop platforms
      if (Platform.isAndroid || Platform.isIOS) {
        final output = await getApplicationDocumentsDirectory();
        final file = File('${output.path}/factura.pdf');
        await file.writeAsBytes(bytes);
        // You might want to use a plugin like open_file to open the PDF
      }
    }
  }
}