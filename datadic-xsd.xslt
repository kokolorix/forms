<?xml version="1.0" encoding="iso-8859-1"?>
<!--<?altova_samplexml SINA18.xml?>
-->
<?altova_samplexml MPP-Small.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:output name="xml-def" method="xml" indent="yes"/>
	<!--=======================================================================-->
	<!-- Main-Template -->
	<!--=======================================================================-->
	<xsl:template match="/">
		<xsl:variable name="fn" select="replace(base-uri(.),'.xml' ,'.xsd')"/>
		<xsl:result-document href="{$fn}" format="xml-def">
			<xs:schema>
				<xs:element name="DATAPACKET">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="ROW" type="T_Row"/>
							<xs:sequence minOccurs="0">
								<xs:element ref="PGM_INFO"/>
							</xs:sequence>
						</xs:sequence>
						<xs:attribute name="Version" use="required">
							<xs:simpleType>
								<xs:restriction base="xs:decimal">
									<xs:enumeration value="1"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="noNamespaceSchemaLocation" type="xs:string" use="optional"/>
					</xs:complexType>
				</xs:element>
				<xs:element name="PGM_INFO">
					<xs:complexType>
						<xs:attribute name="FileVersion" use="required">
							<xs:simpleType>
								<xs:restriction base="xs:string"></xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="DatenbankAnwender" use="required">
							<xs:simpleType>
								<xs:restriction base="xs:byte"></xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="DatenbankAnwenderDescr" use="required">
							<xs:simpleType>
								<xs:restriction base="xs:string"></xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="FormAnwender" use="required">
							<xs:simpleType>
								<xs:restriction base="xs:byte"></xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="FormAnwenderDescr" use="required">
							<xs:simpleType>
								<xs:restriction base="xs:string"></xs:restriction>
							</xs:simpleType>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<!--=======================================================================-->
				<xsl:call-template name="SpecialElements"/>
				<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="Elm"/>
				<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="Elm"/>
				<!--=======================================================================-->
				<xsl:call-template name="Types"/>
				<!--=======================================================================-->
				<xs:complexType name="T_Row">
					<xs:all>
						<xs:element ref="FORM_TYP"/>
						<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="ref"/>
						<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="ref"/>
					</xs:all>
				</xs:complexType>
				<xsl:apply-templates select="/Form/DataDic/Tab/Tab" mode="T"/>
				<!--=======================================================================-->
			</xs:schema>
		</xsl:result-document>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Feld-Element -->
	<!--=======================================================================-->
	<xsl:template name="SpecialElements">
		<xs:element name="FORM_TYP">
			<xs:simpleType>
				<xs:restriction base="xs:string">
					<xs:enumeration>
						<xsl:attribute name="value">
							<xsl:value-of select="/Form/@FORMTYP"/>
						</xsl:attribute>
					</xs:enumeration>
				</xs:restriction>
			</xs:simpleType>
		</xs:element>
		<!--<xs:element name="ID" type="T_INT"/>-->
	</xsl:template>
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="Elm">
		<xsl:variable name="complexType">
			<xsl:text>T_</xsl:text>
			<xsl:value-of select="@Type"></xsl:value-of>
		</xsl:variable>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"></xsl:value-of>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@Length">
					<xs:complexType>
						<xs:simpleContent>
							<xs:restriction base="{$complexType}">
								<xsl:if test="@Length">
									<xsl:element name="xs:minLength">
										<xsl:attribute name="value">0</xsl:attribute>
									</xsl:element>
									<xsl:element name="xs:maxLength">
										<xsl:attribute name="value">
										<xsl:value-of select="@Length"/>
										</xsl:attribute>
									</xsl:element>
								</xsl:if>
								<xsl:if test="./*[starts-with(name(), 'Udo_')]">
									<xsl:choose>
										<xsl:when test="@ULookupOnly = 'true'"></xsl:when>
									</xsl:choose>
									<xsl:element name="xs:pattern">
										<xsl:attribute name="value">.*</xsl:attribute>
									</xsl:element>
									<xsl:for-each select="./*[starts-with(name(), 'Udo_')]/Uda">
										<xsl:element name="xs:pattern">
											<xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute>
											<xsl:attribute name="xml:lang">
											<xsl:choose>
												<xsl:when test="ends-with(../name(), 'FR')">fr</xsl:when>
												<xsl:when test="ends-with(../name(), 'IT')">it</xsl:when>
												<xsl:otherwise>de</xsl:otherwise>
											</xsl:choose>
											</xsl:attribute>
										</xsl:element>
									</xsl:for-each>
							</xsl:if>
							</xs:restriction>
						</xs:simpleContent>
					</xs:complexType>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="type">
						<xsl:text>T_</xsl:text>
						<xsl:value-of select="@Type"></xsl:value-of>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Tab-Template, erstellt ein Subtabellen-Element -->
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="Elm">
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"/>
				<xsl:text>_DE</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_FR</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="name">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_IT</xsl:text>
			</xsl:attribute>
		<xsl:attribute name="substitutionGroup">
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xsl:attribute name="type">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
		</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt einen Feld-Typ -->
	<!--=======================================================================-->
	<xsl:template name="Types">
		<xs:complexType name="T_MEMO">
			<xs:simpleContent>
				<xs:extension base="ST_STRING">
					<xs:attribute name="OLD" type="ST_STRING" use="optional"/>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
		<xs:complexType name="T_STRING">
			<xs:simpleContent>
				<xs:extension base="ST_STRING">
					<xs:attribute name="OLD" type="ST_STRING" use="optional"/>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
		<xs:simpleType name="ST_STRING">
			<xs:restriction base="xs:string"></xs:restriction>
		</xs:simpleType>
		<xs:complexType name="T_INT">
			<xs:simpleContent>
				<xs:extension base="ST_INT">
					<xs:attribute name="OLD" type="ST_INT" use="optional"/>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
		<xs:simpleType name="ST_INT">
			<xs:restriction base="xs:string">
				<xs:pattern value="[0-9]*"/>
			</xs:restriction>
		</xs:simpleType>
		<xs:complexType name="T_BOOL">
			<xs:simpleContent>
				<xs:extension base="ST_BOOL">
					<xs:attribute name="OLD" type="ST_BOOL" use="optional"/>
					<xs:attribute name="Type" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:string">
								<xs:enumeration value="B"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
		<xs:simpleType name="ST_BOOL">
			<xs:restriction base="xs:string">
				<xs:enumeration value="FALSE"/>
				<xs:enumeration value="TRUE"/>
			</xs:restriction>
		</xs:simpleType>
		<xs:complexType name="T_DATE">
			<xs:simpleContent>
				<xs:extension base="ST_DATE">
					<xs:attribute name="OLD" type="ST_DATE" use="optional"/>
					<xs:attribute name="Type" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:string">
								<xs:enumeration value="DT"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
		<xs:simpleType name="ST_DATE">
			<xs:restriction base="xs:string">
				<xs:pattern value=""/>
				<xs:pattern value="[0-9]{{4}}[0-9]{{2}}[0-9]{{2}}[0-9]{{9}}"/>
				<xsl:comment>Datums-Format: YYYYMMTThhmmssmmm</xsl:comment>
			</xs:restriction>
		</xs:simpleType>
	</xsl:template>
	<!--=======================================================================-->
	<xsl:template match="Tab" mode="T">
		<xs:complexType>
			<xsl:attribute name="name">
				<xsl:text>T_</xsl:text>
				<xsl:value-of select="@Name"/>
			</xsl:attribute>
			<xs:sequence minOccurs="0" maxOccurs="unbounded">
				<xs:element name="ROW">
					<xs:complexType>
						<xs:all>
							<xsl:apply-templates select="./Fld" mode="Elm"/>
						</xs:all>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt eine Feld-Element-Referenz -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="ref">
		<xs:element>
			<xsl:attribute name="ref">
				<xsl:value-of select="@Name"></xsl:value-of>
			</xsl:attribute>
		</xs:element>
	</xsl:template>
	<xsl:template match="Tab" mode="ref">
		<xs:element>
			<xsl:attribute name="ref">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"/>
				<xsl:text>_DE</xsl:text>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="ref">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_FR</xsl:text>
			</xsl:attribute>
		</xs:element>
		<xs:element>
			<xsl:attribute name="ref">
				<xsl:value-of select="@Name"/>
				<xsl:value-of select="/Form/@Name"></xsl:value-of>
				<xsl:text>_IT</xsl:text>
			</xsl:attribute>
		</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Leer-Template, tut gar nichts -->
	<!--=======================================================================-->
	<xsl:template match="@*|node()"/>
</xsl:stylesheet>