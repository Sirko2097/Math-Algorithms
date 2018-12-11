package controller

import model.ResultPoint

import scala.math._

class EulerMethod(val h: Double) {
  private def f(x: Double, y: Double) = {
//    y / (x * log(x)) + 1 / x
    -1 + y / x
  }

  def solve = {
    var x: Double = 1 //exp(1)
    val xn: Double = 3//exp(2)
//    var y: Double = 1
    var y: Double = 0

    val n: Double = (xn - x) / h + 1

    var i: Int = 0
    do {
      y += h * f(x, y)
      x += h
      i += 1
    } while (i > n || x > xn)

    new ResultPoint(x, y)
  }
}