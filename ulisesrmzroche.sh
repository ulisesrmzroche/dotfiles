# ulisesrmzroche.sh

function start-info-site() {
    cd ~/work/ulisesrmzroche/ulisesrmzroche-info
    docker-compose up -d
    echo "Started project ulisesrmzroche-info"
}

function stop-info-site() {
  cd ~/work/ulisesrmzroche/ulisesrmzroche-info
  docker-compose down
  cd ~
  echo "Stopped project ulisesrmzroche-info"
}

function start-project() {
  local projectName=$1;
  if [[ ${projectName} = "site" ]]; then
    start-info-site
  fi
}

function stop-project() {
  local projectName=$1;
  if [[ ${projectName} = "site" ]]; then
    stop-info-site
  fi
}

function start-issue() {
    local issueNumber=$1;
    local summary=$2;

    if [[ $issueNumber = "" ]]; then
      echo "Requires an issue number"
    elif [[ ${summary} = "" ]]; then
      echo "Requires a summary"
    elif [[ ${summary} = "" && ${issueNumber} = "" ]]; then
      echo "Requires a summary and an issue number"
    else
      git checkout master
      git pull origin master
      git checkout -b "i${issueNumber}-${summary}"
      start "Started issue: i${issueNumber}-${summary}"
    fi
}

alias workspace="atom-beta ~/.desk/desks/ulisesrmzroche.sh"
