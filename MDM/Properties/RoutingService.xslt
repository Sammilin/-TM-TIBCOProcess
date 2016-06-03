<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:pfx2="http://www.trendmicro.com/ESB/FRS/schemas/routing" xmlns:pfx="http://www.trendmicro.com/ESB/FRS/schemas/SMF" xmlns:pd="http://xmlns.tibco.com/bw/process/2003">
  <xsl:template match="/pfx:SMF">
    <pfx2:RoutingTable>
        <xsl:if test="/pfx:SMF/pfx:SMFHeader/pfx:ServiceName = 'FAPrevention'">
            <pfx2:ServiceName>
                <pfx2:Destinaiton>
                    <xsl:attribute name="Target">
                        <xsl:value-of select="'Queue'"/>
                    </xsl:attribute>
                    <xsl:value-of select="'trend.esb.FRS.dillo.FAPrevention.Beta'"/>
                </pfx2:Destinaiton>
                <pfx2:Destinaiton>
                    <xsl:attribute name="Target">
                        <xsl:value-of select="'Topic'"/>
                    </xsl:attribute>
                    <xsl:value-of select="'trend.esb.FRS.dillo.Topic.FAPrevention.Beta'"/>
                </pfx2:Destinaiton>
            </pfx2:ServiceName>
        </xsl:if>
        <xsl:if test="/pfx:SMF/pfx:SMFHeader/pfx:ServiceName = 'FileSourcing'">
            <pfx2:ServiceName>
                <pfx2:Destinaiton>
                    <xsl:attribute name="Target">
                        <xsl:value-of select="'Queue'"/>
                    </xsl:attribute>
                    <xsl:value-of select="'trend.esb.FRS.FileSourcing.Beta'"/>
                </pfx2:Destinaiton>
            </pfx2:ServiceName>
        </xsl:if>
        <xsl:if test="/pfx:SMF/pfx:SMFHeader/pfx:ServiceName = 'FAPreventionResponse'">
            <pfx2:ServiceName>
                <pfx2:Destinaiton>
                    <xsl:attribute name="Target">
                        <xsl:value-of select="'Queue'"/>
                    </xsl:attribute>
                    <xsl:value-of select="'trend.esb.FRS.dillo.FAPrevention.Response'"/>
                </pfx2:Destinaiton>
            </pfx2:ServiceName>
        </xsl:if>
    </pfx2:RoutingTable>
  </xsl:template>
</xsl:stylesheet>