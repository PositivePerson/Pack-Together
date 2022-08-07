import 'package:flutter/material.dart';
import 'package:pack_together/widgets/rounded_input.dart';

class UpdateMenu extends StatelessWidget {
  const UpdateMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("UpdateMenu screen building...");

    return Scaffold(
      appBar: AppBar(title: const Text("Update Menu")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: "Name",
              onSubmit: (value) => print(value),
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "Color",
              onSubmit: (value) => print(value),
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "Location",
              onSubmit: (value) => print(value),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepOrange),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text("Name"),
                SizedBox(height: 16),
                Text("Color"),
                SizedBox(height: 16),
                Text("Location"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
