<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns1="http://www.trendmicro.com/ESB/schemas/MDM/SFDC/Customer"  xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:ns5="http://www.trendmicro.com/ESB/schemas/MDM/Rallying/Partner" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
 <xsl:template match="/">
    <xsl:apply-templates select="/ns0:SMF" />
  </xsl:template>
  <xsl:template match="/ns0:SMF">
  <ns0:SMF>
    <ns0:SMFHeader>
        <ns4:MessageKey>
            <xsl:value-of select="ns0:SMFHeader/ns4:MessageKey"/>
        </ns4:MessageKey>
		<ns4:ServiceName>
			<xsl:value-of select="&quot;UpdateSfCust&quot;"/>
		</ns4:ServiceName>
        <ns4:ServiceVersion>
            <xsl:value-of select="&quot;V1.0&quot;"/>
        </ns4:ServiceVersion>
        <ns4:SourceID>
            <xsl:value-of select="ns0:SMFHeader/ns4:SourceID"/>
        </ns4:SourceID>
        <xsl:if test="ns0:SMFHeader/ns4:SourceIP">
            <ns4:SourceIP>
                <xsl:value-of select="ns0:SMFHeader/ns4:SourceIP"/>
            </ns4:SourceIP>
        </xsl:if>
        <xsl:if test="ns0:SMFHeader/ns4:RqTimestamp">
            <ns4:RqTimestamp>
                <xsl:value-of select="ns0:SMFHeader/ns4:RqTimestamp"/>
            </ns4:RqTimestamp>
        </xsl:if>
        <xsl:if test="ns0:SMFHeader/ns4:RsTimestamp">
            <ns4:RsTimestamp>
                <xsl:value-of select="ns0:SMFHeader/ns4:RsTimestamp"/>
            </ns4:RsTimestamp>
        </xsl:if>
    </ns0:SMFHeader>
    <ns0:SMFBody>
		<ns0:SFDC>
			<xsl:for-each select="ns0:SMFBody/ns0:SFDC/ns0:Contact">
				<ns0:Contact>
					<ns1:MdmPartnerId>
						<xsl:value-of select="ns1:MdmPartnerId"/>
					</ns1:MdmPartnerId>
					<xsl:if test="ns1:MdmContactId">
						<ns1:MdmContactId>
							<xsl:value-of select="ns1:MdmContactId"/>
						</ns1:MdmContactId>
					</xsl:if>
					<xsl:if test="ns1:MdmLocationId">
						<ns1:MdmLocationId>
							<xsl:value-of select="ns1:MdmLocationId"/>
						</ns1:MdmLocationId>
					</xsl:if>
					<xsl:if test="ns1:SfdcContactId">
						<ns1:SfdcContactId>
							<xsl:value-of select="ns1:SfdcContactId"/>
						</ns1:SfdcContactId>
					</xsl:if>
					<ns1:Salutation>
						<xsl:value-of select="ns1:Salutation"/>
					</ns1:Salutation>
					<ns1:firstName>
						<xsl:value-of select="ns1:firstName"/>
					</ns1:firstName>
					<ns1:lastName>
						<xsl:value-of select="ns1:lastName"/>
					</ns1:lastName>
					<ns1:sfdcPartnerId>
						<xsl:value-of select="ns1:sfdcPartnerId"/>
					</ns1:sfdcPartnerId>
					<xsl:if test="ns1:title">
						<ns1:title>
							<xsl:value-of select="ns1:title"/>
						</ns1:title>
					</xsl:if>
					<xsl:if test="ns1:jobFunction">
						<ns1:jobFunction>
							<xsl:value-of select="ns1:jobFunction"/>
						</ns1:jobFunction>
					</xsl:if>
					<xsl:if test="ns1:language">
						<ns1:language>
							<xsl:value-of select="ns1:language"/>
						</ns1:language>
					</xsl:if>
					<xsl:if test="ns1:sfdcLocationId">
						<ns1:sfdcLocationId>
							<xsl:value-of select="ns1:sfdcLocationId"/>
						</ns1:sfdcLocationId>
					</xsl:if>
					<ns1:DirectLine>
						<xsl:value-of select="ns1:DirectLine"/>
					</ns1:DirectLine>
					<xsl:if test="ns1:mobile">
						<ns1:mobile>
							<xsl:value-of select="ns1:mobile"/>
						</ns1:mobile>
					</xsl:if>
					<ns1:email>
						<xsl:value-of select="ns1:email"/>
					</ns1:email>
					<xsl:if test="ns1:personID">
						<ns1:personID>
							<xsl:copy-of select="ns1:personID/@xsi:nil"/>
							<xsl:value-of select="ns1:personID"/>
						</ns1:personID>
					</xsl:if>
					<xsl:if test="ns1:primaryContact">
						<ns1:primaryContact>
							<xsl:copy-of select="ns1:primaryContact/@xsi:nil"/>
							<xsl:value-of select="ns1:primaryContact"/>
						</ns1:primaryContact>
					</xsl:if>
					<xsl:if test="ns1:AgreeTermsAndConditions">
						<ns1:AgreeTermsAndConditions>
							<xsl:value-of select="ns1:AgreeTermsAndConditions"/>
						</ns1:AgreeTermsAndConditions>
					</xsl:if>
					<xsl:if test="ns1:active">
						<ns1:active>
							<xsl:value-of select="ns1:active"/>
						</ns1:active>
					</xsl:if>
					<xsl:if test="ns1:areaOfInterest">
						<ns1:areaOfInterest>
							<xsl:value-of select="ns1:areaOfInterest"/>
						</ns1:areaOfInterest>
					</xsl:if>
					<xsl:if test="ns1:otherTrendProgrammers">
						<ns1:otherTrendProgrammers>
							<xsl:value-of select="ns1:otherTrendProgrammers"/>
						</ns1:otherTrendProgrammers>
					</xsl:if>
					<xsl:if test="ns1:preferredMethodOfContact">
						<ns1:preferredMethodOfContact>
							<xsl:value-of select="ns1:preferredMethodOfContact"/>
						</ns1:preferredMethodOfContact>
					</xsl:if>
					<xsl:if test="ns1:ePPChannel">
						<ns1:ePPChannel>
							<xsl:value-of select="ns1:ePPChannel"/>
						</ns1:ePPChannel>
					</xsl:if>
					<xsl:if test="ns1:ePPOtherChannel">
						<ns1:ePPOtherChannel>
							<xsl:value-of select="ns1:ePPOtherChannel"/>
						</ns1:ePPOtherChannel>
					</xsl:if>
					<xsl:if test="ns1:preferredAddress">
						<ns1:preferredAddress>
							<xsl:value-of select="ns1:preferredAddress"/>
						</ns1:preferredAddress>
					</xsl:if>
					<xsl:if test="ns1:preferredCity">
						<ns1:preferredCity>
							<xsl:value-of select="ns1:preferredCity"/>
						</ns1:preferredCity>
					</xsl:if>
					<xsl:if test="ns1:preferredZipCode">
						<ns1:preferredZipCode>
							<xsl:value-of select="ns1:preferredZipCode"/>
						</ns1:preferredZipCode>
					</xsl:if>
					<xsl:if test="ns1:preferredCountry">
						<ns1:preferredCountry>
							<xsl:value-of select="ns1:preferredCountry"/>
						</ns1:preferredCountry>
					</xsl:if>
					<xsl:if test="ns1:preferredCountyRegion">
						<ns1:preferredCountyRegion>
							<xsl:value-of select="ns1:preferredCountyRegion"/>
						</ns1:preferredCountyRegion>
					</xsl:if>
					<xsl:if test="ns1:gCCTracking">
						<ns1:gCCTracking>
							<xsl:copy-of select="ns1:gCCTracking/@xsi:nil"/>
							<xsl:value-of select="ns1:gCCTracking"/>
						</ns1:gCCTracking>
					</xsl:if>
					<xsl:if test="ns1:recordType">
						<ns1:recordType>
							<xsl:value-of select="ns1:recordType"/>
						</ns1:recordType>
					</xsl:if>
					<xsl:if test="ns1:MergedToSfdcContactId">
						<ns1:MergedToSfdcContactId>
							<xsl:value-of select="ns1:MergedToSfdcContactId"/>
						</ns1:MergedToSfdcContactId>
					</xsl:if>
				</ns0:Contact>
			</xsl:for-each>
		</ns0:SFDC>
    </ns0:SMFBody>
</ns0:SMF>
</xsl:template>
</xsl:stylesheet>