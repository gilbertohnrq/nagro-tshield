// coverage:ignore-file
import 'dart:async';
import 'dart:io';

import 'package:finan/app/core/theme/theme_colors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';

class PDFViewer extends StatefulWidget {
  final File curFile;

  const PDFViewer({
    super.key,
    required this.curFile,
  });

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.kPrimary,
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Share.shareXFiles(
                  [XFile(widget.curFile.path)],
                  text: 'CCB');
              if (result.status == ShareResultStatus.success) {}
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.curFile.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: true,
            onRender: (pages) {
              setState(() {
                pages = pages;
                isReady = true;
              });
            },
            onError: (error) {
              debugPrint(error.toString());
              FirebaseCrashlytics.instance
                  .recordError(error, StackTrace.current);
            },
            onPageError: (page, error) {
              debugPrint('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onPageChanged: (int? page, int? total) {},
          ),
        ],
      ),
    );
  }
}
