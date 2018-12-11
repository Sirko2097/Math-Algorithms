package controller

import model.ResultPoint

class RungeKuttaMethod(val h: Double) {

  private def f(x: Double, y: Double) = {
    3 * y / x - x
  }

  def solve = {
    var x: Double = 1
    val xn: Double = 3
    var y: Double = 2

    do {
      val k1 = h * f(x, y)
      val k2 = h * f(x + h / 2, y + h / 2)
      val k3 = h * f(x + h, y + 2 * k2 - k1)
      y += (k1 + 4 * k2 + k3) / 6
      x += h
    } while (x > xn)

    new ResultPoint(x, y)
  }
}
