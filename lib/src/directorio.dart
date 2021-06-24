import 'package:directorio/src/tablaa.dart';
import 'package:flutter/material.dart';
import 'package:directorio/src/parametros.dart';

class Directorio extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
  static const String id = 'data_table_2_screen';
}

void _showOverlay(BuildContext context) {
  Navigator.of(context).push(TutorialOverlay());
}

class _RegistroState extends State<Directorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.settings_rounded),
            ),
          ),
        ],
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.indigo[50],
          child: Center(
            child: Column(
              children: <Widget>[
                _crearBIM(),
                _crearDirectorio(),
                _crearBuscar(),
                _craerDatatable(),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () => _showOverlay(context),
                  child: Text('Show Overlay'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearBIM() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/img/BIMLogo.png',
            height: 130,
            width: 400,
          ),
        ],
      ),
    );
  }

  Widget _crearDirectorio() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      color: Colors.indigo,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Directorio de Socios',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  late List<Para> param;
  late bool sortAscending;

  @override
  void initState() {
    super.initState();
    sortAscending = false;
    param = Para.getParametros();
  }

  Widget _craerDatatable() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: 250.0,
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DataTable(
                dividerThickness: 2,
                dataRowHeight: 50,
                headingRowHeight: 50,
                sortColumnIndex: 1,
                sortAscending: sortAscending,
                columns: [
                  DataColumn(
                    label: Text('Foto'),
                  ),
                  DataColumn(
                      label: Text('Socio'),
                      numeric: false,
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sortAscending = !sortAscending;
                        });
                        ordenarColumna(columnIndex, ascending);
                      }),
                  DataColumn(
                    label: Text('Empresa'),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text('Estado'),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text('Ciudad'),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text('giro'),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text('Contacto'),
                    numeric: false,
                  ),
                ],
                rows: param
                    .map(
                      (par) => DataRow(
                        selected: par.selected,
                        onSelectChanged: (s) {
                          setState(() {
                            par.selected = s!;
                          });
                        },
                        cells: [
                          DataCell(
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.network(
                                par.foto,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              par.socio,
                            ),
                          ),
                          DataCell(
                            Text(
                              par.empresa,
                            ),
                          ),
                          DataCell(
                            Text(
                              par.estado,
                            ),
                          ),
                          DataCell(
                            Text(
                              par.ciudad,
                            ),
                          ),
                          DataCell(
                            Text(
                              par.giro,
                            ),
                          ),
                          DataCell(
                            Text(
                              par.contacto,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      children: param
                          .map(
                            (par) => (par.selected)
                                ? TextSpan(
                                    text: par.foto + '    ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )
                                : TextSpan(
                                    text: '',
                                  ),
                          )
                          .toList(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ordenarColumna(int columnIndex, bool ordenar) {
    if (columnIndex == 1) {
      if (ordenar) {
        param.sort((a, b) => a.socio.compareTo(b.socio));
      } else {
        param.sort((a, b) => b.socio.compareTo(a.socio));
      }
    }
  }

  List<Para> usersFiltered = [];
  TextEditingController controller = TextEditingController();
  String _searchResult = '';

  Widget _crearBuscar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.indigo[50],
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        _searchResult = value;
                        usersFiltered = param
                            .where((param) =>
                                param.socio.contains(_searchResult) ||
                                param.empresa.contains(_searchResult))
                            .toList();
                      });
                    }),
                trailing: new IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      _searchResult = '';
                      usersFiltered = param;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
