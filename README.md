<div align="center">
<p align="center">
    <a href="https://github.com/K1yoshiSho/ispect" align="center">
        <img src="https://github.com/K1yoshiSho/packages_assets/blob/main/assets/ispect/ispect.png?raw=true" width="400px">
    </a>
</p>
</div>

<h2 align="center"> A package combining Inspector, Talker, and more from pub.dev for efficient project implementation. 🚀 </h2>

<p align="center">
This package is not meant to be a groundbreaking innovation but rather a curated collection of high-quality tools from pub.dev, tailored for my future projects. I've decided to share it with the community in hopes it might be of use to others. It combines time-tested utilities and my personal enhancements aimed at improving project efficiency and adaptability.

As the underlying packages evolve, I plan to update and enhance this package, possibly adding new features based on community feedback and emerging needs. This package is meant to be a dynamic toolset that grows and improves over time, facilitating smoother development processes for Flutter developers.

Your feedback is highly valued as it will help shape future updates and ensure the package remains relevant and useful. 😊


   <br>
   <span style="font-size: 0.9em"> Show some ❤️ and <a href="https://github.com/K1yoshiSho/ispect.git">star the repo</a> to support the project! </span>
</p>

## Packages
ISpect can be extended using other parts of this package <br>

| Package | Version | Description | 
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [ispect](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect) | [![Pub](https://img.shields.io/pub/v/ispect.svg?style=flat-square)](https://pub.dev/packages/ispect) | **Main** package of ISpect |
| [ispect_ai_reporter](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect_ai_reporter) | [![Pub](https://img.shields.io/pub/v/ispect.svg)](https://pub.dev/packages/ispect) | An add-on package to use the **Gemini AI Api** to generate a `report` and `log` questions |
| [ispect_jira](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect_jira) | [![Pub](https://img.shields.io/pub/v/ispect.svg)](https://pub.dev/packages/ispect) | An add-on package to use the **Jira Atlassian Api** to create issue tickets immediately via `Feedback` |


## 📌 Features

- ✅ Draggable button for route to ISpect page, manage Inspector tools
- ✅ Localizations: ru, en, kk. *(I will add more translations in the future.)*
- ✅ Talker logger implementation: **BLoC**, **Dio**, **http**, **Routing**, **Provider**
- ✅ You can customize more options during initialization of ISpectTalker like BLoC, Dispatcher error and etc.
- ✅ Updated ISpectTalker page: added more options.
   - Detailed `HTTP` logs: `request`, `response`, `error`
   - Debug tools
   - Cache manager
   - Device and app info
- ✅ Feedback
- ✅ Performance tracker
- ✅ AI helper

## 📜 Showcase

<div align="center">
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/panel.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/draggable.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/color_picker.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/feedback.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/logs.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/detailed_http_request.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/detailed_http_error.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/detailed_http_response.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/jira_auth.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/ai_chat.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/reporter.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/monitoring.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/cache.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/device_info.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/info.png?raw=true" width="200" style="margin: 5px;" />
  <img src="https://github.com/yelmuratoff/ispect/blob/main/assets/preview/inspector.png?raw=true" width="200" style="margin: 5px;" />
</div>

## 📌 Getting Started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  ispect: ^2.0.5
```

### Add import package

```dart
import 'package:ispect/ispect.dart';
import 'package:talker_flutter/talker_flutter.dart';
```

### Instructions for use:

1. Wrap `runApp` with `ISpect.run` method and pass `Talker` instance to it.
2. Wrap your root widget with `ISpectScopeWrapper` widget to enable `ISpect` where you can pass theme and options.
3. Add `ISpectBuilder` widget to your material app's builder and put `NavigatorObserver`.

Please, check the [example](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect/example) for more details.

>[!NOTE]
>
> - To add `ISpect AI helper`, follow the instructions provided here [ispect_ai_reporter](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect_ai_reporter).
>
> You can also check out an example of usage directly in [ispect_ai_reporter/example](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect_ai_reporter/example).
>
> - To add `ISpect Jira`, follow the instructions provided here [ispect_jira](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect_jira).
>
> You can also check out an example of usage directly in [ispect_jira/example](https://github.com/yelmuratoff/ispect/tree/main/packages/ispect_jira/example).

### Referenced packages:
A list of great packages I've used in ISpect:
[talker](https://pub.dev/packages/talker), 
[path_provider](https://pub.dev/packages/path_provider), 
[device_info_plus](https://pub.dev/packages/device_info_plus), 
[share_plus](https://pub.dev/packages/share_plus), 
[package_info_plus](https://pub.dev/packages/package_info_plus), 
[gap](https://pub.dev/packages/gap), 
[auto_size_text](https://pub.dev/packages/auto_size_text), 
[feedback](https://pub.dev/packages/feedback), 
[inspector](https://pub.dev/packages/inspector), 
[performance](https://pub.dev/packages/performance), 
[cr_json_widget](https://pub.dev/packages/cr_json_widget).

<br>
<div align="center" >
  <p>Thanks to all contributors of this package</p>
  <a href="https://github.com/yelmuratoff/ispect/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=yelmuratoff/ispect" />
  </a>
</div>
<br>