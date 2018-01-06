<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--NewPage-->
<HTML>
<HEAD>
<!-- Generated by javadoc (build 1.6.0) on Fri May 25 15:43:22 EDT 2007 -->
<TITLE>
SSPR
</TITLE>

<META NAME="date" CONTENT="2007-05-25">

<LINK REL ="stylesheet" TYPE="text/css" HREF="../../../stylesheet.css" TITLE="Style">

<SCRIPT type="text/javascript">
function windowTitle()
{
    if (location.href.indexOf('is-external=true') == -1) {
        parent.document.title="SSPR";
    }
}
</SCRIPT>
<NOSCRIPT>
</NOSCRIPT>

</HEAD>

<BODY BGCOLOR="white" onload="windowTitle();">
<HR>


<!-- ========= START OF TOP NAVBAR ======= -->
<A NAME="navbar_top"><!-- --></A>
<A HREF="#skip-navbar_top" title="Skip navigation links"></A>
<TABLE BORDER="0" WIDTH="100%" CELLPADDING="1" CELLSPACING="0" SUMMARY="">
<TR>
<TD COLSPAN=2 BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
<A NAME="navbar_top_firstrow"><!-- --></A>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" SUMMARY="">
  <TR ALIGN="center" VALIGN="top">
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../overview-summary.html"><FONT CLASS="NavBarFont1"><B>Overview</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="package-summary.html"><FONT CLASS="NavBarFont1"><B>Package</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#FFFFFF" CLASS="NavBarCell1Rev"> &nbsp;<FONT CLASS="NavBarFont1Rev"><B>Class</B></FONT>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="package-tree.html"><FONT CLASS="NavBarFont1"><B>Tree</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../deprecated-list.html"><FONT CLASS="NavBarFont1"><B>Deprecated</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../index-all.html"><FONT CLASS="NavBarFont1"><B>Index</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../help-doc.html"><FONT CLASS="NavBarFont1"><B>Help</B></FONT></A>&nbsp;</TD>
  </TR>
</TABLE>
</TD>
<TD ALIGN="right" VALIGN="top" ROWSPAN=3><EM>
</EM>
</TD>
</TR>

<TR>
<TD BGCOLOR="white" CLASS="NavBarCell2"><FONT SIZE="-2">
&nbsp;<A HREF="../../../org/netlib/blas/Sspr.html" title="class in org.netlib.blas"><B>PREV CLASS</B></A>&nbsp;
&nbsp;<A HREF="../../../org/netlib/blas/Sspr2.html" title="class in org.netlib.blas"><B>NEXT CLASS</B></A></FONT></TD>
<TD BGCOLOR="white" CLASS="NavBarCell2"><FONT SIZE="-2">
  <A HREF="../../../index.html?org/netlib/blas/SSPR.html" target="_top"><B>FRAMES</B></A>  &nbsp;
&nbsp;<A HREF="SSPR.html" target="_top"><B>NO FRAMES</B></A>  &nbsp;
&nbsp;<SCRIPT type="text/javascript">
  <!--
  if(window==top) {
    document.writeln('<A HREF="../../../allclasses-noframe.html"><B>All Classes</B></A>');
  }
  //-->
</SCRIPT>
<NOSCRIPT>
  <A HREF="../../../allclasses-noframe.html"><B>All Classes</B></A>
</NOSCRIPT>


</FONT></TD>
</TR>
<TR>
<TD VALIGN="top" CLASS="NavBarCell3"><FONT SIZE="-2">
  SUMMARY:&nbsp;NESTED&nbsp;|&nbsp;FIELD&nbsp;|&nbsp;<A HREF="#constructor_summary">CONSTR</A>&nbsp;|&nbsp;<A HREF="#method_summary">METHOD</A></FONT></TD>
<TD VALIGN="top" CLASS="NavBarCell3"><FONT SIZE="-2">
DETAIL:&nbsp;FIELD&nbsp;|&nbsp;<A HREF="#constructor_detail">CONSTR</A>&nbsp;|&nbsp;<A HREF="#method_detail">METHOD</A></FONT></TD>
</TR>
</TABLE>
<A NAME="skip-navbar_top"></A>
<!-- ========= END OF TOP NAVBAR ========= -->

