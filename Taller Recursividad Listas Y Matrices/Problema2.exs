defmodule InvertirLista do
  def main do
    lista = [1, 2, 3, 4, 5]
    lista_invertida = invertir(lista)
    IO.puts("Lista original: #{inspect(lista)}")
    IO.puts("Lista invertida: #{inspect(lista_invertida)}")
  end

  def invertir([]), do: []
  def invertir([head | tail]) do
    invertir(tail) ++ [head]
  end
end

InvertirLista.main()
