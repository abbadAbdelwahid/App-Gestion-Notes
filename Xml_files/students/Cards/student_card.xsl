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
                    <xsl:apply-templates select="Student"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="Student">
        <fo:block border="1pt solid black" padding="10mm" text-align="center">

            <!-- Logos ENSA et Université -->
            <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="20%"/>
                <fo:table-column column-width="60%"/>
                <fo:table-column column-width="20%"/>

                <fo:table-body>
                    <fo:table-row>
                        <!-- Logo Université -->
                        <fo:table-cell>
                            <fo:block>
                                <fo:external-graphic src="universite_logo.png" content-width="40mm"/>
                            </fo:block>
                        </fo:table-cell>

                        <!-- Texte Université -->
                        <fo:table-cell text-align="center">
                            <fo:block font-size="14pt" font-weight="bold">Université Abdelmalek Essaâdi</fo:block>
                            <fo:block font-size="12pt">Ecole Nationale des Sciences Appliquées</fo:block>
                            <fo:block font-size="12pt">Tanger</fo:block>
                        </fo:table-cell>

                        <!-- Logo ENSA -->
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
            <fo:block font-size="16pt" font-weight="bold" space-before="5mm">CARTE D'ÉTUDIANT</fo:block>

            <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="40%"/>
                <fo:table-column column-width="60%"/>

                <fo:table-body>
                    <fo:table-row>
                        <!-- Photo de l'étudiant -->
                        <fo:table-cell>
                            <fo:block>
                                <xsl:choose>
                                    <xsl:when test="photo and photo != ''">
                                        <fo:external-graphic src="{photo}" content-width="40mm" content-height="50mm"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <fo:block font-size="10pt" color="red">Photo non disponible</fo:block>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:block>
                        </fo:table-cell>

                        <!-- Infos Étudiant -->
                        <fo:table-cell text-align="left">
                            <fo:block font-size="14pt">
                                <xsl:value-of select="LastName"/>
                            </fo:block>
                            <fo:block font-size="14pt">
                                <xsl:value-of select="FirstName"/>
                            </fo:block>
                            <fo:block font-size="12pt" font-weight="bold">
                                <xsl:value-of select="@CNE"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>

            <!-- Première Inscription -->
            <fo:block font-size="12pt" space-before="10mm">
                Première Inscription : <xsl:value-of select="FirstRegistration"/>
            </fo:block>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>
