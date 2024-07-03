final class ISpectTalkerOptions {
  final bool isFlutterPresentHandlingEnabled;
  final bool isPlatformDispatcherHandlingEnabled;
  final bool isFlutterErrorHandlingEnabled;
  final bool isUncaughtErrorsHandlingEnabled;
  final bool isBlocHandlingEnabled;

  const ISpectTalkerOptions({
    this.isFlutterPresentHandlingEnabled = true,
    this.isPlatformDispatcherHandlingEnabled = true,
    this.isFlutterErrorHandlingEnabled = true,
    this.isUncaughtErrorsHandlingEnabled = true,
    this.isBlocHandlingEnabled = true,
  });
}
