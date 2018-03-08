#!/bin/sh
exec scala "$0" "$@"
!#
import scala.util.matching.Regex
import scala.io.Source
import java.io.{File,PrintWriter}
/**
 * This scala script takes two filenames as arguments -- the first one being
 * the origin the other being the filter, respectively -- then iteratively
 * applies the patterns on the filter to every line of the origin, an returns a
 * new file where none of the lines matched the patterns.
 */
object TextLineFilter {
  def main(args: Array[String]) {
    if (argumentsAreValid(args)) {
      val origin: List[String] = Source.fromFile(args(0)).getLines().toList
      val filter: List[String] = Source.fromFile(args(1)).getLines().toList

      val regexPatterns: List[Regex] = filter.map(str => s"${str}".r)

      writeToFile(new File(s"Filtered${args(0)}"))(pwriter =>
          origin.filter(sentenceMatchesNoPatterns(_, regexPatterns)).foreach(pwriter.println))
    } else {
      println("Please check the arguments provided.")
    }
  }

  /**
   * check if two reachable file names only have been passed as arguments
   */
  def argumentsAreValid(args: Array[String]): Boolean = {

    import java.nio.file.{Files,Paths}

    val required: String = "Syntax: TextLineFilter.sh <origin> <filter>"
    args.length match {
      case 0 | 1 => {
        println(s"${required}\nProvided: ${args.mkString(" ")}")
        false
      }
      case 2 => 
        args.find((filename: String) => Files.exists(Paths.get(filename)) == false) match {
          case Some(notFound) => {
            println(s"could not reach file '${notFound}'.")
            false
          }
          case None => true
        }
      case _ => {
        println(s"Too many arguments:\n${required}\nProvided: ${args.mkString(" ")}")
        false
      }
    }
  }

  /**
   * This function takes a sentence and a list of Regex patterns, and returns
   * true if the sentence does not match any of the patterns in the list
   * @param sentence a string
   * @param regexPatterns a list of scala.util.matching.Regex patterns
   */
  def sentenceMatchesNoPatterns(sentence: String, regexPatterns: List[Regex]): Boolean = {
    println(sentence)
    regexPatterns.foldLeft(true)((b: Boolean, r: Regex) => {
      b && (r.findFirstIn(sentence) == None)
    })
  }


  // based on https://stackoverflow.com/questions/24842257/how-do-i-create-a-custom-scala-library-using-sbt#24842389
  def writeToFile(file: File)(f: PrintWriter => Unit) {
    val pwriter = new PrintWriter(file)
    try { 
      f(pwriter) 
    } finally { 
      pwriter.close()
    }
  }

}
