import 'package:flutter/material.dart';
import '../widgets/actions/bla_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlaButton(
                label: "Test 1",
                buttonType: ButtonType.primary,
                onButtonClick: () {},
                icon: Icon(Icons.search)
              ),
              SizedBox(height: 5),
              BlaButton(
                label: "Test 2",
                buttonType: ButtonType.secondary,
                onButtonClick: () {},
                icon: Icon(Icons.search),
              ),
              SizedBox(height: 5),
              BlaButton(
                label: "Test 3",
                buttonType: ButtonType.primary,
                onButtonClick: () {},
              ),
              SizedBox(height: 5),
              BlaButton(
                label: "Test 4",
                buttonType: ButtonType.secondary,
                onButtonClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
