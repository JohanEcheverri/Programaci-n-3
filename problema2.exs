defmodule EntradaDatos do
  def main do
  "Ingrese nombre del empleado: "
  |> Util.ingresar_Java(:texto)
  |> generar_mensaje()
  |> Util.mostrar_mensaje_Java()
  end


defp generar_mensaje(nombre) do
  "Bienvenido #{nombre} a la empresa ltda"
  end
end

EntradaDatos.main()
