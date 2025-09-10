defmodule CalcularSalarioEmpleado do
  def main do
    nombre_empleado = "Ingrese el nombre del empleado: "
    |> Util.ingresar(:texto)

    salario_base = "Ingresar salario base: "
    |> Util.ingresar(:real)

    horas_normales = "ingresar horas de trabajo normales: "
    |> Util.ingresar(:entero)

    horas_extras = "Ingrese las horas extra trabajadas: "
    |> Util.ingresar(:entero)

    salario = calcular_salario_empleado(salario_base, horas_extras, horas_normales)
    mensaje = "El empleado #{nombre_empleado} tiene un salario de #{salario}"
    |> Util.mostrar_mensaje()


  end

  def calcular_salario_empleado(salario_base, horas_extra, horas_normales) do
    valor_por_hora = salario_base / horas_normales
    pago_extra =  (horas_extra * 1.5) * valor_por_hora
    salario_total = salario_base + pago_extra
    salario_total
  end
end

CalcularSalarioEmpleado.main()
