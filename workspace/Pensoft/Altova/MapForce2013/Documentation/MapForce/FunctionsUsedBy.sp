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
				<document-properties _xtitle="$XML/n1:MapForceDocumentation/n1:Document/@title"/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<template subtype="source" match="XML">
						<children>
							<calltemplate subtype="named" match="EnsureAllIncludesAndDetails">
								<parameters/>
							</calltemplate>
							<paragraph paragraphtag="h3">
								<children>
									<text fixtext="This report lists all functions and their direct and indirect use in another functions. This is especially important for planning changes in user-defined functions in order to see what other functions can be affected."/>
								</children>
							</paragraph>
							<template subtype="userdefined" groupingtype="group-by" groupingmatch="substring-before( . , &apos;.&apos; )" match="distinct-values((//n1:Component/@name, //n1:UserDefinedFunctionsDefines/n1:Mapping/@name))">
								<sort>
									<key match="current-grouping-key()"/>
								</sort>
								<children>
									<paragraph paragraphtag="p">
										<children>
											<text fixtext="Library "/>
											<autocalc xpath="current-grouping-key()">
												<styles font-weight="bold"/>
											</autocalc>
										</children>
									</paragraph>
									<tgrid>
										<properties border="1" cellspacing="0" width="100%"/>
										<children>
											<tgridbody-cols>
												<children>
													<tgridcol>
														<styles width="33%"/>
													</tgridcol>
													<tgridcol>
														<styles width="33%"/>
													</tgridcol>
													<tgridcol>
														<styles width="33%"/>
													</tgridcol>
												</children>
											</tgridbody-cols>
											<tgridheader-rows>
												<children>
													<tgridrow>
														<children>
															<tgridcell>
																<styles text-align="left"/>
																<children>
																	<text fixtext="Function"/>
																</children>
															</tgridcell>
															<tgridcell>
																<styles text-align="left"/>
																<children>
																	<text fixtext="Directly used by"/>
																</children>
															</tgridcell>
															<tgridcell>
																<styles text-align="left"/>
																<children>
																	<text fixtext="Indirectly used by"/>
																</children>
															</tgridcell>
														</children>
													</tgridrow>
												</children>
											</tgridheader-rows>
											<tgridbody-rows>
												<children>
													<template subtype="userdefined" match="current-group()">
														<sort>
															<key match="upper-case(.)"/>
														</sort>
														<children>
															<tgridrow>
																<children>
																	<tgridcell>
																		<properties valign="top"/>
																		<children>
																			<content/>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<properties valign="top"/>
																		<children>
																			<template subtype="uservariable" match="$DirectlyUsedBy">
																				<sort>
																					<key match="if (sps:IsFunctionMain(.)) then 0 else 1" datatype="Number"/>
																					<key match="upper-case(sps:FunctionName(.))"/>
																				</sort>
																				<children>
																					<paragraph>
																						<children>
																							<autocalc xpath="sps:FunctionName(.)"/>
																						</children>
																					</paragraph>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																	<tgridcell>
																		<properties valign="top"/>
																		<children>
																			<template subtype="userdefined" match="sps:GetAllIndirectlylUsedBy($DirectlyUsedBy)">
																				<sort>
																					<key match="if (sps:IsFunctionMain(.)) then 0 else 1" datatype="Number"/>
																					<key match="upper-case(sps:FunctionName(.))"/>
																				</sort>
																				<children>
																					<paragraph>
																						<children>
																							<autocalc xpath="sps:FunctionName(.)"/>
																						</children>
																					</paragraph>
																				</children>
																				<variables/>
																			</template>
																		</children>
																	</tgridcell>
																</children>
															</tgridrow>
														</children>
														<variables>
															<variable name="DirectlyUsedBy" value="sps:GetDirectlyUsedBy(.)" valuetype="&lt;auto&gt;"/>
														</variables>
													</template>
												</children>
											</tgridbody-rows>
										</children>
									</tgrid>
									<paragraph paragraphtag="p">
										<children>
											<text fixtext=" "/>
										</children>
									</paragraph>
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
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
	<xpath-functions>
		<xpath-function name="GetAdditionalUsedBy" value="if (empty($NewFoundSet))
then $AllFoundSet
else sps:GetAdditionalUsedBy(
 $ExcludeSet union $AllFoundSet union $NewFoundSet,
 $AllFoundSet union $NewFoundSet,
 sps:GetIndirectlyUsedBy( $NewFoundSet ) except
   ($ExcludeSet union $AllFoundSet union $NewFoundSet)
)"/>
		<xpath-function-name>
			<variable name="ExcludeSet"/>
			<variable name="AllFoundSet"/>
			<variable name="NewFoundSet"/>
		</xpath-function-name>
	</xpath-functions>
	<xpath-functions>
		<xpath-function name="GetAllIndirectlylUsedBy" value="sps:GetAdditionalUsedBy(
$DirectlyUsedBy,
(),
sps:GetIndirectlyUsedBy($DirectlyUsedBy) except $DirectlyUsedBy
)"/>
		<xpath-function-name>
			<variable name="DirectlyUsedBy"/>
		</xpath-function-name>
	</xpath-functions>
	<xpath-functions>
		<xpath-function name="GetDirectlyUsedBy" value="$XML//n1:Mapping/*/n1:Component[@name=$FunctionName]/ancestor::n1:Mapping union
(if ($XML/n1:MapForceDocumentation/*/n1:Component[@name=$FunctionName])
then $XML/n1:MapForceDocumentation
else ())"/>
		<xpath-function-name>
			<variable name="FunctionName" valuetype="xs:string"/>
		</xpath-function-name>
	</xpath-functions>
	<xpath-functions>
		<xpath-function name="GetIndirectlyUsedBy" value="(
  for $i in $UsedBy return
  if (sps:IsFunctionMain($i))
  then ()
  else sps:GetDirectlyUsedBy(sps:FunctionName($i))
) union ()"/>
		<xpath-function-name>
			<variable name="UsedBy"/>
		</xpath-function-name>
	</xpath-functions>
	<xpath-functions>
		<xpath-function name="IsFunctionMain" value="$FunctionNode/local-name()=&apos;MapForceDocumentation&apos;"/>
		<xpath-function-name>
			<variable name="FunctionNode"/>
		</xpath-function-name>
	</xpath-functions>
	<xpath-functions>
		<xpath-function name="FunctionName" value="if (sps:IsFunctionMain($FunctionNode))
then &apos;Main mapping&apos;
else $FunctionNode/@name"/>
		<xpath-function-name>
			<variable name="FunctionNode"/>
		</xpath-function-name>
	</xpath-functions>
</structure>
