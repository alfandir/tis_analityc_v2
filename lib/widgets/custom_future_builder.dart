import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder({
    Key? key,
    this.future,
    required this.child,
    this.builder,
    this.loading,
    this.error,
    this.refreshError,
  }) : super(key: key);

  final Future<T>? future;
  final Widget child;
  final AsyncWidgetBuilder<T>? builder;
  final Widget? loading;
  final Widget? error;
  final dynamic Function()? refreshError;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: builder ??
          (context, snapshot) {
            return snapshotBuilder(
              snapshot,
              child: child,
              loading: loading,
              error: error,
              refreshError: refreshError,
            );
          },
    );
  }

  Widget snapshotBuilder(
    AsyncSnapshot snapshot, {
    required Widget child,
    Widget? error,
    Widget? loading,
    Function()? refreshError,
  }) {
    Widget? screen;
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return screen = error ?? const Text('Error');
      case ConnectionState.waiting:
        return screen = loading ?? const CircularProgressIndicator();
      case ConnectionState.active:
        break;
      case ConnectionState.done:
        if (snapshot.hasData) {
          return screen = child;
        } else if (snapshot.hasError) {
          //Karena Error api sudah di handle di api_helper.
          //Jika bukan error API, kirim error ke sentry.

          return screen = Text(
            snapshot.error.toString(),
          );
        }
        break;
      default:
        return screen = const CircularProgressIndicator();
    }
    return screen!;
  }
}
