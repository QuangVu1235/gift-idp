import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';

abstract class ViewWidget<V extends StatefulWidget, M extends ViewModel>
    extends State<V> {
  late M _viewModel;

  M get viewModel => _viewModel;
  @protected
  void loadArguments() {}

  @protected
  M createViewModel();

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    _viewModel = createViewModel();
    _viewModel.initState();
  }

  @override
  void didUpdateWidget(covariant V oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadArguments();
  }

  @override
  @protected
  @mustCallSuper
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
