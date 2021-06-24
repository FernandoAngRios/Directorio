import 'package:flutter/material.Dart';

var _lis = ['Curso Python', 'Curso Java'];
String _vis = 'Seleccione Opcion';
enum SingingCharac { python, java }

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.white, size: 26.0),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              _crearSolicitud(),
              _crearInfCon(),
              _crearInfEmp(),
              _crearTextPro(),
              _crearFotoPro(),
              _crearInfPro(),
              _crearDesPro(),
              _crearInfo(),
              _crearInfoEsc(),
              Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300.0,
                    child: RaisedButton(
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text(
                        'Enviar Oportunidad',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Image.asset(
                                  'assets/img/duda.png',
                                  height: 130,
                                  width: 500,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '¿Esta seguro de enviar su encuesta de satisfaccion?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      color: Colors.indigo,
                                      textColor: Colors.white,
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text(
                                        'Aceptar',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Image.asset(
                                                  'assets/img/aceptado.png',
                                                  height: 130,
                                                  width: 500,
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '¡Solicitud Recibida!',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Recibiras una respuesta Pronto',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(80, 0, 80, 0),
                                                    // ignore: deprecated_member_use
                                                    child: RaisedButton(
                                                      color: Colors.indigo,
                                                      textColor: Colors.white,
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          50, 0, 50, 0),
                                                      child: Text(
                                                        'OK',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pushNamed('dir');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white, // foreground
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearSolicitud() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Solicitu de Oportunidad',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInfCon() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: 320,
                  height: 153,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Informacion del Contacto',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Image.network(
                        'https://market360.com.co/wp-content/uploads/2016/08/icono-persona.png',
                        height: 50,
                        width: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nombre: Luis',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Apellido:Rios',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInfEmp() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: 320,
                  height: 161,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Informacion de la Empresa',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Image.network(
                        'http://www.alemonseguros.com/public/assets/images/original/icon_empresa_526077.png',
                        height: 50,
                        width: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Empresa: Luis',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Giro: Servicios',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Estado: San Luis',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ciudad: San Luis ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTextPro() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 320,
                  height: 35,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Informacion del Producto y/o Servicio',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearFotoPro() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 320,
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                            'https://datademia.es/wp-content/uploads/2020/03/que-es-python1-1024x576.png',
                            height: 50,
                            width: 50),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Expanded(
                        child: Image.network(
                          'https://classes.engineering.wustl.edu/cse231/core/images/2/26/Java.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInfPro() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 320,
                  height: 20,
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Servicio: Curso Python',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Servicio: Curso Java',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearDesPro() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: 320,
                  height: 35,
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Descripcion: Curso Python',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        indent: 0,
                        endIndent: 10,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Descripcion: Curso Java',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInfo() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nombre:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 320,
              height: 23,
              alignment: Alignment.centerLeft,
              child: Text(
                'Sofia',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Apellido:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 320,
              height: 23,
              alignment: Alignment.centerLeft,
              child: Text(
                'Anguiano Gonzalez',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Empresa:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 320,
              height: 23,
              alignment: Alignment.centerLeft,
              child: Text(
                'Ipesa',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Corro Electronico:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 320,
              height: 23,
              alignment: Alignment.centerLeft,
              child: Text(
                'sofia.ag@gmail.com',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Telefono Móvil:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 320,
              height: 23,
              alignment: Alignment.centerLeft,
              child: Text(
                '44434567890',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearInfoEsc() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Telefono de Oficina: '),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Comentarios:'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Requisito:'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Descripcion:'),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
