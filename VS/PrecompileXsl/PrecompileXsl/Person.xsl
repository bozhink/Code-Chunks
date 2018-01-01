<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="urn:user">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Persons</h2>
        <table border="1">
          <tr bgcolor="#00FFFF">
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
            <th>City</th>
            <th>Email</th>
          </tr>
          <xsl:for-each select="Persons/Person">
            <tr>
             <td>
                <xsl:value-of select="Id"/>
              </td>
              <td>
                <xsl:value-of select="user:TextToUpper(Name)"/>
              </td>
              <xsl:choose>
                <xsl:when test="user:IsAbove30(Age)">
                  <td bgcolor="#00FF00">
                    <xsl:value-of select="Age"/>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td bgcolor="#FF0000">
                    <xsl:value-of select="Age"/>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
              <td>
                <xsl:value-of select="user:TextToUpper(City)"/>
              </td>
              <td>
                <xsl:value-of select="user:TextToUpper(Email)"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="user">
    <![CDATA[
    public string TextToUpper(string inString)
    {
      string s = inString.ToUpper();
      return s;
    }
    public bool IsAbove30(int inAge)
    {
      return (inAge > 30);
    }
    ]]>
  </msxsl:script>
</xsl:stylesheet>