<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="*">
		<xsl:for-each select=".">
		<xsl:call-template name="tokenize">
		<xsl:with-param name="string" select="."/>
		</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="tokenize">
		<xsl:param name="string" select="."/>
		<xsl:variable name="caps" select="translate($string, '-abcdefghijklmnopqrstuvwxyz', '')"/>
		<xsl:variable name="capscount" select="string-length($caps)"/>
		<xsl:variable name="token">
			<xsl:choose>
				<xsl:when test="string-length($caps) > 1">
					<xsl:value-of select="substring-before($string, substring($caps, 2, 1))"/>
				</xsl:when>
				<xsl:when test="string-length($caps) &lt; 2">
					<xsl:value-of select="$string"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$token!=''">
				<xsl:variable name="newstring" select="substring-after($string, $token)"/>
				<xsl:variable name="nexttoken">
					<xsl:call-template name="tokenize">
						<xsl:with-param name="string" select="$newstring"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="result" select="concat($token, ' ', $nexttoken)"/>
				<xsl:value-of select="normalize-space($result)"/>
			</xsl:when>
		</xsl:choose>		
	</xsl:template>
</xsl:stylesheet>
