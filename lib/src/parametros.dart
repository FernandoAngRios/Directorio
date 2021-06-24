class Para {
  bool selected;
  String foto;
  String socio;
  String empresa;
  String estado;
  String ciudad;
  String giro;
  String contacto;

  Para(
      {required this.selected,
      required this.foto,
      required this.socio,
      required this.empresa,
      required this.estado,
      required this.ciudad,
      required this.giro,
      required this.contacto});

  static List<Para> getParametros() {
    return <Para>[
      Para(
        selected: false,
        socio: 'Luis',
        empresa: 'BIM',
        estado: 'San Luis',
        ciudad: 'San Luis',
        giro: 'Servicios',
        contacto: 'gmail',
        foto:
            'https://market360.com.co/wp-content/uploads/2016/08/icono-persona.png',
      ),
      Para(
        selected: false,
        socio: 'Jose',
        empresa: 'MIB',
        estado: 'Queretaro',
        ciudad: 'Queretaro',
        giro: 'Ventas',
        contacto: 'gmail',
        foto:
            'https://market360.com.co/wp-content/uploads/2016/08/icono-persona.png',
      ),
      Para(
        selected: false,
        socio: 'Kendra',
        empresa: 'MW',
        estado: 'Mexico',
        ciudad: 'Cd',
        giro: 'Servicios',
        contacto: 'gmail',
        foto:
            'https://market360.com.co/wp-content/uploads/2016/08/icono-persona.png',
      ),
      Para(
        selected: false,
        socio: 'Armando',
        empresa: 'IPESA',
        estado: 'San Luis',
        ciudad: 'Santa Maria',
        giro: 'Comercial',
        contacto: 'gmail',
        foto:
            'https://market360.com.co/wp-content/uploads/2016/08/icono-persona.png',
      ),
    ];
  }
}
