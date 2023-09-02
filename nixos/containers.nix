{
 virtualisation.oci-containers.containers = {
    Jellyfin = {
      image = "ghcr.io/linuxserver/jellyfin:latest";
      ports = [ "8096:8096" ];
      environment = {
        PUID = "101009";
        PGID = "101009";
        TZ = "Pacific/Auckland";
      };
      volumes = [ "/Containers/Jellyfin/Config:/config:rw" ];
    };
    Pihole = {
      image = "docker.io/pihole/pihole:latest";
      ports = [ "53:53/tcp" "53:53/udp" "80:80/tcp" ];
      environment = {
        DNSMASQ_USER = "root";
        TZ = "Auckland/Pacific";
      };
      volumes = [ "/Containers/Pihole/Config:/etc/pihole/:rw" "/Containers/Pihole/dnsmasqd:/etc/dnsmasq.d:rw"];
    };
    Jackett = {
      image = "ghcr.io/linuxserver/jackett:latest";
      ports = [ "9117:9117" ];
      environment = {
        PUID = "101009";
        GUID = "101009";
        TZ = "Auckland/Pacific";
      };
      volumes = [ "/Containers/Jackett/Config:/config:rw" "/Containers/Jackett/Downloads:/downloads:rw" ];
    };
    Sonarr = {
      image = "ghcr.io/linuxserver/sonarr:latest";
      ports = [ "8989:8989" ];
      environment = {
        PUID = "101009";
        GUID = "101009";
        TZ = "Auckland/Pacific";
      };
      volumes = [ "/Containers/Sonarr/Config:/config:rw" "/Containers/Transmission/Downloads:/downloads:rw" "/Tank/Shares/Anime:/Anime" "/Tank/Shares/TV:/TV" "/Tank/Shares/Youtube:/Youtube" ];
    };
    Transmission = {
      image = "ghcr.io/linuxserver/transmission:latest";
      ports = [ "9091:9091" ];
      environment = {
        PUID = "101009";
        GUID = "101009";
        TZ = "Auckland/Pacific";        
      };
      volumes = [ "/Containers/Tansmission/Config:/config:rw" "/Containers/Transmission/Downloads:/downloads:rw" "/Containers/Tansmission/Watch:/watch:rw"];
    };
  };
}