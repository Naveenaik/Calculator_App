import 'package:flutter/material.dart';
void main()=> runApp(  MaterialApp(
  home: CalculatorApp(),
  debugShowCheckedModeBanner: false,
));
class CalculatorApp extends StatefulWidget {
  CalculatorApp({super.key}){}
  @override
  Calc createState()=>Calc();
}
class Calc extends State<CalculatorApp> {
  double result=0;
  int out=0,flag=0,opState=0,dot=1;
  double num1=0;
  double num2=0;
  String alu='';
  String fnl='';
  double temp=0;
  void ButtonPressed(int value) {
    if(flag==1)
    {
      fnl='';
      flag=0;
    }
    setState(() {
      if (value == 11) {
        fnl = '';
        alu='';
        dot=1;
        opState=0;
      }
      else if (value == 12) {
        String s = fnl;
        if(opState==1||opState==2||opState==3||opState==4||opState==5) {
          fnl = '';
          opState=0;
        }
        else {
          if(opState==1||opState==2||opState==3||opState==4||opState==5) {
            fnl = '';
            opState=0;
          }
          else if (fnl.substring(s.length - 1) == '.')
            dot = 1;
          fnl = fnl.substring(0, s.length - 1);
        }
      }
      else if(value==13)
      {
          fnl='$fnl.';
      }
      else {
        if(fnl.length!=15) {
          out = value;
          fnl = fnl + out.toString();
        }
      }
    }
    );
  }
  void operator(String op)
  {
    if(fnl!='')
      alu=fnl;
    flag=1;
    setState(() {
      dot=1;
      if(op=='+') {
        fnl='+';
        opState=1;
        num1=double.parse(alu);
      }
      else if(op=='-') {
        fnl='-';
        opState=2;
        num1=double.parse(alu);
      }
      else if(op=='*') {
        fnl='*';
        opState=3;
        num1=double.parse(alu);
      }
      else if(op=='/') {
        fnl='/';
        opState=4;
        num1=double.parse(alu);
      }
      else if(op=='%') {
        fnl='%';
        opState=5;
        num1=double.parse(alu);
      }
      else if(op=='=')
      {
        if(opState==1||opState==2||opState==3||opState==4||opState==5) {
          num2=double.parse(alu);
          switch(opState)
          {
            case 1:result=num1+num2;
            break;
            case 2:result=num1-num2;
            break;
            case 3:result=num1*num2;
            break;
            case 4:if(num2.toInt()==0) {
              fnl='Error';
              return ;
            }
            else {
              result=num1/num2;
            }
            break;
            case 5:result=num1%num2;
            break;
          }
          opState=0;
        }
        else
        {
          num1=double.parse(alu);
          num2=0;
          result=num1+num2;
        }
        fnl=result.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body:
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //color: Colors.green,
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.centerRight,
                child: Text(
                  fnl.toString(),
                  style: const TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 120.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      ButtonPressed(11);
                    },
                    child: const Text(
                      'Clr',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(12);
                    },
                    child: const Text(
                      'Del',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      operator('%');
                    },
                    child: const Text(
                      '%',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      operator('/');
                    },
                    child: const Text(
                      '/',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      ButtonPressed(7);
                    },
                    child: const Text(
                      '7',
                      style:
                      TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(8);
                    },
                    child: const Text(
                      '8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(9);
                    },
                    child: const Text(
                      '9',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      operator('*');
                    },
                    child: const Text(
                      '*',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      ButtonPressed(4);
                    },
                    child: const Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(5);
                    },
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(6);
                    },
                    child: const Text(
                      '6',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      operator('-');
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      ButtonPressed(1);
                    },
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(2);
                    },
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ButtonPressed(3);
                    },
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      operator('+');
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 40.0,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () {
                        if(dot==1) {
                          ButtonPressed(13);
                          dot=0;
                        }
                      },
                      child: const Text(
                        '.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: TextButton(
                      onPressed: () {
                        ButtonPressed(0);
                      },
                      child: const Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: FloatingActionButton(
                      onPressed: () {
                        operator('=');
                      },
                      backgroundColor: Colors.orange,
                      child: const Text(
                        '=',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
