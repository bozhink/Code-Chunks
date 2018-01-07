<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:altova="http://www.altova.com">
	<xsl:output version="4.0" method="html" indent="no" encoding="UTF-8"/>
	<xsl:param name="SV_OutputFormat" select="'HTML'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:template match="/">
		<html>
			<head>
				<title/>
			</head>
			<body>
				<xsl:for-each select="$XML">
					<xsl:for-each select="NewsML">
						<br/>
						<br/>
						<table width="95%">
							<tbody>
								<tr>
									<td>
										<span style="color:lime; font-family:@Arial Unicode MS; font-weight:bold; ">
											<xsl:text>NewsML</xsl:text>
										</span>
										<br/>
										<xsl:apply-templates/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
					</xsl:for-each>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="BasisForChoice">
		<span>
			<xsl:text>BasisForChoice = </xsl:text>
		</span>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Catalog">
		<xsl:for-each select="Resource">
			<xsl:for-each select="DefaultVocabularyFor">
				<xsl:for-each select="@Context">
					<br/>
					<span>
						<xsl:text>DefaultVoacbFor: </xsl:text>
					</span>
					<span>
						<xsl:value-of select="string(.)"/>
					</span>
				</xsl:for-each>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="Urn">
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
			<xsl:for-each select="Url">
				<span style="color:blue; ">
					<xsl:apply-templates/>
				</span>
			</xsl:for-each>
		</xsl:for-each>
		<br/>
	</xsl:template>
	<xsl:template match="ContentItem">
		<br/>
		<br/>
		<table width="95%">
			<tbody>
				<tr>
					<td>
						<xsl:for-each select="@Href">
							<span>
								<xsl:value-of select="string(.)"/>
							</span>
						</xsl:for-each>
						<br/>
						<xsl:for-each select="Comment">
							<xsl:apply-templates/>
						</xsl:for-each>
						<br/>
						<xsl:apply-templates select="Catalog | Characteristics | DataContent | Encoding | Format | MediaType | MimeType | Notation | text()"/>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template match="Copyright">
		<span>
			<xsl:text>Copyright = </xsl:text>
		</span>
		<xsl:apply-templates/>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text>Assignedby=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
	</xsl:template>
	<xsl:template match="DescriptiveMetadata">
		<span style="color:#008027; font-family:Arial; ">
			<xsl:text>Metadata Description</xsl:text>
		</span>
		<span style="color:#008027; ">
			<xsl:text>&#160;</xsl:text>
		</span>
		<br/>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<span>
			<xsl:text>&#160; </xsl:text>
		</span>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<span>
			<xsl:text>&#160; </xsl:text>
		</span>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<span>
			<xsl:text>&#160; </xsl:text>
		</span>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Encoding">
		<span>
			<xsl:text>Encoding = </xsl:text>
		</span>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="FirstCreated">
		<span>
			<xsl:text>FirstCreated = </xsl:text>
		</span>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Format">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Genre">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence =</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance =</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text>AssignedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<br/>
	</xsl:template>
	<xsl:template match="Instruction">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="LabelType">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Language">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text> AssignedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text> HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text> DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="MediaType">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="MetadataType">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="MimeType">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="NewsComponent">
		<br/>
		<br/>
		<table width="95%">
			<tbody>
				<tr>
					<td>
						<span style="color:red; font-family:@Arial Unicode MS; ">
							<xsl:text>NewsComponent</xsl:text>
						</span>
						<br/>
						<br/>
						<xsl:apply-templates/>
						<br/>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template match="NewsEnvelope">
		<br/>
		<span style="color:#c04b00; font-family:Arial; ">
			<xsl:text>News Envelope</xsl:text>
		</span>
		<br/>
		<br/>
		<span>
			<xsl:text>Envelope Date/Time = </xsl:text>
		</span>
		<xsl:for-each select="DateAndTime">
			<xsl:apply-templates/>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates select="NewsProduct | NewsService | Priority | SentFrom | SentTo | TransmissionId | text()"/>
		<br/>
	</xsl:template>
	<xsl:template match="NewsItem">
		<br/>
		<br/>
		<table width="95%">
			<tbody>
				<tr>
					<td>
						<span style="color:blue; font-family:Arial; font-weight:bold; ">
							<xsl:text>NewsItem</xsl:text>
						</span>
						<br/>
						<span>
							<xsl:text>NewsIdentifier=urn:newsml:</xsl:text>
						</span>
						<xsl:for-each select="Identification">
							<xsl:for-each select="NewsIdentifier">
								<xsl:for-each select="ProviderId">
									<xsl:apply-templates/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<span>
							<xsl:text>:</xsl:text>
						</span>
						<xsl:for-each select="Identification">
							<xsl:for-each select="NewsIdentifier">
								<xsl:for-each select="DateId">
									<xsl:apply-templates/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<span>
							<xsl:text> :</xsl:text>
						</span>
						<xsl:for-each select="Identification">
							<xsl:for-each select="NewsIdentifier">
								<xsl:for-each select="NewsItemId">
									<xsl:apply-templates/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<span>
							<xsl:text> : </xsl:text>
						</span>
						<xsl:for-each select="Identification">
							<xsl:for-each select="NewsIdentifier">
								<xsl:for-each select="RevisionId">
									<xsl:apply-templates/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<br/>
						<xsl:apply-templates select="Catalog | Comment | NewsComponent | NewsManagement | TopicSet | Update | text()"/>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template match="NewsItemRef">
		<br/>
		<br/>
		<table width="95%">
			<tbody>
				<tr>
					<td/>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template match="NewsItemType">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="NewsLines">
		<span style="color:#8000ff; font-family:Arial; ">
			<xsl:text>News Lines</xsl:text>
		</span>
		<br/>
		<br/>
		<xsl:for-each select="HeadLine">
			<xsl:apply-templates/>
		</xsl:for-each>
		<xsl:for-each select="SubHeadLine">
			<xsl:apply-templates/>
		</xsl:for-each>
		<xsl:for-each select="ByLine">
			<xsl:apply-templates/>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="DateLine">
			<xsl:apply-templates/>
		</xsl:for-each>
		<xsl:for-each select="CopyrightLine">
			<xsl:apply-templates/>
		</xsl:for-each>
		<br/>
		<br/>
	</xsl:template>
	<xsl:template match="NewsProduct">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="NewsService">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Notation">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="OfInterestTo">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text> Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text> Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text> AssignedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text> HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text> DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="Party">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Priority">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="Relevance">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text>Assignedby = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
	</xsl:template>
	<xsl:template match="Role">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates select="text()"/>
	</xsl:template>
	<xsl:template match="Status">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates select="text()"/>
	</xsl:template>
	<xsl:template match="Subject">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text> Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text> Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text> AssginedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text> HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text> DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<br/>
		<br/>
	</xsl:template>
	<xsl:template match="SubjectDetail">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text> Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text> Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text> AssignedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text> HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text> DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="SubjectMatter">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text>AssigneBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
	</xsl:template>
	<xsl:template match="SubjectQualifier">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text> Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text> Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text> AssignedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text> HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text> DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ThisRevisionCreated">
		<span>
			<xsl:text>ThisRevisionCreated = </xsl:text>
		</span>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="TopicOccurrence">
		<span>
			<xsl:text>TopicOccurence=</xsl:text>
		</span>
		<xsl:apply-templates/>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text>AssignedBy=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime=</xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="TopicSet">
		<br/>
		<br/>
		<table border="0" width="95%">
			<tbody>
				<tr>
					<td>
						<xsl:for-each select="@FormalName">
							<span style="color:#FF8800; font-weight:bold; ">
								<xsl:value-of select="string(.)"/>
							</span>
						</xsl:for-each>
						<xsl:apply-templates select="Catalog | Comment | Topic | TopicSetRef | text()"/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
	</xsl:template>
	<xsl:template match="TopicType">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates select="text()"/>
	</xsl:template>
	<xsl:template match="Urgency">
		<xsl:for-each select="@FormalName">
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="UsageRights">
		<span>
			<xsl:text>UsageRights=</xsl:text>
		</span>
		<xsl:apply-templates/>
		<br/>
		<xsl:for-each select="@Confidence">
			<span>
				<xsl:text>Confidence = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@Importance">
			<span>
				<xsl:text>Importance = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@AssignedBy">
			<span>
				<xsl:text>AssignedBy = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@HowPresent">
			<span>
				<xsl:text>HowPresent = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
			<span>
				<xsl:text>&#160;</xsl:text>
			</span>
		</xsl:for-each>
		<xsl:for-each select="@DateAndTime">
			<span>
				<xsl:text>DateAndTime = </xsl:text>
			</span>
			<span>
				<xsl:value-of select="string(.)"/>
			</span>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
