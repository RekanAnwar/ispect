// ignore_for_file: prefer_const_constructor_declarations, cascade_invocations

import 'package:flutter/material.dart';
import 'package:ispect/ispect.dart';
import 'package:ispect/src/common/extensions/pretty_json.dart';

extension StringBufferExtension on StringBuffer {
  // ignore: avoid_positional_boolean_parameters
  void writelnIf(bool condition, String value) {
    if (condition) {
      writeln(value);
    }
  }
}

class ISpectNavigatorObserver extends NavigatorObserver {
  ISpectNavigatorObserver({
    this.isLogGestures = false,
    this.onPush,
    this.onReplace,
    this.onPop,
    this.onRemove,
    this.onStartUserGesture,
    this.onStopUserGesture,
  });

  final bool isLogGestures;
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)?
      onPush;
  final void Function({Route<dynamic>? newRoute, Route<dynamic>? oldRoute})?
      onReplace;
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)?
      onPop;
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)?
      onRemove;
  final void Function(Route<dynamic> route, Route<dynamic>? previousRoute)?
      onStartUserGesture;
  final VoidCallback? onStopUserGesture;

  String _getRouteType(Route<dynamic>? route) {
    if (route is PageRoute) {
      return 'Page';
    } else if (route is ModalRoute) {
      return 'Modal';
    } else {
      return route.runtimeType.toString();
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final routeName = route.settings.name ?? 'Unknown';
    final previousRouteName = previousRoute?.settings.name ?? 'None';

    final logMessage = StringBuffer()
      ..writeln('Push: $routeName (Type: ${_getRouteType(route)})')
      ..writelnIf(
        previousRouteName.isNotEmpty,
        'Previous route: $previousRouteName (Type: ${_getRouteType(previousRoute)})',
      )
      ..writelnIf(
        route.settings.arguments != null,
        'Arguments: ${prettyJson(route.settings.arguments)}',
      );

    if (logMessage.isNotEmpty) {
      ISpectTalker.route(logMessage.toString().trim());
    }

    onPush?.call(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final logMessage = StringBuffer();

    final newRouteName = newRoute?.settings.name ?? 'Unknown';
    final oldRouteName = oldRoute?.settings.name ?? 'None';

    logMessage
      ..writeln(
        'Replace: New route after replaced: $newRouteName (Type: ${_getRouteType(newRoute)})',
      )
      ..writelnIf(
        oldRouteName.isNotEmpty,
        'Old route: $oldRouteName (Type: ${_getRouteType(oldRoute)})',
      )
      ..writelnIf(
        newRoute?.settings.arguments != null,
        'Arguments: ${newRoute?.settings.arguments}',
      );

    if (logMessage.isNotEmpty) {
      ISpectTalker.route(logMessage.toString().trim());
    }

    onReplace?.call(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final logMessage = StringBuffer();

    final routeName = previousRoute?.settings.name ?? 'Unknown';
    final previousRouteName = route.settings.name ?? 'None';

    logMessage
      ..writeln(
        'Pop: New route after popped: $routeName (Type: ${_getRouteType(previousRoute)})',
      )
      ..writelnIf(
        previousRouteName.isNotEmpty,
        'Previous route: $previousRouteName (Type: ${_getRouteType(route)})',
      )
      ..writelnIf(
        route.settings.arguments != null,
        'Arguments: ${prettyJson(route.settings.arguments)}',
      );

    if (logMessage.isNotEmpty) {
      ISpectTalker.route(logMessage.toString().trim());
    }

    onPop?.call(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final logMessage = StringBuffer();

    final routeName = route.settings.name ?? 'Unknown';
    final previousRouteName = previousRoute?.settings.name ?? 'None';

    logMessage
      ..writeln(
        'Remove: New route after removed: $routeName (Type: ${_getRouteType(route)})',
      )
      ..writelnIf(
        previousRouteName.isNotEmpty,
        'Previous route: $previousRouteName (Type: ${_getRouteType(previousRoute)})',
      )
      ..writelnIf(
        route.settings.arguments != null,
        'Arguments: ${prettyJson(route.settings.arguments)}',
      );

    if (logMessage.isNotEmpty) {
      ISpectTalker.route(logMessage.toString().trim());
    }

    onRemove?.call(route, previousRoute);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    if (isLogGestures) {
      final logMessage = StringBuffer();

      final routeName = route.settings.name ?? 'Unknown';
      final previousRouteName = previousRoute?.settings.name ?? 'None';

      logMessage
        ..writeln(
          'Gesture: User gesture started on route: $routeName (Type: ${_getRouteType(route)})',
        )
        ..writelnIf(
          previousRouteName.isNotEmpty,
          'Previous route: $previousRouteName (Type: ${_getRouteType(previousRoute)})',
        )
        ..writelnIf(
          route.settings.arguments != null,
          'Arguments: ${prettyJson(route.settings.arguments)}',
        );

      if (logMessage.isNotEmpty) {
        ISpectTalker.route(logMessage.toString().trim());
      }
    }

    onStartUserGesture?.call(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    if (isLogGestures) {
      ISpectTalker.route('User gesture stopped');
    }

    onStopUserGesture?.call();
  }
}
