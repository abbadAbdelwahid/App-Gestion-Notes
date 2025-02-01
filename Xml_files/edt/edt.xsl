<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
    version="2"
    >


    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="main"
                    page-height="210mm"
                    page-width="297mm"
                    margin-top="0mm"
                    margin-bottom="5mm"
                    margin-left="5mm"
                    margin-right="5mm">
                    <fo:region-body margin-top="0mm" />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="main">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block span="all" font-family="sans-serif" font-size="2em" font-weight="bold" padding-before="0.3em" padding-after="0.3em" space-before="1em" space-after="1em" space-before.conditionality="retain" space-after.conditionality="retain"  hyphenate="false" line-height-shift-adjustment="disregard-shifts">
                        <fo:block font-family="Lato" font-size="22pt" font-weight="regular"  text-align="center" padding="8px">
                            Emploi Du Temps  (<xsl:value-of select="semaine/lundi/@date"/>/<xsl:value-of select="semaine/@annee"/> - <xsl:value-of select="semaine/samedi/@date"/>/<xsl:value-of select="semaine/@annee"/>)
                        </fo:block>
                    </fo:block>

                <fo:block>
                    <fo:table text-align="center" text-transform="uppercase">
                        <fo:table-column column-number="1" column-width="12mm" border-style="solid" border-width="0.5mm"></fo:table-column>
                        <fo:table-column column-number="2" column-width="auto" border-style="solid" border-width="0.5mm"></fo:table-column>
                        <fo:table-body>
                         <fo:table-row >
                          <fo:table-cell  background-color="#c8c8c8">
                            <fo:block>
                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center">
                                <fo:table-body>
                                                    <fo:table-row height="12mm">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                08:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                08:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                09:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                09:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                10:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                10:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                11:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                11:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                12:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                12:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                13:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                13:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                14:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                14:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                15:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                15:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                16:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                16:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                17:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                17:30
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="6mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                                18:00
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    <fo:table-row height="3mm">
                                                        <fo:table-cell>
                                                            <fo:block font-size="0.7em">
                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                          </fo:block>
                        </fo:table-cell>
                          <fo:table-cell >
                            <fo:block>

                          <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center">

                            <xsl:variable name="CM" select="concat('#','b5a9fc')"/>
                            <xsl:variable name="TD" select="concat('#','f9fca9')"/>
                            <xsl:variable name="TP" select="concat('#','a9fcad')"/>

                            <fo:table-body>
                                <fo:table-row display-align="center" text-align="center">
                                    <!--testing-->

                                    <!--duplication-->
                                    <fo:table-cell border-end-style="solid" border-end-width="0.5mm">
                                        <fo:block>
                                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center" overflow="hidden">
                                                <fo:table-body>
                                                    <fo:table-row height="15mm" background-color="#c8c8c8" >
                                                        <fo:table-cell >
                                                            <fo:block>
                                                                Lundi
                                                            </fo:block>
                                                            <fo:block>
                                                                <xsl:value-of select="semaine/lundi/@date" />
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                    <xsl:choose>
                                                    <xsl:when test="count(semaine/lundi/seance)=0">
                                                    <xsl:for-each select="(//*)[position()&lt;=42]">
                                                        <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                            <fo:table-cell >
                                                                <fo:block>

                                                                </fo:block>
                                                            </fo:table-cell>

                                                        </fo:table-row>

                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:for-each select="semaine/lundi/seance[1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -32" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>

                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>
                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >

                                                            <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>




                                                    <xsl:for-each select="semaine/lundi/seance[position()&gt;1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="pos" select="position()"/>
                                                    <xsl:variable name="hour0" select="substring(/semaine/lundi/seance[$pos]/@fin,1,2)"/>
                                                    <xsl:variable name="min0" select="substring(/semaine/lundi/seance[$pos]/@fin,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -(4*$hour0 + ($min0 div 15))" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >
                                                                <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <xsl:variable name="last_hour" select="substring(/semaine/lundi/seance[last()]/@fin,1,2)"/>
                                                    <xsl:variable name="last_min" select="substring(/semaine/lundi/seance[last()]/@fin,4,2)"/>
                                                    <xsl:variable name="last_empty" select="74 -(4*$last_hour + ($last_min div 15))" />


                                                    <xsl:for-each select="(//*)[position()&lt;=$last_empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>

                                                    </xsl:for-each>
                                                    </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-end-style="solid" border-end-width="0.5mm">
                                        <fo:block>
                                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center" overflow="hidden">
                                                <fo:table-body>
                                                    <fo:table-row height="15mm" background-color="#c8c8c8" >
                                                        <fo:table-cell >
                                                            <fo:block>
                                                                Mardi
                                                            </fo:block>
                                                            <fo:block>
                                                                <xsl:value-of select="semaine/mardi/@date" />
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                    <xsl:choose>
                                                    <xsl:when test="count(semaine/mardi/seance)=0">
                                                    <xsl:for-each select="(//*)[position()&lt;=42]">
                                                        <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                            <fo:table-cell >
                                                                <fo:block>

                                                                </fo:block>
                                                            </fo:table-cell>

                                                        </fo:table-row>

                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:for-each select="semaine/mardi/seance[1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -32" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>

                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>
                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >

                                                            <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>




                                                    <xsl:for-each select="semaine/mardi/seance[position()&gt;1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="pos" select="position()"/>
                                                    <xsl:variable name="hour0" select="substring(/semaine/mardi/seance[$pos]/@fin,1,2)"/>
                                                    <xsl:variable name="min0" select="substring(/semaine/mardi/seance[$pos]/@fin,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -(4*$hour0 + ($min0 div 15))" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >
                                                                <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <xsl:variable name="last_hour" select="substring(/semaine/mardi/seance[last()]/@fin,1,2)"/>
                                                    <xsl:variable name="last_min" select="substring(/semaine/mardi/seance[last()]/@fin,4,2)"/>
                                                    <xsl:variable name="last_empty" select="74 -(4*$last_hour + ($last_min div 15))" />


                                                    <xsl:for-each select="(//*)[position()&lt;=$last_empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>

                                                    </xsl:for-each>
                                                    </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-end-style="solid" border-end-width="0.5mm">
                                        <fo:block>
                                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center">
                                                <fo:table-body>
                                                    <fo:table-row height="15mm" background-color="#c8c8c8" >
                                                        <fo:table-cell >
                                                            <fo:block>
                                                                Mercredi
                                                            </fo:block>
                                                            <fo:block>
                                                                <xsl:value-of select="semaine/mercredi/@date" />
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                    <xsl:choose>
                                                    <xsl:when test="count(semaine/mercredi/seance)=0">
                                                    <xsl:for-each select="(//*)[position()&lt;=42]">
                                                        <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                            <fo:table-cell >
                                                                <fo:block>

                                                                </fo:block>
                                                            </fo:table-cell>

                                                        </fo:table-row>

                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:for-each select="semaine/mercredi/seance[1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -32" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>

                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>
                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >

                                                            <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>




                                                    <xsl:for-each select="semaine/mercredi/seance[position()&gt;1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="pos" select="position()"/>
                                                    <xsl:variable name="hour0" select="substring(/semaine/mercredi/seance[$pos]/@fin,1,2)"/>
                                                    <xsl:variable name="min0" select="substring(/semaine/mercredi/seance[$pos]/@fin,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -(4*$hour0 + ($min0 div 15))" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >
                                                                <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <xsl:variable name="last_hour" select="substring(/semaine/mercredi/seance[last()]/@fin,1,2)"/>
                                                    <xsl:variable name="last_min" select="substring(/semaine/mercredi/seance[last()]/@fin,4,2)"/>
                                                    <xsl:variable name="last_empty" select="74 -(4*$last_hour + ($last_min div 15))" />


                                                    <xsl:for-each select="(//*)[position()&lt;=$last_empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>

                                                    </xsl:for-each>
                                                    </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-end-style="solid" border-end-width="0.5mm">
                                        <fo:block>
                                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center">
                                                <fo:table-body>
                                                    <fo:table-row height="15mm" background-color="#c8c8c8" >
                                                        <fo:table-cell >
                                                            <fo:block>
                                                                Jeudi
                                                            </fo:block>
                                                            <fo:block>
                                                                <xsl:value-of select="semaine/jeudi/@date" />
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                    <xsl:choose>
                                                    <xsl:when test="count(semaine/jeudi/seance)=0">
                                                    <xsl:for-each select="(//*)[position()&lt;=42]">
                                                        <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                            <fo:table-cell >
                                                                <fo:block>

                                                                </fo:block>
                                                            </fo:table-cell>

                                                        </fo:table-row>

                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:for-each select="semaine/jeudi/seance[1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -32" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>

                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>
                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >

                                                            <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>




                                                    <xsl:for-each select="semaine/jeudi/seance[position()&gt;1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="pos" select="position()"/>
                                                    <xsl:variable name="hour0" select="substring(/semaine/jeudi/seance[$pos]/@fin,1,2)"/>
                                                    <xsl:variable name="min0" select="substring(/semaine/jeudi/seance[$pos]/@fin,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -(4*$hour0 + ($min0 div 15))" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >
                                                                <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <xsl:variable name="last_hour" select="substring(/semaine/jeudi/seance[last()]/@fin,1,2)"/>
                                                    <xsl:variable name="last_min" select="substring(/semaine/jeudi/seance[last()]/@fin,4,2)"/>
                                                    <xsl:variable name="last_empty" select="74 -(4*$last_hour + ($last_min div 15))" />


                                                    <xsl:for-each select="(//*)[position()&lt;=$last_empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>

                                                    </xsl:for-each>
                                                    </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-end-style="solid" border-end-width="0.5mm">
                                        <fo:block>
                                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center">
                                                <fo:table-body>
                                                    <fo:table-row height="15mm" background-color="#c8c8c8" >
                                                        <fo:table-cell >
                                                            <fo:block>
                                                                Vendredi
                                                            </fo:block>
                                                            <fo:block>
                                                                <xsl:value-of select="semaine/vendredi/@date" />
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                    <xsl:choose>
                                                    <xsl:when test="count(semaine/vendredi/seance)=0">
                                                    <xsl:for-each select="(//*)[position()&lt;=42]">
                                                        <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                            <fo:table-cell >
                                                                <fo:block>

                                                                </fo:block>
                                                            </fo:table-cell>

                                                        </fo:table-row>

                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:for-each select="semaine/vendredi/seance[1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -32" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>

                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>
                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >

                                                            <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>




                                                    <xsl:for-each select="semaine/vendredi/seance[position()&gt;1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="pos" select="position()"/>
                                                    <xsl:variable name="hour0" select="substring(/semaine/vendredi/seance[$pos]/@fin,1,2)"/>
                                                    <xsl:variable name="min0" select="substring(/semaine/vendredi/seance[$pos]/@fin,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -(4*$hour0 + ($min0 div 15))" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >
                                                                <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <xsl:variable name="last_hour" select="substring(/semaine/vendredi/seance[last()]/@fin,1,2)"/>
                                                    <xsl:variable name="last_min" select="substring(/semaine/vendredi/seance[last()]/@fin,4,2)"/>
                                                    <xsl:variable name="last_empty" select="74 -(4*$last_hour + ($last_min div 15))" />


                                                    <xsl:for-each select="(//*)[position()&lt;=$last_empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>

                                                    </xsl:for-each>
                                                    </xsl:otherwise>
                                                    </xsl:choose>
                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell >
                                        <fo:block>
                                            <fo:table inline-progression-dimension="auto" table-layout="auto" text-align="center" display-align="center">
                                                <fo:table-body>
                                                    <fo:table-row height="15mm" background-color="#c8c8c8" >
                                                        <fo:table-cell >
                                                            <fo:block>
                                                                Samedi
                                                            </fo:block>
                                                            <fo:block>
                                                                <xsl:value-of select="semaine/samedi/@date" />
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>

                                                    <xsl:choose>
                                                    <xsl:when test="count(semaine/samedi/seance)=0">
                                                    <xsl:for-each select="(//*)[position()&lt;=42]">
                                                        <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                            <fo:table-cell >
                                                                <fo:block>

                                                                </fo:block>
                                                            </fo:table-cell>

                                                        </fo:table-row>

                                                        </xsl:for-each>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:for-each select="semaine/samedi/seance[1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -32" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>

                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>
                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >

                                                            <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>




                                                    <xsl:for-each select="semaine/samedi/seance[position()&gt;1]">
                                                    <xsl:variable name="hour" select="substring(@debut,1,2)"/>
                                                    <xsl:variable name="min" select="substring(@debut,4,2)"/>
                                                    <xsl:variable name="pos" select="position()"/>
                                                    <xsl:variable name="hour0" select="substring(/semaine/samedi/seance[$pos]/@fin,1,2)"/>
                                                    <xsl:variable name="min0" select="substring(/semaine/samedi/seance[$pos]/@fin,4,2)"/>
                                                    <xsl:variable name="empty" select="4*$hour + ($min div 15) -(4*$hour0 + ($min0 div 15))" />
                                                    <xsl:variable name="color">
                                                        <xsl:choose>
                                                        <xsl:when test="@type = 'CM'">
                                                            <xsl:value-of select="$CM"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TD'">
                                                            <xsl:value-of select="$TD"/>
                                                        </xsl:when>
                                                        <xsl:when test="@type = 'TP'">
                                                            <xsl:value-of select="$TP"/>
                                                        </xsl:when>
                                                        <xsl:otherwise></xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:variable>
                                                    <xsl:for-each select="(//*)[position()&lt;=$empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <fo:table-row height="17.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block margin="0.1mm" border="0.3mm solid"  fox:border-radius="5pt 5pt" >
                                                                <fo:block font-size="2.2mm" background-color="{$color}" fox:border-radius="5pt 5pt" overflow="hidden" border="0.2mm solid">
                                                                    <xsl:value-of select="@type" /> - <xsl:value-of select="@debut" /> - <xsl:value-of select="@fin" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1mm" font-size="2.2mm" font-weight="bold" margin-top="4mm" margin-bottom="1mm" wrap-option="no-wrap" overflow="hidden">
                                                                        <xsl:value-of select="module" />
                                                                    </fo:block >
                                                                    <fo:block line-height="1.5mm" font-size="2.2mm">
                                                                        <xsl:value-of select="Professeur" />
                                                                    </fo:block>
                                                                    <fo:block font-size="2.2mm" margin-bottom="4mm">
                                                                        <xsl:value-of select="salle" />
                                                                    </fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>
                                                    </xsl:for-each>


                                                    <xsl:variable name="last_hour" select="substring(/semaine/samedi/seance[last()]/@fin,1,2)"/>
                                                    <xsl:variable name="last_min" select="substring(/semaine/samedi/seance[last()]/@fin,4,2)"/>
                                                    <xsl:variable name="last_empty" select="74 -(4*$last_hour + ($last_min div 15))" />


                                                    <xsl:for-each select="(//*)[position()&lt;=$last_empty]">
                                                    <fo:table-row height="2.8mm" border-before-style="solid" border-before-width="0.2mm" border-before-color="#c8c8c8">
                                                        <fo:table-cell >
                                                            <fo:block>

                                                            </fo:block>
                                                        </fo:table-cell>

                                                    </fo:table-row>

                                                    </xsl:for-each>
                                                    </xsl:otherwise>
                                                    </xsl:choose>


                                                </fo:table-body>
                                            </fo:table>
                                        </fo:block>
                                    </fo:table-cell>

                                </fo:table-row>

                            </fo:table-body>
                        </fo:table>
                          </fo:block></fo:table-cell>
                         </fo:table-row>

                        </fo:table-body>
                       </fo:table>


                    </fo:block>
                    <fo:block text-align="center" padding-left="3.5mm" padding-top="1mm">
                                            <fo:external-graphic
                                                content-height="scale-to-fit"
                                                content-width="scale-to-fit"
                                                scaling="non-uniform"
                                                src="edt_footer.png">
                                            </fo:external-graphic>
                                        </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>