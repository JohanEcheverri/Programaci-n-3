 servicio = "Tipo servicio (1=express, 2=estandar): "
      |> Util.ingresar(:entero)
      |> case do
        1 -> :express
        2 -> :estandar
      end