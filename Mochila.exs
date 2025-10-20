defmodule Mochila do
  def main do
    pesos = [4, 3, 5, 2]
    valores = [10, 40, 30, 20]
    capacidad = 8

    max_valor = resolver(pesos, valores, capacidad)
    IO.puts("El valor máximo que se puede obtener es: #{max_valor}")
  end
  # Función principal
  def resolver(pesos, valores, capacidad) do
    n = length(pesos)
    backtrack(pesos, valores, capacidad, 0, 0, 0, n)
  end

  # Caso base: hemos revisado todos los objetos
  defp backtrack(_pesos, _valores, capacidad, peso_actual, valor_actual, i, n)
       when i == n or peso_actual > capacidad do
    if peso_actual > capacidad do
      0  # Si se pasa del peso máximo, no es válido
    else
      valor_actual
    end
  end

  # Caso recursivo: decidir si incluimos o no el objeto i
  defp backtrack(pesos, valores, capacidad, peso_actual, valor_actual, i, n) do
    # Intentar incluir el objeto i
    incluir =
      backtrack(
        pesos,
        valores,
        capacidad,
        peso_actual + Enum.at(pesos, i),
        valor_actual + Enum.at(valores, i),
        i + 1,
        n
      )

    # Intentar NO incluir el objeto i
    no_incluir =
      backtrack(
        pesos,
        valores,
        capacidad,
        peso_actual,
        valor_actual,
        i + 1,
        n
      )

    # Devolver el máximo valor entre ambas opciones
    max(incluir, no_incluir)
  end
end
Mochila.main()
