package controller

import scala.math._

class MidpointRule(val a: Double, val b: Double, val n: Int) {

  private def f(x: Double) = {
      1 - x * exp(-x)
  }

  def solve() = {
    var result: Double = 0.0
    var h: Double = (b - a) / n

    for (i <- 0 until n) {
      result += f(a + h * (i + 0.5))
    }

    result *= h
    result
  }
}
