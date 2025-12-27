function df --wraps "df"
    set -l args $argv

    if count $args -eq 0
        set args "-h"
    end

    nu -c "df $args | detect columns --guess | table --index=false"
end
