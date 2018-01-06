<!--  task:xsl 1.1; 2002 May 8
 | Specific override stylesheet for tasks (demo)
 | This demonstrates the XSLT override mechanism tied to a specialization.
 |
 | Copyright IBM Corporation, 2002
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 *-->

<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="topic2html.xsl"/>

<!-- XHTML output with XML syntax) -->
<xsl:output method="xml"
            encoding="iso-8859-1"
            indent="yes"
            doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
            doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
/>


<xsl:template match="/">
  <xsl:comment>Sample DITA task to HTML application by IBM Corp., 2002</xsl:comment>
  <xsl:apply-templates/>
</xsl:template>


<!-- elements task and taskbody will fall through to topic processors -->


<!-- == TASK UNIQUE SUBSTRUCTURES == -->

<xsl:template match="*[contains(@class,' task/prereq ')]">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' task/context ')]">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="sect-heading">
      <xsl:with-param name="deftitle">
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' task/result ')]">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="sect-heading">
      <xsl:with-param name="deftitle">
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' task/postreq ')]">
  <div>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:call-template name="sect-heading">
      <xsl:with-param name="deftitle">
      </xsl:with-param>
    </xsl:call-template>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="*[contains(@class,' task/steps ')]">
  <ol>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </ol>
</xsl:template>

<xsl:template match="*[contains(@class,' task/step ')]">
  <li>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:if test="@importance='optional'">
      <strong>
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Optional'"/>
      </xsl:call-template><xsl:text>: </xsl:text>
      </strong>
    </xsl:if>
    <xsl:if test="@importance='required'">
      <strong>
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Required'"/>
      </xsl:call-template><xsl:text>: </xsl:text>
      </strong>
    </xsl:if>
    <xsl:apply-templates/>
  </li>
</xsl:template>

<xsl:template match="*[contains(@class,' task/substeps ')]">
  <ol type="a">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </ol>
</xsl:template>

<xsl:template match="*[contains(@class,' task/substep ')]">
  <li>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:if test="@importance='optional'">
      <strong>
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Optional'"/>
      </xsl:call-template><xsl:text>: </xsl:text>
      </strong>
    </xsl:if>
    <xsl:if test="@importance='required'">
      <strong>
      <xsl:call-template name="getString">
        <xsl:with-param name="stringName" select="'Required'"/>
      </xsl:call-template><xsl:text>: </xsl:text>
      </strong>
    </xsl:if>
    <xsl:apply-templates/>
  </li>
</xsl:template>

<xsl:template match="*[contains(@class,' task/choices ')]" priority="5">
  <xsl:choose>
    <xsl:when test="./*[contains(@class,' task/choice ')]">
      <ul>
        <xsl:call-template name="setclass"/>
        <xsl:apply-templates select="@id"/>
        <xsl:apply-templates/>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <table border="1" frame="hsides" rules="rows">
        <xsl:apply-templates select="@id"/>
        <thead>
          <tr><td><b>Option</b></td><td><b>Description</b></td></tr>
        </thead>
        <tbody>
          <xsl:apply-templates/>
        </tbody>
      </table>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[contains(@class,' task/choice ')]">
  <li>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </li>
</xsl:template>

<xsl:template match="*[contains(@class,' task/ifcond ')]">
  <tr valign="top">
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </tr>
</xsl:template>

<xsl:template match="*[contains(@class,' task/issue ')]">
  <td>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </td>
</xsl:template>

<xsl:template match="*[contains(@class,' task/outcome ')]">
  <td>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <xsl:apply-templates/>
  </td>
</xsl:template>

</xsl:stylesheet>
