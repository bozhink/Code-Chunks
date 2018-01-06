<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="ShortInfo.xsd"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView"/>
	</script-project>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<template subtype="element" match="ShortInfo">
								<children>
									<template subtype="element" match="Info">
										<children>
											<paragraph>
												<styles background-color="#e8eeff" border-color="#002780" border-style="solid" border-width="1px" padding="3px"/>
												<children>
													<text fixtext=" "/>
													<template subtype="element" match="Title">
														<children>
															<content>
																<styles color="#006980" font-family="Verdana" font-size="large" font-style="italic" font-weight="bold"/>
															</content>
														</children>
														<variables/>
													</template>
													<text fixtext=" ">
														<styles font-family="Verdana" font-size="large" font-weight="bold"/>
													</text>
												</children>
											</paragraph>
											<paragraph>
												<styles background-color="#e8eeff" border-color="#002780" border-style="solid" border-width="1px" padding="3px"/>
												<children>
													<newline/>
													<template subtype="element" match="Description">
														<children>
															<content/>
														</children>
														<variables/>
													</template>
													<paragraph>
														<children>
															<paragraph paragraphtag="p">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$SV_OutputFormat = &apos;Authentic&apos; or $SV_OutputFormat = &apos;HTML&apos;">
																				<children>
																					<userxmltext text="&lt;object width=&quot;500&quot; height=&quot;400&quot;&gt;
&lt;param
  name=&quot;movie&quot;
  value=&quot;http://www.youtube.com/v/{$videoID}&amp;amp;feature=player_embedded&amp;amp;fs=1&quot;&gt;
&lt;/param&gt;
&lt;param name=&quot;allowFullScreen&quot; value=&quot;true&quot;&gt;&lt;/param&gt;
&lt;param name=&quot;allowScriptAccess&quot; value=&quot;always&quot;&gt;&lt;/param&gt;
&lt;embed
  src=&quot;http://www.youtube.com/v/{$videoID}&amp;amp;feature=player_embedded&amp;amp;fs=1&quot;
  type=&quot;application/x-shockwave-flash&quot;
  allowfullscreen=&quot;true&quot;
  allowScriptAccess=&quot;always&quot;
  width=&quot;500&quot;
  height=&quot;400&quot;&gt;
&lt;/embed&gt;
&lt;/object&gt;"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">
																				<children>
																					<text fixtext="Watch an introduction to "/>
																					<autocalc xpath="Title"/>
																					<text fixtext=" on "/>
																					<text fixtext="http://www.youtube.com/watch?v=">
																						<styles font-style="italic"/>
																					</text>
																					<autocalc xpath="$videoID">
																						<styles font-style="italic"/>
																					</autocalc>
																					<text fixtext="."/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<link>
																						<children>
																							<text fixtext="Click here"/>
																						</children>
																						<action>
																							<none/>
																						</action>
																						<hyperlink>
																							<fixtext value="http://www.youtube.com/watch?v="/>
																							<xpath value="$videoID"/>
																						</hyperlink>
																					</link>
																					<text fixtext=" to watch an introduction to "/>
																					<autocalc xpath="Title"/>
																					<text fixtext="."/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</paragraph>
														</children>
													</paragraph>
												</children>
											</paragraph>
											<newline/>
										</children>
										<variables>
											<variable name="videoID" value="if ( Title = &apos;XMLSpy&apos; ) then &apos;peDI7e3U4hI&apos; else if ( Title = &apos;MapForce&apos; ) then &apos;wT8LUprEITc&apos; else if ( Title = &apos;StyleVision&apos; ) then &apos;T39EPl8q-V8&apos; else &apos;tCYjJwNrvfo&apos;" valuetype="&lt;auto&gt;"/>
										</variables>
									</template>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts>
		<children>
			<globaltemplate subtype="element" match="Bold" schema-tree-path="$XML/ShortInfo/Info/Description/Bold">
				<children>
					<template subtype="element" match="Bold">
						<children>
							<content>
								<styles font-weight="bold"/>
							</content>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="element" match="Italic" schema-tree-path="$XML/ShortInfo/Info/Description/Italic">
				<children>
					<template subtype="element" match="Italic">
						<children>
							<content>
								<styles font-style="italic"/>
							</content>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</globalparts>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
