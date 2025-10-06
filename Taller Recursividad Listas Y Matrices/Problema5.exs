defmodule SumaObjetivo do
  def main do
    lista = [2, 3, 5, 7]
    objetivo = 10
    combinaciones = combinaciones(lista, objetivo)
    IO.puts("Combinaciones que suman #{objetivo}: #{inspect(combinaciones)}")
  end
  def combinaciones(lista, objetivo), do: buscar(lista, objetivo, [])

  def buscar(_, 0, actual), do: [Enum.reverse(actual)]
  def buscar([], _, _), do: []
  def buscar([head | tail], objetivo, actual) when objetivo < 0, do: []
  def buscar([head | tail], objetivo, actual) do
    with_head = buscar(tail, objetivo - head, [head | actual])

    without_head = buscar(tail, objetivo, actual)

    with_head ++ without_head
  end
end

SumaObjetivo.main()
