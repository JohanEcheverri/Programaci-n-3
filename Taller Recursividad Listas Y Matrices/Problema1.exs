defmodule ContarElementosParesLista do
  def main do
    lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    cantidad_pares = contar_pares(lista)
    IO.puts("Cantidad de elementos pares en la lista: #{cantidad_pares}")
  end

  def contar_pares([]), do: 0
  def contar_pares([head | tail]) do
    if rem(head, 2) == 0 do
      1 + contar_pares(tail)
    else
      contar_pares(tail)
    end
  end
end

ContarElementosParesLista.main()
