# Repo: infra
- URL: https://github.com/perstarkse/infra
- Stars (at snapshot): 7
- Last-synced: 2025-11-15
- Tags: nix, nixos, homelab, clan, dendritic, backups, routing, vpn, secrets, monitoring

## Summary
Infra är en deklarativ homelab-/infra-repo som hanterar router, server och arbetsstationer med Nix flakes. Orkestreringen sköts via Clan, med automatiserad hemlighetshantering, backup-flöden och nätverks-/routerkonfiguration. Konfigurationen följer Dendritic-mönstret där varje fil är en flake-parts-modul, vilket ger hög grad av återanvändbarhet och tydlig struktur.

## Tech stack
- OS/konfiguration: NixOS, Nix flakes, flake-parts, Dendritic-mönstret
- Orkestrering: Clan (maskinhantering, hemligheter, deploy)
- Nätverk: Router-modul (LAN bridge, DHCP, DNS via Unbound, WireGuard, nginx reverse proxy, monitoring)
- Backuper: restic mot B2/S3 med Nix-deklarativ konfiguration
- Övervakning: Prometheus, exporters, ev. Grafana, Netdata, ntopng
- Tjänster: t.ex. Vaultwarden, OpenWebUI, SurrealDB, Minne m.fl. på servern

## Responsibilities & scope
- Designat övergripande Nix-struktur enligt Dendritic (flake-parts-moduler) för både system- och användarkonfiguration.
- Skapat återanvändbara Nix-moduler för router, backup, hemlighetshantering (inkl. vars-helper) och maskinspecifik config.
- Modellering av flera maskiner (router, server, workstation, staging) med gemensamma moduler och deklarativa roller.
- Definierat backup-strategi med restic + B2/S3, inklusive scheman, inkluderings-/exkluderingsregler och “restore mode”.

## Data / analys / säkerhet
- Clan-baserad hemlighetshantering med vars-helper:
  - Discovery av hemligheter via taggar.
  - ACL-baserad åtkomst för systemd-tjänster och användare.
  - Exponering av hemligheter som filer i användarmiljö (t.ex. SSH-nycklar, age-keys).
  - Wrappning av binärer med env-vars baserat på hemligheter (t.ex. OpenAI/ AWS-nycklar).
- Router-modul som definierar VPN (WireGuard), DNS, TLS/ACME (inkl. DNS-01), samt monitoring och accesskontroll (t.ex. Cloudflare-only).
- Backup-modul som standardiserar hur viktiga tjänster (Minne, Vaultwarden, SurrealDB m.fl.) säkerhetskopieras och kan återställas.

## Evidence / ground-truth claims
- Hanterar flera maskiner (router, server, workstation, staging) via Nix flakes och Clan.
- Innehåller modul för router med LAN bridge, DHCP, Unbound DNS, WireGuard, nginx reverse proxy och monitoring.
- Innehåller modul för deklarativa restic-backuper till B2/S3 inklusive restore-läge.
- Använder vars-helper för att deklarativt hantera hemligheter, ACL:er och exponering till tjänster/användare.
- Driver tjänster som Minne, Vaultwarden och SurrealDB via Nix-moduler i serverkonfigurationen.

## CV usage
- **Tech-CV (infra/platform)**  
  - “Designade och implementerade en Nix-baserad homelab/infra för router, server och arbetsstationer med Clan-baserad orkestrering och återanvändbara flake-parts-moduler.”  
  - “Byggde modulär router-lösning (LAN, DHCP, DNS, WireGuard, nginx, monitoring) och deklarativa backuper med restic till B2/S3.”

- **Data/ops-CV**  
  - “Standardiserade backup- och återställningsflöden för datatjänster (t.ex. Minne, Vaultwarden, SurrealDB) med restic och Nix-moduler.”  
  - “Konfigurerade hemlighetshantering och åtkomstkontroll (Clan + vars-helper) för API-nycklar och känsliga konfigurationsvärden.”

- **Ledarskap/ägarskap**  
  - “Etablerade en deklarativ infrastrukturplattform med gemensamma mönster (Dendritic) och moduler, vilket förenklar drift och vidareutveckling.”  
  - “Dokumenterade router-, backup- och hemlighetsmoduler så att de kan återanvändas och anpassas över flera maskiner och tjänster.”

