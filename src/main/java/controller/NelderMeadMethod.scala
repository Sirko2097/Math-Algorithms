package controller

import model.NelderMeadAnswer

class NelderMeadMethod {
  private val eps: Double = 0.000001
  private val x = Array.ofDim[Double](7, 2)

  private def f(x: Double, y: Double) = {
    4 * (x - 5) * (x - 5) + (y - 6) * (y - 6)
  }

  def solve() = {
    val n = 2
    var s: Double = 0

    x(0)(0) = 9; x(0)(1) = 9
    x(1)(0) = 10; x(1)(1) = 11
    x(2)(0) = 8; x(2)(1) = 11

    var amount: Int = 0
    do {
      amount += 1

      var (h, l ,g) = (0, 0, 0)
      var (max, min) = (f(x(0)(0), x(0)(1)), f(x(0)(0), x(0)(1)))

      for (i <- 1 until(n + 1)) {
        if (f(x(i)(0), x(i)(1)) < min) {
          min = f(x(i)(0), x(i)(1))
          l = i
        }

        if (f(x(i)(0), x(i)(1)) > max) {
          max = f(x(i)(0), x(i)(1))
          h = i
        }
      }

      max = f(x(0)(0), x(0)(1))

      for (i <- 1 until(n + 1)) {
        if ((f(x(i)(0), x(i)(1)) > max) && (i != h)) {
          max = f(x(i)(0), x(i)(1))
          g = i
        }
      }

      x(n + 1)(0) = (x(0)(0) + x(1)(0) + x(2)(0) - x(h)(0)) / n
      x(n + 1)(1) = (x(0)(1) + x(1)(1) + x(2)(1) - x(h)(1)) / n

      for (i <- 0 until n) {
        x(n + 2)(i) = 2 * x(n + 1)(i) - x(h)(i)
      }

      if (f(x(n + 2)(0), x(n + 2)(1)) < f(x(l)(0), x(l)(1))) {
        x(n + 3)(0) = x(n + 1)(0) + 2 * (x(n + 2)(0) - x(n + 1)(0))
        x(n + 3)(1) = x(n + 1)(1) + 2 * (x(n + 2)(1) - x(n + 1)(1))

        if (f(x(n + 3)(0), x(n + 3)(1)) < f(x(l)(0), x(l)(1))) {
          x(h)(0) = x(n + 3)(0)
          x(h)(1) = x(n + 3)(1)
        } else  {
          x(h)(0) = x(n + 2)(0)
          x(h)(1) = x(n + 2)(1)
        }
      } else {
        if (f(x(n + 2)(0), x(n + 2)(1)) > f(x(g)(0), x(g)(1))) {
          if (!(f(x(n + 2)(0), x(n + 2)(1)) > f(x(h)(0), x(h)(1)))) {
            x(h)(0) = x(n + 2)(0)
            x(h)(1) = x(n + 2)(1)
          }

          x(n + 4)(0) = x(n + 1)(0) + 0.5 * (x(h)(0) - x(n + 1)(0))
          x(n + 4)(1) = x(n + 1)(1) + 0.5 * (x(h)(1) - x(n + 1)(1))

          if (!(f(x(n + 4)(0), x(n + 4)(1)) > f(x(h)(0), x(h)(1)))) {
            x(h)(0) = x(n + 4)(0)
            x(h)(1) = x(n + 4)(1)
          } else {
            for (i <- 0 until n) {
              x(i)(0) = x(i)(0) + 0.5 * (x(i)(0) - x(l)(0))
              x(i)(0) = x(i)(1) + 0.5 * (x(i)(1) - x(l)(1))
            }
          }
        } else {
          x(h)(0) = x(n + 2)(0)
          x(h)(1) = x(n + 2)(1)
        }
      }

      var s1: Double = 0; var s2: Double = 0
      for (i <- 0 until(n + 1)) {
        s1 += f(x(i)(0), x(i)(1))
        s2 += f(x(i)(0), x(i)(1)) * f(x(i)(0), x(i)(1))
      }
      s = s2 - s1 * s1 / ((n + 1) * (n + 1))

      min = f(x(0)(0), x(0)(1))
      for (i <- 1 until(n + 1)) {
        if (f(x(i)(0), x(i)(0)) < min) {
          min = f(x(i)(0), x(i)(0))
          l = i
        }
      }
    } while (s > eps)
    new NelderMeadAnswer(x(n + 1)(0), x(n + 1)(1), f(x(n + 1)(0), x(n + 1)(1)), amount)
  }
}
