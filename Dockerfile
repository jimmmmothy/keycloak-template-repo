# Keycloak dev-friendly image that imports any realms found in /opt/keycloak/data/import
FROM quay.io/keycloak/keycloak:latest

# Default admin credentials (override at runtime!)
ENV KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=admin1234

# Copy any realm export(s). Your repo has config/realm.json by default.
COPY config/ /opt/keycloak/data/import/

EXPOSE 8080

# Start in dev mode and import realms on boot.
# For production you'd use `start` with a real DB and omit --import-realm.
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev","--import-realm"]
