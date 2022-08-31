import 'package:flutter/material.dart';

class FormContoh extends StatefulWidget {
  const FormContoh({Key? key}) : super(key: key);

  @override
  State<FormContoh> createState() => _FormContohState();
}

class _FormContohState extends State<FormContoh> {
  final _controller = TextEditingController.fromValue(
    const TextEditingValue(text: "Initial value"),
  );

  TextEditingController _controller2 = TextEditingController();

  final _key = GlobalKey<FormFieldState<String>>();
  String _textValue = "";

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _textValue = _controller.text;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Teks :',
          ),
          Text(
            _textValue,
            style: Theme.of(context).textTheme.headline3,
          ),
          TextFormField(
            controller: _controller,
            validator: (String? value) {
              return value == null || value.isEmpty
                  ? "Tidak Boleh Kosong"
                  : null;
            },
          ),
          TextFormField(
            controller: _controller2,
          ),
          Builder(
            builder: (BuildContext subContext) => TextButton(
              onPressed: () {
                final valid = Form.of(subContext)!.validate();
                if (valid) {
                  print("valid: $valid");
                  setState(() {
                    _textValue = _controller.text;
                    _controller2.text = "Berhasil";
                  });
                } else {
                  setState(() {
                    _controller2.text = "Gagal";
                  });
                }
              },
              child: const Text("validate"),
            ),
          )
        ],
      ),
    );
  }
}
