import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterInterestPage extends StatefulWidget {
  final String title;
  const RegisterInterestPage({Key? key, this.title = 'RegisterInterestPage'}) : super(key: key);
  @override
  RegisterInterestPageState createState() => RegisterInterestPageState();
}
class RegisterInterestPageState extends State<RegisterInterestPage> {
  
  List selectedCard = [];

    void addListInterests(String? id) {
    setState(() {
      selectedCard.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticSearch Registration', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 247, 113, 113),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 32),
                  const Text("Tenho mais interesse em"),
                  const SizedBox(height: 32),
                  SizedBox(
                        height: 300,
                        child: GridView.builder(
                            padding: const EdgeInsets.all(8.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5),
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedCard.contains(index)) {
                                        selectedCard.remove(index);
                                      } else {
                                        selectedCard.add(index);
                                      }
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        color: selectedCard.contains(index)
                                            ? Colors.blue
                                            : Colors.white,
                                        child: Image.asset(
                                          'lib/app/modules/home/assets/1.jpg',
                                          height: 120.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "Test",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: selectedCard.contains(index)
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ));
                            })),
                  const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 1150),
                      child: ElevatedButton(
                        onPressed: () {
                          // Coloque seu código de ação do botão de login aqui
                          Modular.to.pushNamed('/initial');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Cor de fundo azul claro no botão
                          minimumSize: const Size(200, 60),
                        ),
                        child: const Text(
                          'Próxima',
                          style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}