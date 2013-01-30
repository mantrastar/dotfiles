# Create an SSH tunnel through a host
sshtunnel () {
  ssh -D 8080 -f -C -q -N "$*";
}
