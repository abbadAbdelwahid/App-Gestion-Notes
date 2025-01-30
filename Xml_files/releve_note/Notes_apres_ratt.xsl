<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                    page-height="29.7cm" page-width="21cm"
                    margin-top="2cm" margin-bottom="2cm"
                    margin-left="2cm" margin-right="2cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="18pt" font-weight="bold"
                        text-align="center" space-after="10pt">
                        Relevé de Notes - GINF31
                    </fo:block>

                    <fo:block font-size="12pt" space-after="10pt">
                        <xsl:text>Module Code: </xsl:text>
                        <xsl:value-of select="/Notes/@module_code"/>
                    </fo:block>

                    <fo:table border="1pt solid black" width="100%">
                        <fo:table-column column-width="5cm"/>
                        <fo:table-column column-width="5cm"/>
                        <fo:table-column column-width="3cm"/>
                        <fo:table-column column-width="3cm"/>
                        <fo:table-body>
                            <!-- Table Header -->
                            <fo:table-row background-color="#CCCCCC">
                                <fo:table-cell><fo:block font-weight="bold">CNE</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block font-weight="bold">Nom Complet</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block font-weight="bold">Note</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block font-weight="bold">Résultat</fo:block></fo:table-cell>
                            </fo:table-row>

                            <!-- Student Data -->
                            <xsl:for-each select="/Notes/Students/Student">
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block><xsl:value-of select="CNE"/></fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="FirstName"/> <xsl:text> </xsl:text>
                                            <xsl:value-of select="LastName"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="ModuleNote"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@Result"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>

                            <!-- Average Row -->
                            <fo:table-row background-color="#EEEEEE">
                                <fo:table-cell number-columns-spanned="2">
                                    <fo:block font-weight="bold">Moyenne Générale</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>
                                        <xsl:value-of select="/Notes/Moyenne"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>-</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
