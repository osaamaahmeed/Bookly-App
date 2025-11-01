import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookPreviewView extends StatefulWidget {
  const BookPreviewView({super.key, required this.url});
  final String url;

  @override
  State<BookPreviewView> createState() => _BookPreviewViewState();
}

class _BookPreviewViewState extends State<BookPreviewView> {
  late final WebViewController controller;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
              hasError = false;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoading = false;
              hasError = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Preview'),
        backgroundColor: const Color(0xff100B20),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading && !hasError)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (hasError)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Unable to load preview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'The preview link is unavailable',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

