<?xml version="1.0" encoding="UTF-8"?>
<structure version="14" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*XML" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces>
			<nspair prefix="n1" uri="http://www.altova.com/documentation"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="MapForceDocumentation.xsd" workingxmlfile="SampleData\PersonListByBranchOffice.xml"/>
		</schemasources>
	</schemasources>
	<modules>
		<module spsfile="Modules\VerifySettings.sps"/>
	</modules>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript">function getAllDiv(kind)
{
	var arr=[];
	i = 0;
	div = null;
	var allDiv = document.getElementsByTagName(&apos;div&apos;);
	while (div = allDiv[i++])
	{
		if (div.id.indexOf(kind) == 0)
			arr.push(div);
	}
	return arr;
}

 function toggleAllDiv(kind,visible)
{
	allDiv = getAllDiv(kind);
	for (i = 0; i &lt; allDiv.length; i++)
	{
		toggleDiv(allDiv[i], visible);
	}
} 

function toggleDiv(div, visible)
{
	if (visible == undefined)
	{
		visible = false;
		if (div.style.display == &apos;none&apos;) visible = true;
	}

	if (visible)
	{
		div.style.display = &apos;block&apos;;
	}
	else
	{
		div.style.display = &apos;none&apos;;
	}
}
</script>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView"/>
	</script-project>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties _xtitle="$XML/n1:MapForceDocumentation/n1:Document/@title"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
						<children>
							<globaltemplate subtype="pdf-bookmarktree" match="pdf-bookmarktree">
								<children>
									<template subtype="element" match="n1:MapForceDocumentation">
										<children>
											<calltemplate subtype="named" match="PDF_Link">
												<parameters>
													<parameter name="FunctionName" value="&apos;Main mapping&apos;"/>
												</parameters>
											</calltemplate>
											<template subtype="element" match="n1:UserDefinedFunctionsDefines">
												<children>
													<template subtype="element" match="n1:Mapping">
														<children>
															<calltemplate subtype="named" match="PDF_Link">
																<parameters>
																	<parameter name="FunctionName" value="@name"/>
																</parameters>
															</calltemplate>
														</children>
														<variables/>
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
					</documentsection>
					<calltemplate subtype="named" match="EnsureAllIncludesAndDetails">
						<parameters/>
					</calltemplate>
					<template subtype="source" match="XML">
						<children>
							<paragraph paragraphtag="h3">
								<children>
									<text fixtext="This report shows call graphs of the main mapping and all user-defined functions."/>
								</children>
							</paragraph>
							<condition>
								<children>
									<conditionbranch xpath="$SV_OutputFormat = &apos;HTML&apos;">
										<children>
											<paragraph paragraphtag="p">
												<children>
													<link>
														<properties _xonclick="&apos;toggleAllDiv(&quot;Function&quot;,true)&apos;"/>
														<children>
															<text fixtext="Expand all functions"/>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="javascript:;"/>
														</hyperlink>
													</link>
													<text fixtext="   "/>
													<link>
														<properties _xonclick="&apos;toggleAllDiv(&quot;Function&quot;,false)&apos;"/>
														<children>
															<text fixtext="Collapse all functions"/>
														</children>
														<action>
															<none/>
														</action>
														<hyperlink>
															<fixtext value="javascript:;"/>
														</hyperlink>
													</link>
												</children>
											</paragraph>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<template subtype="element" match="n1:MapForceDocumentation">
								<children>
									<calltemplate subtype="named" match="TopFunction">
										<parameters>
											<parameter name="FunctionName" value="&apos;Main mapping&apos;"/>
											<parameter name="id" value="&apos;Main&apos;"/>
										</parameters>
									</calltemplate>
									<template subtype="element" match="n1:UserDefinedFunctionsDefines">
										<children>
											<template subtype="element" match="n1:Mapping">
												<children>
													<calltemplate subtype="named" match="TopFunction">
														<parameters>
															<parameter name="FunctionName" value="@name"/>
															<parameter name="id" value="@id"/>
														</parameters>
													</calltemplate>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
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
	<globalparts/>
	<designfragments>
		<children>
			<globaltemplate subtype="named" match="TopFunction">
				<parameters>
					<parameter name="FunctionName" type="xs:string"/>
					<parameter name="id" type="xs:string"/>
				</parameters>
				<children>
					<paragraph>
						<children>
							<bookmark>
								<action>
									<none/>
								</action>
								<bookmark>
									<xpath value="sps:GetLinkFromFunctionName($FunctionName)"/>
								</bookmark>
							</bookmark>
							<link conditional-processing="$SV_OutputFormat = &apos;HTML&apos;">
								<properties _xonclick="concat(&apos;toggleAllDiv(&quot;Function&apos;,$id,&apos;_&apos;,&apos;&quot;)&apos;)"/>
								<styles color="black" text-decoration="none"/>
								<children>
									<autocalc xpath="$FunctionName">
										<styles font-weight="bold"/>
									</autocalc>
								</children>
								<action>
									<none/>
								</action>
								<hyperlink>
									<fixtext value="javascript:;"/>
								</hyperlink>
							</link>
						</children>
					</paragraph>
					<calltemplate subtype="named" match="ChildFunctions">
						<parameters>
							<parameter name="Level"/>
							<parameter name="ParentFunctions" value="$FunctionName"/>
							<parameter name="id" value="$id"/>
						</parameters>
					</calltemplate>
					<paragraph>
						<properties _xid="concat(&apos;Function&apos;,$id,&apos;_&apos;)"/>
						<children>
							<text fixtext=" "/>
						</children>
					</paragraph>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ChildFunction">
				<parameters>
					<parameter name="Level" type="xs:integer" default-value="1"/>
					<parameter name="IsUDF" type="xs:boolean" occurrence="none-or-one" default-value="false()"/>
					<parameter name="ParentFunctions" type="xs:string" occurrence="none-or-more" default-value="()"/>
					<parameter name="id" type="xs:string"/>
				</parameters>
				<children>
					<paragraph>
						<properties _xid="concat(&apos;Function&apos;,$id,&apos;_&apos;)"/>
						<children>
							<template subtype="userdefined" match="1 to ($Level -1)">
								<children>
									<text fixtext="|"/>
									<text fixtext="---">
										<styles color="white"/>
									</text>
								</children>
								<variables/>
							</template>
							<text fixtext="|---"/>
							<template subtype="attribute" match="name">
								<children>
									<link conditional-processing="$IsUDF">
										<children>
											<content/>
										</children>
										<action>
											<none/>
										</action>
										<hyperlink>
											<fixtext value="#"/>
											<xpath value="sps:GetLinkFromFunctionName(.)"/>
										</hyperlink>
									</link>
								</children>
								<variables/>
							</template>
							<condition>
								<children>
									<conditionbranch xpath="$IsUDF and not(some $name in $ParentFunctions satisfies $name = @name)">
										<children>
											<template subtype="userdefined" match="for $name in @name return $XML//n1:UserDefinedFunctionsDefines/n1:Mapping[@name=$name]">
												<children>
													<calltemplate subtype="named" match="ChildFunctions">
														<parameters>
															<parameter name="Level" value="$Level+1"/>
															<parameter name="ParentFunctions" value="$ParentFunctions, @name"/>
															<parameter name="id" value="$id"/>
														</parameters>
													</calltemplate>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
								</children>
							</condition>
						</children>
					</paragraph>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ChildFunctions" schema-tree-path="$XML/n1:MapForceDocumentation">
				<parameters>
					<parameter name="Level" type="xs:integer" default-value="1"/>
					<parameter name="ParentFunctions" type="xs:string" occurrence="none-or-more" default-value="()"/>
					<parameter name="id" type="xs:string"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="n1:LibraryComponents or n1:UDFComponents">
								<children>
									<template subtype="element" match="n1:LibraryComponents">
										<children>
											<template subtype="element" groupingtype="group-by" groupingmatch="@name" match="n1:Component">
												<children>
													<calltemplate subtype="named" match="ChildFunction">
														<parameters>
															<parameter name="Level" value="$Level"/>
															<parameter name="IsUDF" value="false()"/>
															<parameter name="ParentFunctions" value="$ParentFunctions"/>
															<parameter name="id" value="$id"/>
														</parameters>
													</calltemplate>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
									<template subtype="element" match="n1:UDFComponents">
										<children>
											<template subtype="element" groupingtype="group-by" groupingmatch="@name" match="n1:Component">
												<children>
													<calltemplate subtype="named" match="ChildFunction">
														<parameters>
															<parameter name="Level" value="$Level"/>
															<parameter name="IsUDF" value="true()"/>
															<parameter name="ParentFunctions" value="$ParentFunctions"/>
															<parameter name="id" value="$id"/>
														</parameters>
													</calltemplate>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
							<conditionbranch xpath="$Level &gt; 1"/>
							<conditionbranch>
								<children>
									<paragraph>
										<properties _xid="concat(&apos;Function&apos;,$id,&apos;_&apos;)"/>
										<children>
											<text fixtext="(no functions called)">
												<styles font-style="italic"/>
											</text>
										</children>
									</paragraph>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" additional-mode="pdf-bookmarktree" match="PDF_Link">
				<parameters>
					<parameter name="FunctionName" type="xs:string"/>
				</parameters>
				<children>
					<pdf-bookmark>
						<children>
							<link>
								<children>
									<autocalc xpath="$FunctionName"/>
								</children>
								<action>
									<none/>
								</action>
								<hyperlink>
									<fixtext value="#"/>
									<xpath value="sps:GetLinkFromFunctionName($FunctionName)"/>
								</hyperlink>
							</link>
						</children>
					</pdf-bookmark>
				</children>
			</globaltemplate>
		</children>
	</designfragments>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
	<xpath-functions>
		<xpath-function name="GetLinkFromFunctionName" value="replace($FunctionName,&apos;\.&apos;,&apos;_&apos;)"/>
		<xpath-function-name>
			<variable name="FunctionName" valuetype="xs:string"/>
		</xpath-function-name>
	</xpath-functions>
</structure>
