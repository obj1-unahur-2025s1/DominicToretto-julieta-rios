object dominic{
  const autos = []

  method comprar(unAuto) {autos.add(unAuto)}

  method autosNoEnCondiciones() = autos.filter{a=> not a.enCondiciones()}

  method autosEnCondiciones() = autos.filter{a=>a.enCondiciones()}

  method mandarAutosAlTaller() {
    taller.recibirAutos(self.autosNoEnCondiciones())
  }
  
  method pruebaDeVelocidad() {
    autos.forEach{a=>a.hacerPrueba()}
  }

  method venderAutos() {autos.clear()}

  method promedioVelocidades() = autos.sum{a=>a.velocidadMaxima()} / autos.size()

  method masRapido() = self.autosEnCondiciones().max{a=>a.velocidadMaxima()}

  method hayAutoMuyRapido() = self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidades()
}


object taller {
  const autosAReparar = []
  method recibirAutos(listaDeAutos) {
    autosAReparar.addAll(listaDeAutos)
  }
  method repararAutos() {
    autosAReparar.forEach{a=>a.reparar()}
    autosAReparar.clear()
  }
}

object ferrari {
  var motor = 87
  method enCondiciones() = motor >= 65
  method reparar() {motor = 100}
  method velocidadMaxima() = 110 + if(motor > 75) 15 else 0

  method hacerPrueba() {motor = 0.max(motor - 30)}
}


object flecha {
  var nivelCombustible = 100
  var property tipoCombustible = gasolina
  var color = azul
  method enCondiciones() =
      nivelCombustible > tipoCombustible.nivelMinimo() &&
      color == rojo
  
  method hacerPrueba() {
    nivelCombustible = 0.max(nivelCombustible - 5)
  }
  method reparar() {
    nivelCombustible = nivelCombustible * 2
    collor = color.cambiarColor()
  }
  method velocidadMaxima() {
    return nivelCombustible * 2 + tipoCombustible.calculoAdicional(nivelCombustible)
  }
}

object gasolina {
  method nivelMinimo() = 85
  method calculoAdicional(litros) = 10
}

object nafta {
  method nivelMinimo() = 50
  method calculoAdicional(litros) = -1*((litros * 2) * 0.10)
}

object nitrogenoLiquido{
  method nivelMinimo() = 0
  method calculoAdicional(litros) = (litros*2) * 10
}

object azul {
  method cambiarColor() = verde
}

object rojo {
  method cambiarColor() = azul
}

object verde {
  method cambiarColor() = rojo
}

object intocable {
  var property enCondiciones = true
  method hacerPrueba() {enCondiciones = false}
  method reparar() {enCondiciones = true}
  method velocidadMaxima() = 45
}