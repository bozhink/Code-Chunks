<refentry xmlns="http://docbook.org/ns/docbook"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:xi="http://www.w3.org/2001/XInclude"
          xmlns:src="http://nwalsh.com/xmlns/litprog/fragment"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          version="5.0" xml:id="header.content.properties">
<refmeta>
<refentrytitle>header.content.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv>
<refname>header.content.properties</refname>
<refpurpose/>
</refnamediv>

<refsynopsisdiv>
<src:fragment xml:id="header.content.properties.frag">
<xsl:attribute-set name="header.content.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$title.margin.left"/>
  </xsl:attribute>
</xsl:attribute-set>
</src:fragment>
</refsynopsisdiv>

<refsection><info><title>Description</title></info>

<para>Properties of page header content.</para>

</refsection>
</refentry>
