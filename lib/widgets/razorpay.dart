import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RazorPay extends StatefulWidget {
  const RazorPay({Key? key}) : super(key: key);

  @override
  State<RazorPay> createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
  Razorpay? razorpay;

  TextEditingController textEditingController = new TextEditingController();

  FocusNode textFocusController = FocusNode();

  var msg;

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => textFocusController.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Razor Pay"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: TextField(
                  focusNode: textFocusController,
                  cursorRadius: Radius.zero,
                  textAlign: TextAlign.center,
                  controller: textEditingController,
                  decoration: const InputDecoration(hintText: "Amount",),
                  style: const TextStyle(fontSize: 35.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(

                  child: Text(
                    "Pay",
                    style: const TextStyle(color: Colors.white,fontSize: 30),
                  ),
                  onPressed: () {
                    openCheckout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_DsH4LyPyrhDDkz",
      "amount": num.parse(textEditingController.text) * 100, // Convert Paisa to Rupees

      "name": "Test Payment By Yash",
      "description": "This is a Test Payment",
      "timeout": "180",
      "theme.color": "#03be03",
      "currency": "INR",
      "prefill": {"contact": "8240501104", "email": "yashgupta2610@razorpay.com"},
      "external": {
        "wallets": ["paytm", "GooglePay", "PhonePe"]
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Pament success");
    msg = "SUCCESS: " + (response.paymentId).toString();
    showToast(msg);
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    String x= response.message.toString();
    msg = "ERROR: " + response.code.toString() + " - " + jsonDecode(x)['error']['description'];
    showToast(msg);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    msg = "EXTERNAL_WALLET: " + (response.walletName).toString();
    showToast(msg);
  }

  showToast(msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.withOpacity(0.1),
      textColor: Colors.black54,
    );
  }

}

