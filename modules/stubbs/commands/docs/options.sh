# generated by stubbs:add-option
# Sun Sep 25 11:26:56 PDT 2011
#
#/ usage: stubbs:docs --module|-m <>

# print USAGE and exit
rerun_option_error() {
    local -r message=$1
    if [[ "$RERUN_COLOR" == "true" ]]
    then echo >&2 -e "${red}" "SYNTAX: $message" "${_red}"  
    else echo "SYNTAX: $message" >&2
    fi
    exit 2
}

# print USAGE and exit
rerun_option_usage() {
    if [ -f "$0" ]
    then grep '^#/ usage:' <"$0" | cut -c4- >&2
    else echo "usage: check command for usage." >&2
    fi
    return 2
}

# check option has its argument
rerun_option_check() {
    (( "$@" < 2 )) && rerun_option_error "option requires argument"
}

# options: [name]
while [ "$#" -gt 0 ]; do
    OPT="$1"
    case "$OPT" in
         -m|--module) rerun_option_check $# ; MODULE=$2 ; shift ;;
         --dir) rerun_option_check $# ; DIR=$2 ; shift ;;
        # unknown option
        -?)
            rerun_option_usage
            exit 2
            ;;
        # end of options, just arguments left
        *)
          break
    esac
    shift
done


# If defaultable options variables are unset, set them to their DEFAULT
