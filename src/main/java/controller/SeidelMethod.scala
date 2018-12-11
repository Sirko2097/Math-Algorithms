package controller

import java.util

import scala.math.abs


class SeidelMethod(var matrix: Array[Array[Double]], var b: Array[Double]) {
  private var eps: Double = 0.001
  private var amountOfIterations: Int = 0

  def this(matrix: Array[Array[Double]], b: Array[Double], eps: Double) = {
    this(matrix, b)
    this.eps = eps
  }

  def solve() = {
    val n = matrix.length
    var previousValues = new Array[Double](n)
    util.Arrays.fill(previousValues, 0)
    var delta: Double = 0
    do {
      val currentValues = new Array[Double](n)

      for (i <- 0 until n) {
        currentValues(i) = b(i)

        for (j <- 0 until n) {

          if (i > j) {
            currentValues(i) -= matrix(i)(j) * currentValues(j)
          }

          if (i < j) {
            currentValues(i) -= matrix(i)(j) * previousValues(j)
          }
        }

        currentValues(i) /= matrix(i)(i)
      }

      delta = 0
      for (i <- 0 until n) {
        var deltaTemp = 0.0
        for (j <- 0 until n) {
          deltaTemp += matrix(i)(j) * currentValues(j)
        }

        delta += abs(deltaTemp - b(i))
      }


      previousValues = currentValues
      amountOfIterations += 1
    } while (delta > eps || amountOfIterations > 1000)

    //Answer
    val answer = previousValues :+ amountOfIterations

    answer
  }
}
