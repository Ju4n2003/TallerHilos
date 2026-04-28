defmodule Usuario do
  def iniciar(nombre) do
    spawn(fn -> loop(nombre) end)
  end

  def enviar(remitente, destino_pid, mensaje) do
    send(destino_pid, {:mensaje, remitente, mensaje})
  end

  defp loop(nombre) do
    receive do
      {:mensaje, remitente, mensaje} ->
        IO.puts("[#{nombre}] recibe de #{remitente}: #{mensaje}")
        loop(nombre)

      :salir ->
        IO.puts("#{nombre} se desconectó")
    end
  end
end
