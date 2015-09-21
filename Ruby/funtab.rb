#!/usr/bin/ruby

include Math

def f(f,x)
 eval(f)
end

if ARGV.length >=4
   formula = ARGV.shift
   a = ARGV.shift
   b = ARGV.shift
   intervals = ARGV.shift
   a = a.to_f
   b = b.to_f
   intervals = intervals.to_f

   n = intervals / 2
   h = (b - a) / (2 * n)

   STDERR.print "Current function:...... ",formula,"\n"
   STDERR.print "Left border:........... ",a,"\n"
   STDERR.print "Right border:.......... ",b,"\n"
   STDERR.print "Number of intervals:... ",intervals,"\n"
   STDERR.print "Length of one interval: ",h,"\n"

   while a <= b
     print a,"\t", f(formula,a),"\n"
     a = a + h
   end

else
   STDERR.print "Usage: funtab <fun-name> <left border> <right border> <number of intervals>\n"
   STDERR.print "              <fun-name> e. g. \"sin(x)\"\n"
end

