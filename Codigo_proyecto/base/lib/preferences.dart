import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setIdProfesor(int value) async {
    await _prefs.setInt('id_profesor', value);
  }

  static int getIdProfesor() {
    return _prefs.getInt('id_profesor') ?? 0; // Retorna 0 si no hay valor almacenado
  }
// Para el grupo
static Future setIdGrupo(int value) async {
await _prefs.setInt('id_grupo', value);
}

static int getIdGrupo() {
return _prefs.getInt('id_grupo') ?? 0; // Retorna 0 si no hay valor almacenado
}
  // Para guardar y obtener la práctica seleccionada
  static Future setPracticaSeleccionada(String practica) async {
    await _prefs.setString('practica_seleccionada', practica);
  }

  static String getPracticaSeleccionada() {
    return _prefs.getString('practica_seleccionada') ?? ""; // Retorna cadena vacía si no hay valor
  }
}