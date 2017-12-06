# Docker image for salt-minion based on Debian

**not intended for production use**

This is a very simple image to have `salt-minion` run in a Docker container.

It uses the official Saltstack repositories for Debian, in order to install
the wished version rather than the one provided by Debian.

It exposes the whole `/etc/salt` as a volume, so that you can control the
whole configuration (including `minion_id`), preseed keys, etc (à la Salt Cloud)

Please simply read `Dockerfile` for this version specifics.
The branch name is intended to be the major Salt release, although obviously
more branches can exist.


