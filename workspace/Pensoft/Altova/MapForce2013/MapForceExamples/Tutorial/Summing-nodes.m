<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="8">
	<component name="defaultmap1" blackbox="0" uid="51772168" editable="1">
		<properties XSLTTargetEncoding="UTF-8" SelectedLanguage="xslt"/>
		<structure>
			<children>
				<component name="document" library="xml" uid="51772400" kind="14">
					<properties XSLTDefaultOutput="1"/>
					<view ltx="282" lty="48" rbx="418" rby="180"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
								</namespaces>
							</header>
							<entry name="0:Output" expanded="1">
								<entry name="0:Total" inpkey="47595528"/>
								<entry name="0:Product" expanded="1" inpkey="47594688">
									<entry name="0:Name" inpkey="47595208"/>
									<entry name="0:Amount" inpkey="47590320"/>
									<entry name="0:Price" inpkey="47594968"/>
								</entry>
							</entry>
						</root>
						<document schema="output.xsd" outputinstance="output.xml" instanceroot="{}Output"/>
					</data>
				</component>
				<component name="document" library="xml" uid="51888144" kind="14">
					<properties/>
					<view ltx="-48" lty="48" rbx="92" rby="179"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
								</namespaces>
							</header>
							<entry name="0:Input" expanded="1">
								<entry name="0:Products" expanded="1" outkey="58632512">
									<entry name="0:Product" expanded="1" outkey="61019120">
										<entry name="0:Name" outkey="47689536"/>
										<entry name="0:Amount" outkey="51150296"/>
										<entry name="0:Price" outkey="51152056"/>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="input.xsd" inputinstance="input.xml" outputinstance="input.xml" instanceroot="{}Input"/>
					</data>
				</component>
				<component name="Total" library="Summing-nodes" uid="52064832" kind="5">
					<properties/>
					<sources>
						<datapoint pos="0" key="47660216"/>
					</sources>
					<targets>
						<datapoint pos="0" key="47595808"/>
					</targets>
					<view ltx="143" lty="27"/>
				</component>
			</children>
			<graph directed="1">
				<edges>
					<edge edgekey="47671688"/>
					<edge edgekey="47679608"/>
					<edge edgekey="47679680"/>
					<edge edgekey="47687568"/>
					<edge edgekey="47687640"/>
					<edge edgekey="47688960"/>
				</edges>
				<vertices>
					<vertex vertexkey="47595808">
						<edges>
							<edge vertexkey="47595528" edgekey="47687640"/>
						</edges>
					</vertex>
					<vertex vertexkey="47689536">
						<edges>
							<edge vertexkey="47595208" edgekey="47687568"/>
						</edges>
					</vertex>
					<vertex vertexkey="51150296">
						<edges>
							<edge vertexkey="47590320" edgekey="47679680"/>
						</edges>
					</vertex>
					<vertex vertexkey="51152056">
						<edges>
							<edge vertexkey="47594968" edgekey="47688960"/>
						</edges>
					</vertex>
					<vertex vertexkey="58632512">
						<edges>
							<edge vertexkey="47660216" edgekey="47671688"/>
						</edges>
					</vertex>
					<vertex vertexkey="61019120">
						<edges>
							<edge vertexkey="47594688" edgekey="47679608"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
