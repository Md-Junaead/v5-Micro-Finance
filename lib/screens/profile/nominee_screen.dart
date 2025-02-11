import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1_micro_finance/configs/viewmodels/nominee_viewmodel.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';
import 'package:v1_micro_finance/configs/widgets/nominee_details.dart';

class NomineeScreen extends StatelessWidget {
  const NomineeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Nominee Details"),
      body: SafeArea(
        child: Consumer<NomineeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (viewModel.nominee == null) {
              return const Center(child: Text("No nominee data available"));
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: NomineeDetails(nominee: viewModel.nominee!),
              );
            }
          },
        ),
      ),
    );
  }
}