<HR>
<!-- ======== START OF CLASS DATA ======== -->
<H2>
<FONT SIZE="-1">
org.netlib.blas</FONT>
<BR>
Class SSPR</H2>
<PRE>
java.lang.Object
  <IMG SRC="../../../resources/inherit.gif" ALT="extended by "><B>org.netlib.blas.SSPR</B>
</PRE>
<HR>
<DL>
<DT><PRE>public class <B>SSPR</B><DT>extends java.lang.Object</DL>
</PRE>

<P>
<pre>
<b>SSPR</b> is a simplified interface to the JLAPACK routine <b>sspr</b>.
This interface converts Java-style 2D row-major arrays into
the 1D column-major linearized arrays expected by the lower
level JLAPACK routines.  Using this interface also allows you
to omit offset and leading dimension arguments.  However, because
of these conversions, these routines will be slower than the low
level ones.  Following is the description from the original Fortran
source.  Contact <a href="mailto:seymour@cs.utk.edu">seymour@cs.utk.edu</a> with any questions.
<p>
 *     ..
 *
 *  Purpose
 *  =======
 *
 *  SSPR    performs the symmetric rank 1 operation
 *
 *     A := alpha*x*x' + A,
 *
 *  where alpha is a real scalar, x is an n element vector and A is an
 *  n by n symmetric matrix, supplied in packed form.
 *
 *  Arguments
 *  ==========
 *
 *  UPLO   - CHARACTER*1.
 *           On entry, UPLO specifies whether the upper or lower
 *           triangular part of the matrix A is supplied in the packed
 *           array AP as follows:
 *
 *              UPLO = 'U' or 'u'   The upper triangular part of A is
 *                                  supplied in AP.
 *
 *              UPLO = 'L' or 'l'   The lower triangular part of A is
 *                                  supplied in AP.
 *
 *           Unchanged on exit.
 *
 *  N      - INTEGER.
 *           On entry, N specifies the order of the matrix A.
 *           N must be at least zero.
 *           Unchanged on exit.
 *
 *  ALPHA  - REAL            .
 *           On entry, ALPHA specifies the scalar alpha.
 *           Unchanged on exit.
 *
 *  X      - REAL             array of dimension at least
 *           ( 1 + ( n - 1 )*abs( INCX ) ).
 *           Before entry, the incremented array X must contain the n
 *           element vector x.
 *           Unchanged on exit.
 *
 *  INCX   - INTEGER.
 *           On entry, INCX specifies the increment for the elements of
 *           X. INCX must not be zero.
 *           Unchanged on exit.
 *
 *  AP     - REAL             array of DIMENSION at least
 *           ( ( n*( n + 1 ) )/2 ).
 *           Before entry with  UPLO = 'U' or 'u', the array AP must
 *           contain the upper triangular part of the symmetric matrix
 *           packed sequentially, column by column, so that AP( 1 )
 *           contains a( 1, 1 ), AP( 2 ) and AP( 3 ) contain a( 1, 2 )
 *           and a( 2, 2 ) respectively, and so on. On exit, the array
 *           AP is overwritten by the upper triangular part of the
 *           updated matrix.
 *           Before entry with UPLO = 'L' or 'l', the array AP must
 *           contain the lower triangular part of the symmetric matrix
 *           packed sequentially, column by column, so that AP( 1 )
 *           contains a( 1, 1 ), AP( 2 ) and AP( 3 ) contain a( 2, 1 )
 *           and a( 3, 1 ) respectively, and so on. On exit, the array
 *           AP is overwritten by the lower triangular part of the
 *           updated matrix.
 *
 *
 *  Level 2 Blas routine.
 *
 *  -- Written on 22-October-1986.
 *     Jack Dongarra, Argonne National Lab.
 *     Jeremy Du Croz, Nag Central Office.
 *     Sven Hammarling, Nag Central Office.
 *     Richard Hanson, Sandia National Labs.
 *
 *
 *     .. Parameters ..
