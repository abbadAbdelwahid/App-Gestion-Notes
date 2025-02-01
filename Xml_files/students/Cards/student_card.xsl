<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="card">
                    <fo:region-body margin="10mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="card">
                <fo:flow flow-name="xsl-region-body">

                    <!-- Vérification Extraction Étudiant -->
                    <fo:block font-size="14pt" font-weight="bold" color="red" text-align="center">
                        Vérification Extraction Étudiant :
                        <xsl:value-of select="Student/LastName"/>
                        <xsl:value-of select="Student/FirstName"/>
                    </fo:block>

                    <!-- Université et ENSA Logos -->
                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="20%"/>
                        <fo:table-column column-width="60%"/>
                        <fo:table-column column-width="20%"/>

                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block>
                                        <fo:external-graphic src="universite_logo.png" content-width="40mm"/>
                                    </fo:block>
                                </fo:table-cell>

                                <fo:table-cell text-align="center">
                                    <fo:block font-size="14pt" font-weight="bold">Université Abdelmalek Essaâdi</fo:block>
                                    <fo:block font-size="12pt">Ecole Nationale des Sciences Appliquées</fo:block>
                                    <fo:block font-size="12pt">Tanger</fo:block>
                                </fo:table-cell>

                                <fo:table-cell text-align="right">
                                    <fo:block>
                                        <fo:external-graphic src="ensa_logo.png" content-width="40mm"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>

                    <fo:block border-bottom="1pt solid black"/>

                    <!-- Titre -->
                    <fo:block font-size="16pt" font-weight="bold" text-align="center" space-before="5mm">
                        CARTE D'ÉTUDIANT
                    </fo:block>

                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="40%"/>
                        <fo:table-column column-width="60%"/>

                        <fo:table-body>
                            <fo:table-row>
                                <!-- Photo -->
                                <fo:table-cell>
                                    <fo:block>
                                        <xsl:if test="Student/photo != ''">
                                            <fo:external-graphic src="{Student/photo}" content-width="40mm" content-height="50mm"/>
                                        </xsl:if>
                                    </fo:block>
                                </fo:table-cell>

                                <!-- Infos Étudiant -->
                                <fo:table-cell text-align="left">
                                    <fo:block font-size="14pt">
                                        <xsl:value-of select="Student/LastName"/>
                                    </fo:block>
                                    <fo:block font-size="14pt">
                                        <xsl:value-of select="Student/FirstName"/>
                                    </fo:block>
                                    <fo:block font-size="12pt" font-weight="bold">
                                        <xsl:value-of select="Student/@CNE"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>

                    <!-- Première Inscription -->
                    <fo:block font-size="12pt" space-before="10mm" text-align="center">
                        Première Inscription : <xsl:value-of select="Student/FirstRegistration"/>
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
