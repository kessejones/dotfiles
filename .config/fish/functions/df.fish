function df --wraps "df"
    set -l args $argv

    if count $args -eq 0
        set args "-h"
    end

    nu -c "df $args | str replace \"Mounted on\" Mounted_on | detect columns | table --index=false"
end
