#!/bin/bash
usage()
{
cat << EOF
usage: $0 options

This script updates or deletes a puppet environment branch.

OPTIONS:
   -h      Show this message
   -b      Branch name
EOF
}

EXITRETURN=0

while getopts "db:" OPTION
do
  case "$OPTION" in
    h) usage
    exit 1
    ;;
    b) 
    BRANCH=$OPTARG
    ;;
    ?)
    usage
    exit 1
    ;;  
  esac
done

if [[ -z $BRANCH ]]
  then
  usage
  exit 1
fi


REPO="git@github.com:ExampleUserorOrg/Repo.git"
BRANCH_DIR="/etc/puppet/environments/pullreq_env"

  # branch is being updated
  echo "Testing  branch $BRANCH_DIR"

    { cd $BRANCH_DIR && git fetch && git checkout  $BRANCH && git submodule foreach git submodule update --init --recursive; } \
    || EXITRETURN=1

echo web01
puppet master --compile web01.example.com  --environment pullreq_env > /dev/null || EXITRETURN=1

# example mysql server
echo mysql01
puppet master --compile mysql01.example.com  --environment pullreq_env > /dev/null || EXITRETURN=1

exit $EXITRETURN
