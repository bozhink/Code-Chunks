<?xml version="1.0" encoding="UTF-8"?>
<mapping xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="10">
	<component name="defaultmap1" blackbox="0" uid="73410360" editable="1">
		<properties SelectedLanguage="java" WSDLFile="TimeService.wsdl" WSDLService="{http://www.Nanonull.com/TimeService/}TimeService" WSDLPort="TimeServiceSoap" WSDLOperation="{http://www.Nanonull.com/TimeService/}getUTCTime"/>
		<structure>
			<children>
				<component name="now" library="lang" uid="73758888" kind="5">
					<properties/>
					<targets>
						<datapoint pos="0" key="184322128"/>
					</targets>
					<view ltx="320" lty="167" rbx="20" rby="-18"/>
				</component>
				<component name="wsdl" library="wsdl" uid="74042160" kind="17" visible="0">
					<properties XSLTDefaultOutput="1"/>
					<view ltx="400" lty="100" rbx="629" rby="164"/>
					<data>
						<root>
							<header>
								<namespaces>
									<namespace uid="http://www.Nanonull.com/TimeService/"/>
									<namespace/>
								</namespaces>
							</header>
							<entry name="getUTCTimeSoapOut" expanded="1">
								<entry name="parameters" ns="1" inpkey="184350752" expanded="1">
									<entry name="getUTCTimeResult" inpkey="184356584"/>
								</entry>
							</entry>
						</root>
						<wsdl kind="output"/>
					</data>
				</component>
				<component name="wsdl" library="wsdl" uid="73699760" kind="17" visible="0">
					<view ltx="65" lty="100" rbx="271" rby="161"/>
					<data>
						<root>
							<header>
								<namespaces>
									<namespace/>
									<namespace uid="http://www.Nanonull.com/TimeService/"/>
								</namespaces>
							</header>
							<entry name="getUTCTimeSoapIn" ns="1" expanded="1">
								<entry name="parameters" outkey="184375752"/>
							</entry>
						</root>
						<wsdl previewRequestInstanceFile="getUTCTimeRequest.xml"/>
					</data>
				</component>
			</children>
			<graph directed="1">
				<edges/>
				<vertices>
					<vertex vertexkey="184322128">
						<edges>
							<edge vertexkey="184356584" edgekey="184379040"/>
						</edges>
					</vertex>
					<vertex vertexkey="184375752">
						<edges>
							<edge vertexkey="184350752" edgekey="184379336"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
