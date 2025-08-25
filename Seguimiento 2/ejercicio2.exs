defmodule LongitudPalabra do
  def main do
    "Ingrese Palabra: "
    |> Util.ingresar_Java(:texto)
    |> String.length()
    |> to_string()
    |> Util.mostrar_mensaje_Java()
  end
end

LongitudPalabra.main
