<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns="http://www.trendmicro.com/ESB/schemas/MDM/EMEA_ERP/Customer" xmlns:ns0="http://www.trendmicro.com/ESB/schemas/SMF" xmlns:ns2="http://www.trendmicro.com/ESB/schemas/MDM/MDMServer" xmlns:ns4="http://www.trendmicro.com/ESB/schemas/Common" xmlns:ns5="http://www.trendmicro.com/ESB/schemas/MDM/Rallying/Partner" xmlns:tib="http://www.tibco.com/bw/xslt/custom-functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
					<xsl:value-of select="&quot;UpdateRalCust&quot;"/>
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
				<ns0:Rallying>
					<ns0:Partner>
						<xsl:if test="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:Id">
							<ns5:Id>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:Id"/>
							</ns5:Id>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address/@xsi:nil">
								<ns5:Address>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:Address"/>
								</ns5:Address>
							</xsl:when>
							<xsl:otherwise>
								<ns5:Address>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_address"/>
								</ns5:Address>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status/@xsi:nil">
								<ns5:BlockFlag>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:BlockFlag"/>
								</ns5:BlockFlag>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status)='0'&#xA;or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status)='1' or tib:trim(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_status)='Active'">
										<ns5:BlockFlag>
											<xsl:value-of select="&quot;N&quot;"/>
										</ns5:BlockFlag>
									</xsl:when>
									<xsl:otherwise>
										<ns5:BlockFlag>
											<xsl:value-of select="&quot;Y&quot;"/>
										</ns5:BlockFlag>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city/@xsi:nil">
								<ns5:City>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:City"/>
								</ns5:City>
							</xsl:when>
							<xsl:otherwise>
								<ns5:City>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:city"/>
								</ns5:City>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country/@xsi:nil">
								<ns5:Country>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:Country"/>
								</ns5:Country>
							</xsl:when>
							<xsl:otherwise>
								<ns5:Country>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:country"/>
								</ns5:Country>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor/@xsi:nil and ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer/@xsi:nil">
								<ns5:DistributorFlag>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:DistributorFlag"/>
								</ns5:DistributorFlag>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=&quot;true&quot; &#xA;or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_distributor=1&#xA;or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer=&quot;true&quot; &#xA;or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_directcustomer=1">
										<ns5:DistributorFlag>
											<xsl:value-of select="&quot;Y&quot;"/>
										</ns5:DistributorFlag>
									</xsl:when>
									<xsl:otherwise>
										<ns5:DistributorFlag>
											<xsl:value-of select="&quot;N&quot;"/>
										</ns5:DistributorFlag>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email/@xsi:nil">
								<ns5:Email>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:Email"/>
								</ns5:Email>
							</xsl:when>
							<xsl:otherwise>
								<ns5:Email>
									<xsl:value-of select="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:primary_email"/>
								</ns5:Email>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser/@xsi:nil">
								<ns5:EndCustomerFlag>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:EndCustomerFlag"/>
								</ns5:EndCustomerFlag>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser=&quot;true&quot; &#xA;or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_enduser=1">
										<ns5:EndCustomerFlag>
											<xsl:value-of select="&quot;Y&quot;"/>
										</ns5:EndCustomerFlag>
									</xsl:when>
									<xsl:otherwise>
										<ns5:EndCustomerFlag>
											<xsl:value-of select="&quot;N&quot;"/>
										</ns5:EndCustomerFlag>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<ns5:IntegrationSource>
							<xsl:value-of select="&quot;EMEA&quot;"/>
						</ns5:IntegrationSource>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name/@xsi:nil">
								<ns5:Name>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:Name"/>
								</ns5:Name>
							</xsl:when>
							<xsl:otherwise>
								<ns5:Name>
									<xsl:value-of select="concat(ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name,&quot; &quot;,ns0:SMFBody/ns0:MDM/ns0:Company/ns2:company_name_2)"/>
								</ns5:Name>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="tib:trim(ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:PartnerTier) !=&quot;&quot;">
								<ns5:PartnerTier>
									<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:PartnerTier"/>
								</ns5:PartnerTier>
							</xsl:when>
							<xsl:when test="tib:trim($SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PartnerTier) !=&quot;&quot;">
								<ns5:PartnerTier>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PartnerTier"/>
								</ns5:PartnerTier>
							</xsl:when>
							<xsl:otherwise>
								<ns5:PartnerTier>
									<xsl:value-of select="&quot; &quot;"/>
								</ns5:PartnerTier>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PartnerTierDescription">
							<ns5:PartnerTierDescription>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PartnerTierDescription"/>
							</ns5:PartnerTierDescription>
						</xsl:if>
						<xsl:if test="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PrimaryPartnerTierId">
							<ns5:PrimaryPartnerTierId>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PrimaryPartnerTierId"/>
							</ns5:PrimaryPartnerTierId>
						</xsl:if>
						<xsl:if test="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PrimaryPartnerTypeId">
							<ns5:PrimaryPartnerTypeId>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:PrimaryPartnerTypeId"/>
							</ns5:PrimaryPartnerTypeId>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller/@xsi:nil">
								<ns5:ResellerFlag>
									<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:ResellerFlag"/>
								</ns5:ResellerFlag>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller=&quot;true&quot; &#xA;or ns0:SMFBody/ns0:MDM/ns0:Company/ns2:is_reseller=1">
										<ns5:ResellerFlag>
											<xsl:value-of select="&quot;Y&quot;"/>
										</ns5:ResellerFlag>
									</xsl:when>
									<xsl:otherwise>
										<ns5:ResellerFlag>
											<xsl:value-of select="&quot;N&quot;"/>
										</ns5:ResellerFlag>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="exists($ExternalParam/Rebate)">
							<ns5:StandardDiscount>
								<xsl:value-of select="$ExternalParam/Rebate"/>
							</ns5:StandardDiscount>
						</xsl:if>
						<ns5:SyncDate>
							<xsl:value-of select="tib:format-dateTime(&quot;MM/dd/yyyy HH:mm:ss&quot;, tib:translate-timezone(current-dateTime(), 'UTC'))"/>
						</ns5:SyncDate>
						<ns5:NavisionId>
							<xsl:value-of select="tib:if-absent(ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:NAVID,$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:NavisionId)"/>
						</ns5:NavisionId>
						<xsl:if test="$SelectSourceCustomerData/root/Navision/ns:Customer/ns:SalesForceID">
							<ns5:SalesForceId>
								<xsl:value-of select="$SelectSourceCustomerData/root/Navision/ns:Customer/ns:SalesForceID"/>
							</ns5:SalesForceId>
						</xsl:if>
						<!--
						<xsl:if test="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:MDMId">
							<ns5:MDMId>
								<xsl:value-of select="$SelectSourceCustomerData/ns0:Rallying/ns0:Partner/ns5:MDMId"/>
							</ns5:MDMId>
						</xsl:if>-->
						<xsl:if test="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MDMCustID">
							<ns5:MDMId>
								<xsl:value-of select="ns0:SMFBody/ns0:Navision/ns0:Customer/ns:Customer/ns:MDMCustID"/>
							</ns5:MDMId>
						</xsl:if>
					</ns0:Partner>
				</ns0:Rallying>
			</ns0:SMFBody>
		</ns0:SMF>
	</xsl:template>
</xsl:stylesheet>