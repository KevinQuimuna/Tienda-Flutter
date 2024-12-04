class LogicaLogin{
  bool validarCredenciales(String usuario, String contrasena){
    const usuariooValido = 'admin';
    const contrasenaValida = '123';
    return usuario == usuariooValido && contrasena == contrasenaValida;

    }
}