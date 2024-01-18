import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = "0";
  String history='';
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "";
      num1 = 0;
      num2 = 0;
      operand = "";
      output='0';
    }
    else if (buttonText == "AC") {
      _output = "";
      num1 = 0;
      num2 = 0;
      operand = "";
      history='';
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*" || buttonText=='%') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
      history=num1.toString() + operand.toString() ;
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "%") {
        _output = (num1 % num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = _output;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 5,
        backgroundColor: Colors.black26,
        centerTitle: true,
        title: const Text('Calculator',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: const Alignment(1.0,1.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 100,right: 20),
              child: Text(history,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(1.0,1.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 20,top: 20,left: 30),
              child: Text(output,style: const TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),
              ),
            ),//color: Colors.white,
          ),
          const Expanded(child: Divider(color: Colors.grey,thickness: .5,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar('AC', Colors.brown.shade600),
                buildCircleAvatar('%', Colors.brown.shade600),
                buildCircleAvatar('/', Colors.brown.shade600),
                buildCircleAvatar('C', Colors.green.shade700),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar('7', Colors.grey.shade800),
                buildCircleAvatar('8', Colors.grey.shade800),
                buildCircleAvatar('9', Colors.grey.shade800),
                buildCircleAvatar('*', Colors.green.shade700)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar('4', Colors.grey.shade800),
                buildCircleAvatar('5', Colors.grey.shade800),
                buildCircleAvatar('6', Colors.grey.shade800),
                buildCircleAvatar('-', Colors.green.shade700)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar('1', Colors.grey.shade800),
                buildCircleAvatar('2', Colors.grey.shade800),
                buildCircleAvatar('3', Colors.grey.shade800),
                buildCircleAvatar('+', Colors.green.shade700)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildContainer('.', Colors.grey.shade800),
                buildContainer('0', Colors.grey.shade800),
                buildContainer('=', Colors.green.shade700),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContainer(String value,Color clr) {
    return Container(
      width: 115,
                height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
      ),
                child: FloatingActionButton.extended(
                  backgroundColor: clr,
                    onPressed: (){
                    buttonPressed(value);
                    },
                    label: Text(value,style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),textAlign: TextAlign.center,)
                ),
              );
  }

  CircleAvatar buildCircleAvatar(String calculatortxt,Color clrbutton) {
    return CircleAvatar(
      backgroundColor: clrbutton,
      radius: 41,
      child: TextButton(child: Text(calculatortxt,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
        onPressed: (){
          buttonPressed(calculatortxt);
        }
        ,),
    );
  }
}


