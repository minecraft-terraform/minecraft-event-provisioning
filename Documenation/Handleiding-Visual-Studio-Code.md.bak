# Setup voor het Event


## Stap 1: Verbind met WiFi

Voor deze dag moet je computer natuurlijk verbonden zijn met WiFi. Je kunt vandaag gebruik maken van ons gasten-netwerk.

Netwerk: **TechnativeGuest**
Password: **J1cZtf9a4qvk1lteo4ul**

![](wifi-qr.png)

## Stap 2: Download bestandje en noteer pad
Je ontvangt van ons een mailtje met daarin een bestand als bijlage. Dit bestand heeft de name `creativexy` waarbij xy een volgnummer is. In deze handleiding wordt volgnummer **04** gebruikt. Dus het bestand heeft de naam `creative04`

Deze handleiding gaat er vanuit dat het bestand opgeslagen is in de **Downloads** map. Dit is de standaard map waar bestanden worden gedownload vanuit mail of vanaf het internet.

Noteer het **_volledige pad_** naar deze map nodig. Bijvoorbeeld `c:\users\deelnemer\downloads`.

Dit kun je opzoeken door:

* In de downloads van je browser rechts te klikken op het gedownloade bestand en dan te kiezen voor `Weergeven in verkenner`. Noteer het pad bovenaan in de balk van Windows Verkenner. (Bijvoorbeeld: **C:\Users\Deelnemer\Downloads**)

of

*  In Windows, druk de volgende toetsen tegelijk in: *WIN* + **r**. Er opent nu een ventster waarin je iets kunt typen. Type in: **%userprofile%** en klik op **Uitvoeren*. Een nieuw venster opent en in de balk bovenaan staat nu je Windows Gebruikers naam. Het pad dat je nu moet onthouden is **c:\users\gebruikersnaam\downloads**


## Stap 3: Installeer Visual Studio Code

Als je Visual Studio Code nog niet hebt geïnstalleerd, download en installeer het dan van de [officiële website](https://code.visualstudio.com/).

## Stap 4: Setup Visual Studio Code

Open Visual Studio Code op je eigen computer en voer de volgende stappen uit:

- Klik op het blauwe icoontje `><` links onderin beeld.
- Klik op SSH uit het lijstje dat nu bovenaan in het midden tevoorschijn komt.

![](images/output/blauw-vinkje.png)

Er wordt nu automatisch een een **extention** geïnstalleerd. Als dit is afgerond:

- Kies `+ Add New SSH Host`

![](images/add_ssh_host.png)

Je moet zo een bepaald commando invullen in het invoerveld. Maar voordat je dat doet:

1. Vervang **creative04** Door de naam van het bestandje dat je eerder gedownload hebt. **_Let op_**: Dit moet op twee plekken in het commando vervangen worden.
2. Vervang **c:\users\gebruiker\downloads** door het pad dat je in **Stap 2** hebt genoteerd.
3. Zorg dat elke backslash `\` dubbel wordt neergezet.

- Vul in het invoerveld het volgende commando:

```bash
ssh -i c:\\users\\gebruiker\\downloads\\creative04  -o StrictHostKeyChecking=no creative04@vscodeserver-0.creative.technative.dev
```
![](images/ssh_command.png)

- Druk op de **enter** toets.
- Kies voor `c:\users\gebruiker\.ssh\config`

![](images/ssh_config.png)

Je ziet nu een venter rechtsonder **Host added**

![](images/host_added.png)

Mooi! De setup is nu afgerond. Laten we verbinding maken met de SSH Host


## Stap 5: Verbind met SSH Host

Nu gaan we verbinding maken met de SSH Host
- Klik op het blauwe icoontje `><` links onderin beeld.
- Klik op `Connect to Host....`
- Klik op `vscodeserver-0.creative.technative.dev`

Er opent zich een nieuw venster en de verbinding wordt opgezet.

Links onderin beeld wordt het blauwe icoontje uitgebreid. In plaats van alleen het tekentje `><` staat er nu `>< SSHL vscodeserver-0.creative.technative.dev`

### Extra melding
Het kan zijn dat je een extra melding krijgt, midden bovenin je beeldscherm: **Select the platform of the remote host**.

Kies dan voor de optie **Linux**

![](images/linux.png)

## Stap 6: Configureer Visual Studio Code

Om het werken met de code wat gemakkelijker te maken, willen we Visual Studio Code wat configureren. Wij hebben dit voorbereid. Om dit te gebruiken moeten we nog een profiel aanmaken.

- Klik op het **configuratie** icoontje links onderin beeld
- Klik op **Profiles (Default)**. Er komt een lijstje met opties tevoorschijn.
- Klik op **Import Profile**
- 
![](images/profiles-1.png)

Midden bovenin verschijnt een invoerveld. Klik **Select File**

![](images/profiles-2.png)

- Vul in: `vscode-profile` en klik op **OK**

![](images/profiles-3.png)

Er verschijnt aan de linkerkant nu een lijst met allemaal vinkjes. Onderaan heb je twee opties.

- Klik op **Create Profile**

![](images/profiles-4.png)

Midden bovenin staat al ingevuld **vscode-terraform**
- Klik midden bovenin op **Create**

![](images/profiles-5.png)

Er wordt nu een nieuw profiel aangemaakt. Dit duurt even om te configureren. Als dit klaar is wordt gemeld dat Visual Studio Code opnieuw moet worden geladen.

![](images/profiles-6.png)

- Klik op **Reload**

![](images/profiles-7.png)

Het programma wordt opnieuw geladen en de verbinding naar de server wordt automatisch weer gemaakt.

## Stap 7: Klaar voor de start
Wij hebben alvast wat code voor je klaar gezet. Deze moet je alleen nog even openen in Visual Studio Code.

- Klik aan de linkerkant op de blauwe knop **Open Folder**

![](images/open_folder.png)

- Klik op **minecraft-terraform-main** midden bovenin het scherm

![](images/minecraft-terraform-main.png)

- Klik op **Ok**

Er komt nog een waarschuwing "Do you trust the authors of the files in this folder?"
- Klik op het vakje **Trust the authors of all files in the parent folder 'creative04'**, zodat er een vinkje komt te staan
- Klik op **Yes, I trust the authors**

![](images/trust.png)

Om straks de code te kunnen activeren hebben we een zogenaamde **Terminal** nodig.

- Klik bovenaan in het menu op **Terminal** (indien deze er niet staat, klik eerst op de ... 3 puntjes)
- Er verschijnen extra opties. Klik op **New Terminal**

![](images/new_terminal.png)

### YES; je bent er klaar voor!
Je hebt nu alle voorbereidingen gedaan.
Het scherm zou er nu ongeveer zo uit moeten zien

![](images/final_overview.png)

# HAPPY CODING