</pre>
<P>

<P>
<HR>

<P>

<!-- ======== CONSTRUCTOR SUMMARY ======== -->

<A NAME="constructor_summary"><!-- --></A>
<TABLE BORDER="1" WIDTH="100%" CELLPADDING="3" CELLSPACING="0" SUMMARY="">
<TR BGCOLOR="#CCCCFF" CLASS="TableHeadingColor">
<TH ALIGN="left" COLSPAN="2"><FONT SIZE="+2">
<B>Constructor Summary</B></FONT></TH>
</TR>
<TR BGCOLOR="white" CLASS="TableRowColor">
<TD><CODE><B><A HREF="../../../org/netlib/blas/SSPR.html#SSPR()">SSPR</A></B>()</CODE>

<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
</TR>
</TABLE>
&nbsp;
<!-- ========== METHOD SUMMARY =========== -->

<A NAME="method_summary"><!-- --></A>
<TABLE BORDER="1" WIDTH="100%" CELLPADDING="3" CELLSPACING="0" SUMMARY="">
<TR BGCOLOR="#CCCCFF" CLASS="TableHeadingColor">
<TH ALIGN="left" COLSPAN="2"><FONT SIZE="+2">
<B>Method Summary</B></FONT></TH>
</TR>
<TR BGCOLOR="white" CLASS="TableRowColor">
<TD ALIGN="right" VALIGN="top" WIDTH="1%"><FONT SIZE="-1">
<CODE>static&nbsp;void</CODE></FONT></TD>
<TD><CODE><B><A HREF="../../../org/netlib/blas/SSPR.html#SSPR(java.lang.String, int, float, float[], int, float[])">SSPR</A></B>(java.lang.String&nbsp;uplo,
     int&nbsp;n,
     float&nbsp;alpha,
     float[]&nbsp;x,
     int&nbsp;incx,
     float[]&nbsp;ap)</CODE>

<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
</TR>
</TABLE>
&nbsp;<A NAME="methods_inherited_from_class_java.lang.Object"><!-- --></A>
<TABLE BORDER="1" WIDTH="100%" CELLPADDING="3" CELLSPACING="0" SUMMARY="">
<TR BGCOLOR="#EEEEFF" CLASS="TableSubHeadingColor">
<TH ALIGN="left"><B>Methods inherited from class java.lang.Object</B></TH>
</TR>
<TR BGCOLOR="white" CLASS="TableRowColor">
<TD><CODE>clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait</CODE></TD>
</TR>
</TABLE>
&nbsp;
<P>

<!-- ========= CONSTRUCTOR DETAIL ======== -->

<A NAME="constructor_detail"><!-- --></A>
<TABLE BORDER="1" WIDTH="100%" CELLPADDING="3" CELLSPACING="0" SUMMARY="">
<TR BGCOLOR="#CCCCFF" CLASS="TableHeadingColor">
<TH ALIGN="left" COLSPAN="1"><FONT SIZE="+2">
<B>Constructor Detail</B></FONT></TH>
</TR>
</TABLE>

<A NAME="SSPR()"><!-- --></A><H3>
SSPR</H3>
<PRE>
public <B>SSPR</B>()</PRE>
<DL>
</DL>

<!-- ============ METHOD DETAIL ========== -->

<A NAME="method_detail"><!-- --></A>
<TABLE BORDER="1" WIDTH="100%" CELLPADDING="3" CELLSPACING="0" SUMMARY="">
<TR BGCOLOR="#CCCCFF" CLASS="TableHeadingColor">
<TH ALIGN="left" COLSPAN="1"><FONT SIZE="+2">
<B>Method Detail</B></FONT></TH>
</TR>
</TABLE>

<A NAME="SSPR(java.lang.String, int, float, float[], int, float[])"><!-- --></A><H3>
SSPR</H3>
<PRE>
public static void <B>SSPR</B>(java.lang.String&nbsp;uplo,
                        int&nbsp;n,
                        float&nbsp;alpha,
                        float[]&nbsp;x,
                        int&nbsp;incx,
                        float[]&nbsp;ap)</PRE>
