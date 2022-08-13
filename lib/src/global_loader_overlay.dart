import 'package:flutter/material.dart';

import '../loader_overlay.dart';

/// Global widget that can be used to wrap the whole app
class GlobalLoaderOverlay extends StatefulWidget {
  const GlobalLoaderOverlay({
    Key? key,
    required this.child,
    this.useDefaultLoading = true,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayWidget,
    this.disableBackButton = true,
    this.closeOnBackButton = false,
    this.textDirection = TextDirection.ltr,
    this.shouldAddBackButtonInterceptor = true,
  }) : super(key: key);

  /// The child that will have the overlay upon
  final Widget child;

  /// Whether to use or not the default loading
  final bool useDefaultLoading;

  /// The color of the overlay
  final Color? overlayColor;

  /// The opacity of the overlay
  final double? overlayOpacity;

  /// The widget of the overlay. This is great if you want to insert your own widget to serve as
  /// an overlay.
  final Widget? overlayWidget;

  /// Whether or not to disable the back button while loading.
  final bool disableBackButton;

  /// Hide the loader when back button pressed
  final bool closeOnBackButton;

  /// TextDirection of the app. This is generaly used when putting [LoaderOverlay] above MaterialApp.
  final TextDirection textDirection;

  /// Back button interceptor can collide with different navigation implementations. Set to false to disable overriding back button behavior.
  final bool shouldAddBackButtonInterceptor;

  @override
  _GlobalLoaderOverlayState createState() => _GlobalLoaderOverlayState();
}

class _GlobalLoaderOverlayState extends State<GlobalLoaderOverlay> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection,
      child: LoaderOverlay(
        useDefaultLoading: widget.useDefaultLoading,
        overlayColor: widget.overlayColor,
        overlayOpacity: widget.overlayOpacity,
        overlayWidget: widget.overlayWidget,
        disableBackButton: widget.disableBackButton,
        closeOnBackButton: widget.closeOnBackButton,
        shouldAddBackButtonInterceptor: widget.shouldAddBackButtonInterceptor,
        child: widget.child,
      ),
    );
  }
}
