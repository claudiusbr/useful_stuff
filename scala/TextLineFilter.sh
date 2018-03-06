#!/bin/sh
exec scala "$0" "$@"
!#
/**
 * This scala script takes two files, the first one being the origin, the other
 * being the filter, respectively, then iteratively applies the patterns on the
 * filter to every line of the origin, an returns a new file where none of the
 * lines matched the patterns.
 */
object TextLineFilter {
  def main(args: Array[String]) {
    val origin: List[String] = scala.io.Source.fromFile(args(0)).getLines().toList
    val filter: List[String] = scala.io.Source.fromFile(args(1)).getLines().toList

    val regexPatterns: List[scala.util.matching.Regex] = filter.map(str => s"${str}".r)

    writeToFile(new java.io.File(s"Filtered${args(0)}"))(pwriter =>
        origin.filter(sentenceMatchesNoPatterns(_, regexPatterns)).foreach(pwriter.println))
  }

  def sentenceMatchesNoPatterns(sentence: String, regexPatterns: List[scala.util.matching.Regex]): Boolean = 
    regexPatterns.map(_.findFirstIn(sentence) == None).reduce(_ && _)

  // based on https://stackoverflow.com/questions/24842257/how-do-i-create-a-custom-scala-library-using-sbt#24842389
  def writeToFile(file: java.io.File)(f: java.io.PrintWriter => Unit) {
    val pwriter = new java.io.PrintWriter(file)
    try { 
      f(pwriter) 
    } finally { 
      pwriter.close()
    }
  }

}
