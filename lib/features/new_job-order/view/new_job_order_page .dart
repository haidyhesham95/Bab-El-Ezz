import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../widgets/new_ job _order _body.dart';

class NewJobOrderPage extends StatelessWidget {
  const NewJobOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context, "امر شغل جديد"),
      body: const NewJobOrderBody(),
    );
  }
}
