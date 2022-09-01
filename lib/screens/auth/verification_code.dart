import 'package:flutter/material.dart';
import 'package:forget_me_not/widgets/code_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/utils/helpers.dart';


class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key, required this.mobile}) : super(key: key);

  final String mobile;

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> with Helpers {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late TextEditingController _mobileTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String _code = '';

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _mobileTextController = TextEditingController();

    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F5F2),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Verification Code',
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0xFFF9F5F2),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 250,
                child:Image.asset('images/perfume.png')
            ),
            //  Text(
            //    'Reset password...',
            //    style: GoogleFonts.actor(
            //        fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1),
            //  ),
            //  Text(
            //    'Enter code & new password',
            //    style: GoogleFonts.actor(
            //      fontWeight: FontWeight.w300,
            //      color: Colors.black45,
            //      fontSize: 15,
            //    ),
            //  ),
            const SizedBox(height: 20),
            Row(
              children: [
                CodeTextField(
                  controller: _firstCodeTextController,
                  focusNode: _firstFocusNode,
                  onChanged: (String value) {
                    if (value.isNotEmpty) {
                      _secondFocusNode.requestFocus();
                    }
                  },
                  onSubmitted: (String value) {},
                ),
                const SizedBox(width: 10),
                CodeTextField(
                  controller: _secondCodeTextController,
                  focusNode: _secondFocusNode,
                  onChanged: (String value) {
                    value.isNotEmpty
                        ? _thirdFocusNode.requestFocus()
                        : _firstFocusNode.requestFocus();
                  },
                  onSubmitted: (String value) {},
                ),
                const SizedBox(width: 10),
                CodeTextField(
                  controller: _thirdCodeTextController,
                  focusNode: _thirdFocusNode,
                  onChanged: (String value) {
                    value.isNotEmpty
                        ? _fourthFocusNode.requestFocus()
                        : _secondFocusNode.requestFocus();
                  },
                  onSubmitted: (String value) {},
                ),
                const SizedBox(width: 10),
                CodeTextField(
                  controller: _fourthCodeTextController,
                  focusNode: _fourthFocusNode,
                  onChanged: (String value) {
                    if (value.isEmpty) {
                      _thirdFocusNode.requestFocus();
                    }
                  },
                  onSubmitted: (String value) {},
                ),
              ],
            ),
            //const SizedBox(height: 10),
            //TextField(
            //controller: _mobileTextController,
            //keyboardType: TextInputType.text,
            //obscureText: true,
            //decoration: InputDecoration(
            //  hintText: 'Mobile',
            //  prefixIcon: const Icon(Icons.lock),
            //  enabledBorder: UnderlineInputBorder(
            //    borderRadius: BorderRadius.circular(10),
            //    borderSide: const BorderSide(
            //      width: 1,
            //      color: Colors.grey,
            //    ),
            //  ),
            //  focusedBorder: UnderlineInputBorder(
            //    borderRadius: BorderRadius.circular(10),
            //    borderSide: const BorderSide(
            //      width: 1,
            //      color: Color(0xFF8B6179),
            //    ),
            //  ),
            //),
            //),
            const SizedBox(height: 20),
            TextField(
              controller: _mobileTextController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock,color: Color(0xFFE5789D)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFE5789D)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await _performActivateCode(),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF9DEC2BA),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Change',style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performActivateCode() async {
    if (_checkData()) {
      await _activateCode();
    }
  }

  bool _checkData() {
    return _checkCode() && _checkMobile();
  }

  bool _checkMobile() {
    if (_mobileTextController.text.isNotEmpty) {
        return true;
    }
    showSnackBar(context,
        message: 'Mobile error ', error: true);
    return false;
  }

  bool _checkCode() {
    _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
    if (_code.length == 4) {
      return true;
    }
    showSnackBar(context, message: 'Code is not correct', error: true);
    return false;
  }

  Future<void> _activateCode() async {
    ApiResponse apiResponse = await AuthApiController().activateCode(
      mobile: widget.mobile,
      code: _code,
    );
    if (apiResponse.success) {
      Navigator.pop(context);
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
