import 'package:flutter/material.dart';
import 'package:projeto_cep/service/via_cep.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchCepController = TextEditingController();
  bool _enableField = true;
  String? _result;

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('VA3 - Consultar CEP via API'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildSearchCepTextField(),
              _buildSearchCepButton(),
              _buildResultForm()
            ],
          ),
        ));
  }

  Widget _buildSearchCepTextField() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
          labelText: 'Cep: ',
          hintText: '00000-000',
          hintStyle: TextStyle(fontFamily: 'Arial', fontSize: 12)),
      controller: _searchCepController,
      enabled: _enableField,
    );
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ElevatedButton(
        onPressed: _searchCep,
        child: const Text('Consultar',
            style: TextStyle(fontFamily: 'Arial', fontSize: 16)),
      ),
    );
  }

  Future _searchCep() async {
    ViaCep viaCep = ViaCep();

    final cep = _searchCepController.text;
    final resultCep = await viaCep.fetchCep(cep: cep);

    setState(() {
      _result = resultCep.toJson();
    });
    ;
  }

  Widget _buildResultForm() {
    return Container(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text(_result ?? '',
          style: const TextStyle(fontFamily: 'Arial', fontSize: 16)),
    );
  }
}
