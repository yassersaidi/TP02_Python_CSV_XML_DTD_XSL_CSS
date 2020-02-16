<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTDXHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <body>
                <h1 align="center">Yasser</h1>
                <h2>La liste des personnes</h2>


                <h3>Question 1: Peut-on modifier le  fichier XSL pour afficher que le  nom, le  prénom, et la  ville? </h3>
                <xsl:for-each select="annuaire/personne">
                    <div style="border:1px solid #000;margin:5px 0">
                        <h3>
                            <xsl:value-of select="identite/nom" />
                            <xsl:value-of select="identite/prenom" />
                        </h3>
                        <p>
                            <xsl:value-of select="identite/adresse" />
                        </p>
                        <hr />
                    </div>
                </xsl:for-each>
                <h3>Question 2: Peut-on modifier le  fichier XSL pour afficher le  prénom avant le  nom?</h3>
                <xsl:for-each select="annuaire/personne">
                    <div style="border:1px solid #000;margin:5px 0">
                        <h3>
                            <xsl:value-of select="identite/prenom" />
                            <xsl:value-of select="identite/nom" />
                        </h3>
                        <p>
                            <xsl:value-of select="identite/adresse" />
                        </p>
                        <hr />
                    </div>
                </xsl:for-each>
                <h3>Question 3:Modifier le  code pour afficher chaque personne(voire TP02 pdf)</h3>
                <xsl:for-each select="annuaire/personne">
                    <div style="border:1px solid #000;margin:5px 0">
                        <p>
                            <span style="font-weight:bold">
                                        Nom:
                                    </span>
                            <span>
                                <xsl:value-of select="identite/nom" />
                            </span>
                        </p>
                        <p>
                            <span style="font-weight:bold">
                                        Prenom:
                                    </span>
                            <span>
                                <xsl:value-of select="identite/prenom" />
                            </span>
                        </p>
                        <p>
                            <span style="font-weight:bold">
                                        Rue:
                                    </span>
                            <span>
                                <xsl:value-of select="identite/adresse/rue" />
                            </span>
                        </p>
                        <p>
                            <span style="font-weight:bold">
                                        Ville:
                                    </span>
                            <span>
                                <xsl:value-of select="identite/adresse/ville" />
                            </span>
                        </p>
                        <p>
                            <span style="font-weight:bold">
                                        Telephone:
                                    </span>
                            <span>
                                <xsl:value-of select="identite/adresse/tel" />
                            </span>
                        </p>
                    </div>
                </xsl:for-each>
                <h3>Question 4:Modifier le  code pour afficher une table qui contient la  liste des personnes(voire TP02 pdf)</h3>
                    <div style="border:1px solid #000;margin:5px 0">
                        <table border="1">
                            <thead>
                                <tr>
                                    <td>Nom</td>
                                    <td>Prenom</td>
                                    <td>Addresse</td>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="annuaire/personne">
                                    <tr>
                                        <td><xsl:value-of select="identite/nom"/></td>
                                        <td><xsl:value-of select="identite/prenom"/></td>
                                        <td><xsl:value-of select="identite/adresse"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    <h3>Question 5:Modifier la ligne .. (voire TP02 pdf)</h3>
                    <xsl:for-each select="annuaire/personne[identite/adresse/ville='Bouira']">
                    <div style="border:1px solid #000;margin:5px 0">
                        <h3>
                            <xsl:value-of select="identite/nom" />
                            <xsl:value-of select="identite/prenom" />
                        </h3>
                        <p>
                            <xsl:value-of select="identite/adresse" />
                        </p>
                        <hr />
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>