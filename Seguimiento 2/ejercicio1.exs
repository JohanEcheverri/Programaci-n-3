defmodule MensajeEco do
  def main do
    "Ingrese Mensaje: "
    |> Util.ingresar_Java(:texto)
    |> String.upcase()
    |> Util.mostrar_mensaje_Java()
  end
end

MensajeEco.main
