import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromRGBO(131, 58, 180, 1)!, const Color.fromRGBO(253, 29, 29, 1), const Color.fromRGBO(252, 176, 69, 1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.all(100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'MyArtics',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 80),
                    const Text(
                      'Bem-vindo de volta!',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 247, 236, 236),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Faça login para continuar.',
                      style: TextStyle(
                        fontSize: 26,
                        color: Color.fromARGB(255, 247, 236, 236),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Text(
                        'Ainda não tem uma conta?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 247, 236, 236),),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            // Coloque seu código de ação para o link de inscrição aqui
                            Modular.to.pushNamed('/register');
                          },
                          child: const Text(
                            'Increva-se',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white, // Cor de fundo azul claro
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Let's GO",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Login',
                        hintText: 'Digite seu login',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Digite sua senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Coloque seu código de ação do botão de login aqui
                          Modular.to.pushNamed('/initial');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Cor de fundo azul claro no botão
                          minimumSize: const Size(300, 50),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}