class Cliente {
  final String id;
  final String nombre;
  final String? telefono;
  final String? correo;
  final String? direccion;
  final String? ruc;
  final DateTime? creadoEn;

  const Cliente({
    required this.id,
    required this.nombre,
    this.telefono,
    this.correo,
    this.direccion,
    this.ruc,
    this.creadoEn,
  });
}
