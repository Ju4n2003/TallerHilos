defmodule MatrizConcurrente do
  def suma_debajo_diagonal(matriz) do
    # Itera sobre cada fila y cada índice de la matriz
    matriz
    |> Enum.with_index()
    |> Enum.reduce(0, fn {fila, i}, acc ->
      fila
      # Itera sobre cada elemento de la fila
      |> Enum.with_index()
      |>Enum.reduce(acc, fn {valor, j}, acc2 ->
        # se suma el valor a la acumulador

        if i > j do
          acc2 + valor
        else
          acc2
        end
      end)
    end)
  end
  def promedio(matriz) do
    # Convierte la matriz en una lista de elementos flotantes
    lista = List.flatten(matriz)

    # Calcula la suma de los elementos de la lista
    suma = Enum.sum(lista)

    # Calcula el número total de elementos de la matriz
    total = length(lista)

    # Calcula el promedio de los elementos de la matriz
    suma / total
  end
end

defmodule Principal do
  def main do
    matriz = [
      [60, 22, 41, 5],
      [13, 33, 44, 5],
      [89, 10, 100, 99],
      [5, 101, 6, 34]
    ]

    task1 = Task.async(fn -> MatrizConcurrente.suma_debajo_diagonal(matriz) end)
    task2 = Task.async(fn -> MatrizConcurrente.promedio(matriz) end)

    s1 = Task.await(task1)
    s2 = Task.await(task2)

    c = s1 * s2

    IO.puts("s1: #{s1}")
    IO.puts("s2: #{s2}")
    IO.puts("Resultado final c: #{c}")

    # Mostrar el resultado en la pantalla
    IO.puts("El resultado final es: #{c}")
  end
end
Principal.main()
