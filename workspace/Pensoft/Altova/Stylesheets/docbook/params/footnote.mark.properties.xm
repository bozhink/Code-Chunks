<refentry xmlns="http://docbook.org/ns/docbook"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:xi="http://www.w3.org/2001/XInclude"
          xmlns:src="http://nwalsh.com/xmlns/litprog/fragment"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          version="5.0" xml:id="footnote.mark.properties">
<refmeta>
<refentrytitle>footnote.mark.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>  
<refnamediv>
<refname>footnote.mark.properties</refname>
<refpurpose>Properties applied to each footnote mark
</refpurpose>
</refnamediv>

<refsynopsisdiv>
<src:fragment xml:id="footnote.mark.properties.frag">
<xsl:attribute-set name="footnote.mark.properties">
  <xsl:attribute name="font-size">75%</xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
</xsl:attribute-set>
</src:fragment>
</refsynopsisdiv>

<refsection><info><title>Description</title></info>

<para>This attribute set is applied to the footnote mark used
for each footnote.
It should contain only inline properties.
</para>

<para>The property to make the mark a superscript is contained in the
footnote template itself, because the current version of FOP reports
an error if baseline-shift is used.
</para>

</refsection>
</refentry>
