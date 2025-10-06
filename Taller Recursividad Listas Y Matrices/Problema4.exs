defmodule TransposicionMatriz do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    matriz_transpuesta = transponer(matriz)
    IO.puts("Matriz original: #{inspect(matriz)}")
    IO.puts("Matriz transpuesta: #{inspect(matriz_transpuesta)}")
  end

  def transponer([]), do: []
  def transponer([[] | _]), do: []
  def transponer(matriz) do
    [Enum.map(matriz, &hd/1) | transponer(Enum.map(matriz, &tl/1))]
  end
end

TransposicionMatriz.main()
