defmodule SumarMatriz do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    suma = sumar_matriz(matriz)
    IO.puts("suma total: #{suma}")
  end

  def sumar_matriz([]), do: 0
  def sumar_matriz(matriz), do: sumar_matriz(matriz, 0)
  def sumar_matriz(matriz, indice) do
    if indice < length(matriz) do
      fila = Enum.at(matriz, indice)
      suma_fila = Enum.sum(fila)
      suma_fila + sumar_matriz(matriz, indice + 1)
    else
      0
    end
  end

end
SumarMatriz.main()
