defmodule InventarioLibreria do
  def main do
    titulo_libro = "Ingrese el titulo del libro: "
    |> Util.ingresar(:texto)

    unidades_disponibles = "Ingrese numero de unidades del libro: "
    |> Util.ingresar(:entero)

    precio_unitario = "Ingrese el precio unitario del libro: "
    |> Util.ingresar(:real)

    valor = calcular_valor_inventario(unidades_disponibles, precio_unitario)

    mensaje = "El libro #{titulo_libro} tiene #{unidades_disponibles}, con un valor de #{valor}"
    |> Util.mostrar_mensaje()

  end

  def calcular_valor_inventario(unidades_disponibles, precio_unitario) do
    valor = unidades_disponibles * precio_unitario


  end
end

InventarioLibreria.main()
