import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        label: 'Add Post',
      ),
    );
  }
}
