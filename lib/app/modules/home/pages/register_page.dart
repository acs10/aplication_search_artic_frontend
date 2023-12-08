import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  String _selectedEstado = 'Selecione';
  String _selectedPais = 'Selecione';
  String _selectedNacionalidade = 'Selecione';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticSearch Registration', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 247, 113, 113),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextFieldWithLabel('Nome', _nomeController),
                  buildTextFieldWithLabel('Email', _emailController),
                  buildTextFieldWithLabel('Telefone', _telefoneController),
                  buildDropdownWithLabel('Estado', _selectedEstado, _estados),
                  buildDropdownWithLabel('Pais', _selectedPais, _paises),
                  buildDropdownWithLabel('Nacionalidade', _selectedNacionalidade, _nacionalidades),
                  const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 500),
                      child: ElevatedButton(
                        onPressed: () {
                          // Coloque seu código de ação do botão de login aqui
                          Modular.to.pushNamed('/registerActing');
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
    );
  }

  Widget buildTextFieldWithLabel(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildDropdownWithLabel(String label, dynamic selectedValue, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<String> _estados = ['Selecione', 'Estado 1', 'Estado 2', 'Estado 3'];
  List<String> _paises = ['Selecione', 'Pais 1', 'Pais 2', 'Pais 3'];
  List<String> _nacionalidades = ['Selecione', 'Nacionalidade 1', 'Nacionalidade 2', 'Nacionalidade 3'];
}