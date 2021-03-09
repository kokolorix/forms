<?xml version="1.0" encoding="iso-8859-1"?>
<?altova_samplexml SINA18.xml?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<!--=======================================================================-->
	<!-- Main-Template -->
	<!--=======================================================================-->
	<xsl:template match="/">
		<xs:schema>
			<xs:element name="DATAPACKET">
				<xs:complexType>
					<xs:sequence>
						<xs:element ref="ROW"/>
						<xs:element ref="PGM_INFO"/>
					</xs:sequence>
					<xs:attribute name="Version" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:decimal">
								<xs:enumeration value="1"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
				</xs:complexType>
			</xs:element>
			<xs:element name="ROW" type="RowT"/>
			<xs:element name="PGM_INFO">
				<xs:complexType>
					<xs:attribute name="FileVersion" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:string">
								<xs:enumeration value="9.0.24.10060"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
					<xs:attribute name="DatenbankAnwender" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:byte">
								<xs:enumeration value="1"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
					<xs:attribute name="DatenbankAnwenderDescr" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:string">
								<xs:enumeration value="ElektroForm Installateur"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
					<xs:attribute name="FormAnwender" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:byte">
								<xs:enumeration value="1"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
					<xs:attribute name="FormAnwenderDescr" use="required">
						<xs:simpleType>
							<xs:restriction base="xs:string">
								<xs:enumeration value="Installateur"/>
							</xs:restriction>
						</xs:simpleType>
					</xs:attribute>
				</xs:complexType>
			</xs:element>
			<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="Elm"></xsl:apply-templates>
			<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="ST"></xsl:apply-templates>			
			<!--=======================================================================-->
			<xs:complexType name="RowT">
				<xs:all>
					<xsl:apply-templates select="/Form/DataDic/Tab/Fld" mode="ref"></xsl:apply-templates>
				</xs:all>
			</xs:complexType>
			<!--=======================================================================-->			
		</xs:schema>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt ein Feld-Element -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="Elm">
	<xs:element>
		<xsl:attribute name="name">
			<xsl:value-of select="@Name"></xsl:value-of>
		</xsl:attribute>
		<xs:simpleContent>
			<xs:extension>
				<xsl:attribute name="base">
					<xsl:text>ST_</xsl:text>
					<xsl:value-of select="@Name"></xsl:value-of>
				</xsl:attribute>
			</xs:extension>
		</xs:simpleContent>
	</xs:element>
	</xsl:template>
	<!--=======================================================================-->
	<!-- Fld-Template, erstellt einen Feld-Typ -->
	<!--=======================================================================-->
	<xsl:template match="Fld" mode="ST">
		<xs:simpleType>
			<xsl:attribute name="name">
				<xsl:text>ST_</xsl:text>
				<xsl:value-of select="@Name"></xsl:value-of>
			</xsl:attribute>
			<xs:restriction base="xs:int">
			<xsl:attribute name="base">
				<xsl:choose>
					<xsl:when test="@Type='INT'"><xsl:text>xs:int</xsl:text></xsl:when>
				<xsl:otherwise><xsl:text>xs:string</xsl:text></xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			</xs:restriction>
		</xs:simpleType>
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
	<!--=======================================================================-->
	<!-- Leer-Template, tut gar nichts -->
	<!--=======================================================================-->
	<xsl:template match="@*|node()"/>
</xsl:stylesheet>
<!--
		<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
			<xs:element name="DATAPACKET"> 
		</xs:schema>

    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>

-->
