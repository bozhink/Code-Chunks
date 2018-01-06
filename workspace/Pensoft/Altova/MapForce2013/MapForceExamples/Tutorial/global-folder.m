<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="11">
	<component name="defaultmap1" blackbox="0" editable="1">
		<properties SelectedLanguage="java"/>
		<structure>
			<children>
				<component name="document" library="xml" uid="4" kind="14">
					<properties XSLTDefaultOutput="1"/>
					<view ltx="268" lty="-2" rbx="434" rby="208"/>
					<data>
						<root>
							<header>
								<namespaces>
									<namespace uid="http://my-company.com/namespace"/>
								</namespaces>
							</header>
							<entry name="Company" expanded="1">
								<entry name="Person" inpkey="71132936" expanded="1">
									<entry name="First" inpkey="73724840"/>
									<entry name="Last" inpkey="73726040"/>
									<entry name="Title" inpkey="73728024"/>
									<entry name="Email" inpkey="73724512"/>
								</entry>
							</entry>
						</root>
						<document schema="MFCompany.xsd" inputinstance="MFCompany.xml" outputinstance="MFCompany.xml" instanceroot="{http://my-company.com/namespace}Company"/>
						<wsdl/>
					</data>
				</component>
				<component name="document" library="xml" uid="1" kind="14">
					<properties XSLTTargetEncoding="UTF-8"/>
					<view rbx="177" rby="208"/>
					<data>
						<root scrollposition="1">
							<header>
								<namespaces>
									<namespace/>
								</namespaces>
							</header>
							<entry name="expense-report" expanded="1">
								<entry name="Person" outkey="71135368" expanded="1">
									<entry name="First" outkey="71133352"/>
									<entry name="Last" outkey="71133456"/>
									<entry name="Title" outkey="71135472"/>
									<entry name="Email" outkey="71135680"/>
								</entry>
							</entry>
						</root>
						<document schema="ExpReport.xsd" inputinstance="ExpReport.xml" outputinstance="ExpReport-item.xml" instanceroot="{}expense-report"/>
						<wsdl/>
					</data>
				</component>
			</children>
			<graph directed="1">
				<edges/>
				<vertices>
					<vertex vertexkey="71133352">
						<edges>
							<edge vertexkey="73724840" edgekey="79703984"/>
						</edges>
					</vertex>
					<vertex vertexkey="71133456">
						<edges>
							<edge vertexkey="73726040" edgekey="79702472"/>
						</edges>
					</vertex>
					<vertex vertexkey="71135368">
						<edges>
							<edge vertexkey="71132936" edgekey="79635504"/>
						</edges>
					</vertex>
					<vertex vertexkey="71135472">
						<edges>
							<edge vertexkey="73728024" edgekey="79634672"/>
						</edges>
					</vertex>
					<vertex vertexkey="71135680">
						<edges>
							<edge vertexkey="73724512" edgekey="79701680"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
