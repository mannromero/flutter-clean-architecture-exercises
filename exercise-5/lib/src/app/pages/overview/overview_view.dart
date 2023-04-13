import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:template/src/app/pages/overview/overview_controller.dart';
import 'package:template/src/data/data_user_repository.dart';

class OverviewPage extends View {
  static const route = '/overview';
  const OverviewPage({Key? key}) : super(key: key);

  @override
  OverviewPageState createState() => OverviewPageState();
}

class OverviewPageState extends ViewState<OverviewPage, OverviewController> {
  OverviewPageState() : super(OverviewController(DataUserRepository()));

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Overview Page'),
      ),
      body: Center(
        child: ControlledWidgetBuilder<OverviewController>(
          builder: (context, controller) {
            return ElevatedButton(
              onPressed: controller.handleTodo,
              child: const Text('Navigate to You'),
            );
          },
        ),
      ),
    );
  }
}
