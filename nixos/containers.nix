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
      volumes = ["/Containers/Jellyfin/Config:/config:rw"];
    };
    Pihole = {
      image = "docker.io/pihole/pihole:latest";
      ports = [ "53:53/tcp" "53:53/udp" "80:80/tcp" ];
      volumes = [ "/Containers/Pihole/Config:/etc/pihole/:rw" "/Containers/Pihole/dnsmasqd:/etc/dnsmasq.d:rw"];
      environment = {
        DNSMASQ_USER = "root";
        TZ = "Auckland/Pacific";
      };
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
    }
  };
}