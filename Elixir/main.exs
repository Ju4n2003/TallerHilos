Code.require_file("Usuario.exs")
# Crear usuarios
IO.puts("=== INICIO DEL CHAT ===")
juan = Usuario.iniciar("Juan")
ana = Usuario.iniciar("Ana")
_carlos = Usuario.iniciar("Carlos")

# Enviar mensajes
Usuario.enviar("Juan", ana, "Hola Ana")
Usuario.enviar("Ana", juan, "Hola Juan")
Usuario.enviar("Carlos", juan, "¿Qué tal?")

# Terminar uno
send(ana, :salir)
:timer.sleep(3000)
IO.puts("=== FIN ===")
