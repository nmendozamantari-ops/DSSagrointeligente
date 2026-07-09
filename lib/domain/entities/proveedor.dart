class Proveedor {
  final String id;
  final String nombre;
  final String? telefono;
  final String? correo;
  final String? tipoInsumo;
  final String? direccion;
  final DateTime? creadoEn;

  const Proveedor({
    required this.id,
    required this.nombre,
    this.telefono,
    this.correo,
    this.tipoInsumo,
    this.direccion,
    this.creadoEn,
  });
}