<DL>
<DD><DL>
</DL>
</DD>
</DL>
<!-- ========= END OF CLASS DATA ========= -->
<HR>


<!-- ======= START OF BOTTOM NAVBAR ====== -->
<A NAME="navbar_bottom"><!-- --></A>
<A HREF="#skip-navbar_bottom" title="Skip navigation links"></A>
<TABLE BORDER="0" WIDTH="100%" CELLPADDING="1" CELLSPACING="0" SUMMARY="">
<TR>
<TD COLSPAN=2 BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
<A NAME="navbar_bottom_firstrow"><!-- --></A>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="3" SUMMARY="">
  <TR ALIGN="center" VALIGN="top">
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../overview-summary.html"><FONT CLASS="NavBarFont1"><B>Overview</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="package-summary.html"><FONT CLASS="NavBarFont1"><B>Package</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#FFFFFF" CLASS="NavBarCell1Rev"> &nbsp;<FONT CLASS="NavBarFont1Rev"><B>Class</B></FONT>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="package-tree.html"><FONT CLASS="NavBarFont1"><B>Tree</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../deprecated-list.html"><FONT CLASS="NavBarFont1"><B>Deprecated</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../index-all.html"><FONT CLASS="NavBarFont1"><B>Index</B></FONT></A>&nbsp;</TD>
  <TD BGCOLOR="#EEEEFF" CLASS="NavBarCell1">    <A HREF="../../../help-doc.html"><FONT CLASS="NavBarFont1"><B>Help</B></FONT></A>&nbsp;</TD>
  </TR>
</TABLE>
</TD>
<TD ALIGN="right" VALIGN="top" ROWSPAN=3><EM>
</EM>
</TD>
</TR>

<TR>
<TD BGCOLOR="white" CLASS="NavBarCell2"><FONT SIZE="-2">
&nbsp;<A HREF="../../../org/netlib/blas/Sspr.html" title="class in org.netlib.blas"><B>PREV CLASS</B></A>&nbsp;
&nbsp;<A HREF="../../../org/netlib/blas/Sspr2.html" title="class in org.netlib.blas"><B>NEXT CLASS</B></A></FONT></TD>
<TD BGCOLOR="white" CLASS="NavBarCell2"><FONT SIZE="-2">
  <A HREF="../../../index.html?org/netlib/blas/SSPR.html" target="_top"><B>FRAMES</B></A>  &nbsp;
&nbsp;<A HREF="SSPR.html" target="_top"><B>NO FRAMES</B></A>  &nbsp;
&nbsp;<SCRIPT type="text/javascript">
  <!--
  if(window==top) {
    document.writeln('<A HREF="../../../allclasses-noframe.html"><B>All Classes</B></A>');
  }
  //-->
</SCRIPT>
<NOSCRIPT>
  <A HREF="../../../allclasses-noframe.html"><B>All Classes</B></A>
</NOSCRIPT>


</FONT></TD>
</TR>
<TR>
<TD VALIGN="top" CLASS="NavBarCell3"><FONT SIZE="-2">
  SUMMARY:&nbsp;NESTED&nbsp;|&nbsp;FIELD&nbsp;|&nbsp;<A HREF="#constructor_summary">CONSTR</A>&nbsp;|&nbsp;<A HREF="#method_summary">METHOD</A></FONT></TD>
<TD VALIGN="top" CLASS="NavBarCell3"><FONT SIZE="-2">
DETAIL:&nbsp;FIELD&nbsp;|&nbsp;<A HREF="#constructor_detail">CONSTR</A>&nbsp;|&nbsp;<A HREF="#method_detail">METHOD</A></FONT></TD>
</TR>
</TABLE>
<A NAME="skip-navbar_bottom"></A>
<!-- ======== END OF BOTTOM NAVBAR ======= -->

<HR>

</BODY>
</HTML>
