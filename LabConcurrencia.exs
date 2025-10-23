defmodule LabConcurrencia do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    t1 = Task.async(fn -> s1(matriz) end)
    t2 = Task.async(fn -> s2(matriz) end)

    a = Task.await(t1, :infinity)
    b = Task.await(t2, :infinity)

    c = s3(a, b)
    s4(c)
  end

  def s1(matriz), do: s1(matriz, 0)
  def s1([], _row), do: 0
  def s1([fila | resto], row) do
    suma_fila = s1(fila, row, 0)
    suma_fila + s1(resto, row + 1)
  end

  def s1([], _row, _col), do: 0
  def s1([elem | tail], row, col) do
    valor = if col < row, do: elem, else: 0
    valor + s1(tail, row, col + 1)
  end

  def s2(matriz) do
    {sum, count} = s2(matriz, 0)
    if count == 0, do: 0.0, else: sum / count
  end
  def s2([], _row), do: {0, 0}
  def s2([fila | resto], row) do
    {suma_fila, cnt_fila} = s2(fila, row, 0)
    {suma_rest, cnt_rest} = s2(resto, row + 1)
    {suma_fila + suma_rest, cnt_fila + cnt_rest}
  end

  def s2([], _row, _col), do: {0, 0}
  def s2([elem | tail], row, col) when col > row do
    {s_tail, c_tail} = s2(tail, row, col + 1)
    {elem + s_tail, 1 + c_tail}
  end
  def s2([_elem | tail], row, col), do: s2(tail, row, col + 1)

  def s3(a, b), do: a * b
  def s4(c), do: IO.puts("El resultado es #{c}")
end

LabConcurrencia.main()
