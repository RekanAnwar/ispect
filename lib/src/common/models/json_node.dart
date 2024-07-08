// Copyright 2020 the Dart project authors.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file or at
// https://developers.google.com/open-source/licenses/bsd

import 'package:flutter/material.dart';

/// One node of a tree.
class JsonNode {
  JsonNode({
    this.key,
    this.children,
    Widget? content,
  }) : content = content ?? const SizedBox.shrink();

  final List<JsonNode>? children;
  final Widget content;
  final Key? key;
}
