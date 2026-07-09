import '../../core/constants/app_roles.dart';

class Usuario {
  final String uid;
  final String nombre;
  final String correo;
  final AppRole role;
  final bool activo;
  final DateTime? creadoEn;

  const Usuario({
    required this.uid,
    required this.nombre,
    required this.correo,
    required this.role,
    this.activo = true,
    this.creadoEn,
  });

  Usuario copyWith({
    String? nombre,
    String? correo,
    AppRole? role,
    bool? activo,
  }) {
    return Usuario(
      uid: uid,
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      role: role ?? this.role,
      activo: activo ?? this.activo,
      creadoEn: creadoEn,
    );
  }
}
