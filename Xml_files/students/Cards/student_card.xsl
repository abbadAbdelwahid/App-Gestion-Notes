<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="card"
                    page-width="85mm" page-height="55mm"
                    margin="5mm">
                    <fo:region-body />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="card">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="Student"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="Student">
        <fo:block border="1pt solid black" padding="3mm" background-color="white" font-family="Arial" text-align="center">

            <!-- 🏛️ Logos ENSA et Université alignés en haut -->
            <fo:table table-layout="fixed" width="100%" space-after="3mm">
                <fo:table-column column-width="40%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-column column-width="40%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                            <fo:block>
                                <fo:external-graphic src="universite_logo.png" content-width="20mm"/>
                            </fo:block>
                        </fo:table-cell>

                        <fo:table-cell>
                            <fo:block></fo:block>
                        </fo:table-cell>

                        <fo:table-cell text-align="right">
                            <fo:block>
                                <fo:external-graphic src="ensa_logo.png" content-width="20mm"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>

            <!-- Titre de la carte -->
            <fo:block font-size="9pt" font-weight="bold" text-align="center" space-after="2mm">
                Université Abdelmalek Essaâdi<br/>
                École Nationale des Sciences Appliquées - Tanger
            </fo:block>
            <fo:block border-bottom="1pt solid #DD7D32" space-before="2mm"/>

            <fo:block font-size="11pt" font-weight="bold" text-align="center" space-before="2mm">
                CARTE D'ÉTUDIANT
            </fo:block>

            <!-- 📜 Infos Étudiant -->
            <fo:table table-layout="fixed" width="100%" space-before="3mm">
                <fo:table-column column-width="40%"/>
                <fo:table-column column-width="60%"/>
                <fo:table-body>
                    <fo:table-row>
                        <!-- 📷 Photo -->
                        <fo:table-cell>
                            <fo:block text-align="center">
                                <xsl:if test="photo != ''">
                                    <fo:external-graphic src="{photo}" content-width="25mm" content-height="30mm"/>
                                </xsl:if>
                            </fo:block>
                        </fo:table-cell>

                        <!-- Infos Étudiant -->
                        <fo:table-cell text-align="left">
                            <fo:block font-size="9pt" font-weight="bold">
                                <xsl:value-of select="LastName"/>
                            </fo:block>
                            <fo:block font-size="9pt">
                                <xsl:value-of select="FirstName"/>
                            </fo:block>
                            <fo:block font-size="8pt" font-weight="bold">
                                <xsl:text>CNE: </xsl:text><xsl:value-of select="CNE"/>
                            </fo:block>
                            <fo:block font-size="7pt" space-before="2mm">
                                📧 <xsl:value-of select="Email"/>
                            </fo:block>
                            <fo:block font-size="7pt">
                                📞 <xsl:value-of select="Phone"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>

        </fo:block>
    </xsl:template>
</xsl:stylesheet>
