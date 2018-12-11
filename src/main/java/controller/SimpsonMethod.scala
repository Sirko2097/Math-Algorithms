package controller

class SimpsonMethod(val a: Double, val b: Double, val n: Int) {

  private def f(x: Double) = {
    2 * x + 1 / x
  }

  def solve= {
    val h: Double = (b - a) / n
    var result: Double = (f(a) + f(b)) * 0.5

    for (i <- 1 until n) {
      val xk: Double = a + h * i
      val xk1: Double = a + h * (i - 1)
      result += f(xk) + 2 * f((xk1 + xk) / 2)
    }

    val x: Double = a + h * n
    val x1: Double = a + h * (n - 1)
    result += 2 * f((x1 + x) / 2)

    result * h / 3
  }
}
