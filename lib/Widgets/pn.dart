import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    Key? key,
    required TextEditingController phoneNumber,
  })  : _phoneNumber = phoneNumber,
        super(key: key);

  final TextEditingController _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],

              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(8),
              //   bottomLeft: Radius.circular(8),
              //
              // ),
              border: const Border(
                  top: BorderSide(width: 1.0, color: Colors.grey),
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                  left: BorderSide(width: 1.0, color: Colors.grey)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: CountryCodePicker(
              closeIcon: const Icon(Icons.close),
              initialSelection: 'ng',
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'\d')),
              LengthLimitingTextInputFormatter(10),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your phone number";
              } else if (value.length != 10) {
                return "Phone number must be 10 digits";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            controller: _phoneNumber,
            decoration: const InputDecoration(
              hintText: "Example: 8100000000",
              label: Text("Phone Number"),
              prefixText: (""),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
