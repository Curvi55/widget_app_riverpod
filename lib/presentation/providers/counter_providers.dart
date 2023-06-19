//nuevo provider de RiverPod para manejar el contador
// usualmente se crean varios providers independientes

import 'package:flutter_riverpod/flutter_riverpod.dart';

// esta es la declaración de un proveedor de información , este caso de un valor tipo  int 
final counterProvider  = StateProvider((ref) => 5);