<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>XSL StyleSheet</h2>
                <h3>Q1: Classer les étudiants par la  moyenne générale.</h3>
                <table border="1">
                    <thead>
                        <tr align="center" bgcolor="#eee">
                            <td style="padding:5px">Nom</td>
                            <td style="padding:5px">Prenom</td>
                            <td style="padding:5px">Moyenne</td>
                        </tr>
                    </thead>
                    <xsl:for-each select="students/student">
                        <xsl:sort select="moyenne" data-type="number" order="descending" />
                        <tr>
                            <td style="padding:5px">
                                <xsl:value-of select="nom" />
                            </td>
                            <td style="padding: 5px">
                                <xsl:value-of select="prenom" />
                            </td>
                            <td style="padding: 5px">
                                <xsl:value-of select="moyenne" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Q2 &amp; Q3: Calculer résultat de l’année à partir de la  moyenne générale &amp; Mettre en évidence le  résultat de l’année.</h3>
                <xsl:variable name="student_count" select="count(students/student)"></xsl:variable>
                <xsl:text>Resultat de l'annee est : </xsl:text>
                <xsl:value-of select="format-number(sum(//moyenne) div $student_count,'#.00')" />
                <h3>Q4: Extraire les statistiques suivantes :</h3>
                    
                    <xsl:for-each select="students/student">
                        <xsl:sort select="moyenne" data-type="number" order="descending" />
                        <xsl:if test="position()=1">
                            <span style="font-weight:bold">La Meilleur : </span>
                            <xsl:value-of select="nom" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="prenom" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="moyenne" />
                            <br />
                            <br />
                        </xsl:if>
                        
                        <xsl:if test="position()=$student_count">
                            <span style="font-weight:bold">La Mauvaise : </span>
                            <xsl:value-of select="nom" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="prenom" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="moyenne" />
                            <br />
                            <br />
                        </xsl:if>
                    </xsl:for-each>
                    <span style="font-weight:bold"> Le nombre des étudiants : </span>
                    <xsl:value-of select="$student_count"></xsl:value-of>
                    
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>