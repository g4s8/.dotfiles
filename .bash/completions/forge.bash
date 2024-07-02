_forge() {
    local i cur prev opts cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="forge"
                ;;
            forge,b)
                cmd="forge__build"
                ;;
            forge,bind)
                cmd="forge__bind"
                ;;
            forge,build)
                cmd="forge__build"
                ;;
            forge,c)
                cmd="forge__create"
                ;;
            forge,cache)
                cmd="forge__cache"
                ;;
            forge,cl)
                cmd="forge__clean"
                ;;
            forge,clean)
                cmd="forge__clean"
                ;;
            forge,co)
                cmd="forge__config"
                ;;
            forge,com)
                cmd="forge__completions"
                ;;
            forge,compile)
                cmd="forge__build"
                ;;
            forge,completions)
                cmd="forge__completions"
                ;;
            forge,config)
                cmd="forge__config"
                ;;
            forge,coverage)
                cmd="forge__coverage"
                ;;
            forge,create)
                cmd="forge__create"
                ;;
            forge,d)
                cmd="forge__debug"
                ;;
            forge,debug)
                cmd="forge__debug"
                ;;
            forge,doc)
                cmd="forge__doc"
                ;;
            forge,f)
                cmd="forge__flatten"
                ;;
            forge,fig)
                cmd="forge__generate__fig__spec"
                ;;
            forge,flatten)
                cmd="forge__flatten"
                ;;
            forge,fmt)
                cmd="forge__fmt"
                ;;
            forge,geiger)
                cmd="forge__geiger"
                ;;
            forge,generate-fig-spec)
                cmd="forge__generate__fig__spec"
                ;;
            forge,help)
                cmd="forge__help"
                ;;
            forge,i)
                cmd="forge__install"
                ;;
            forge,in)
                cmd="forge__inspect"
                ;;
            forge,init)
                cmd="forge__init"
                ;;
            forge,inspect)
                cmd="forge__inspect"
                ;;
            forge,install)
                cmd="forge__install"
                ;;
            forge,re)
                cmd="forge__remappings"
                ;;
            forge,remappings)
                cmd="forge__remappings"
                ;;
            forge,remove)
                cmd="forge__remove"
                ;;
            forge,rm)
                cmd="forge__remove"
                ;;
            forge,s)
                cmd="forge__snapshot"
                ;;
            forge,script)
                cmd="forge__script"
                ;;
            forge,snapshot)
                cmd="forge__snapshot"
                ;;
            forge,t)
                cmd="forge__test"
                ;;
            forge,test)
                cmd="forge__test"
                ;;
            forge,tr)
                cmd="forge__tree"
                ;;
            forge,tree)
                cmd="forge__tree"
                ;;
            forge,u)
                cmd="forge__update"
                ;;
            forge,up)
                cmd="forge__upload__selectors"
                ;;
            forge,update)
                cmd="forge__update"
                ;;
            forge,upload-selectors)
                cmd="forge__upload__selectors"
                ;;
            forge,v)
                cmd="forge__verify__contract"
                ;;
            forge,vc)
                cmd="forge__verify__check"
                ;;
            forge,verify-check)
                cmd="forge__verify__check"
                ;;
            forge,verify-contract)
                cmd="forge__verify__contract"
                ;;
            forge__cache,clean)
                cmd="forge__cache__clean"
                ;;
            forge__cache,help)
                cmd="forge__cache__help"
                ;;
            forge__cache,ls)
                cmd="forge__cache__ls"
                ;;
            forge__cache__help,clean)
                cmd="forge__cache__help__clean"
                ;;
            forge__cache__help,help)
                cmd="forge__cache__help__help"
                ;;
            forge__cache__help,ls)
                cmd="forge__cache__help__ls"
                ;;
            forge__help,bind)
                cmd="forge__help__bind"
                ;;
            forge__help,build)
                cmd="forge__help__build"
                ;;
            forge__help,cache)
                cmd="forge__help__cache"
                ;;
            forge__help,clean)
                cmd="forge__help__clean"
                ;;
            forge__help,completions)
                cmd="forge__help__completions"
                ;;
            forge__help,config)
                cmd="forge__help__config"
                ;;
            forge__help,coverage)
                cmd="forge__help__coverage"
                ;;
            forge__help,create)
                cmd="forge__help__create"
                ;;
            forge__help,debug)
                cmd="forge__help__debug"
                ;;
            forge__help,doc)
                cmd="forge__help__doc"
                ;;
            forge__help,flatten)
                cmd="forge__help__flatten"
                ;;
            forge__help,fmt)
                cmd="forge__help__fmt"
                ;;
            forge__help,geiger)
                cmd="forge__help__geiger"
                ;;
            forge__help,generate-fig-spec)
                cmd="forge__help__generate__fig__spec"
                ;;
            forge__help,help)
                cmd="forge__help__help"
                ;;
            forge__help,init)
                cmd="forge__help__init"
                ;;
            forge__help,inspect)
                cmd="forge__help__inspect"
                ;;
            forge__help,install)
                cmd="forge__help__install"
                ;;
            forge__help,remappings)
                cmd="forge__help__remappings"
                ;;
            forge__help,remove)
                cmd="forge__help__remove"
                ;;
            forge__help,script)
                cmd="forge__help__script"
                ;;
            forge__help,snapshot)
                cmd="forge__help__snapshot"
                ;;
            forge__help,test)
                cmd="forge__help__test"
                ;;
            forge__help,tree)
                cmd="forge__help__tree"
                ;;
            forge__help,update)
                cmd="forge__help__update"
                ;;
            forge__help,upload-selectors)
                cmd="forge__help__upload__selectors"
                ;;
            forge__help,verify-check)
                cmd="forge__help__verify__check"
                ;;
            forge__help,verify-contract)
                cmd="forge__help__verify__contract"
                ;;
            forge__help__cache,clean)
                cmd="forge__help__cache__clean"
                ;;
            forge__help__cache,ls)
                cmd="forge__help__cache__ls"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        forge)
            opts="-h -V --help --version test script coverage bind build debug update install remove remappings verify-contract verify-check create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect upload-selectors tree geiger doc help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__bind)
            opts="-b -C -R -o -h --bindings-path --select --skip --select-all --crate-name --crate-version --module --overwrite --single-file --skip-cargo-toml --skip-build --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --bindings-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --select)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --crate-name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --crate-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__build)
            opts="-C -R -o -w -h --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --names --sizes --skip --watch --no-restart --run-all --watch-delay --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache)
            opts="-h --help clean ls help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__clean)
            opts="-b -h --blocks --etherscan --help [CHAINS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --blocks)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -b)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help)
            opts="clean ls help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help__clean)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__help__ls)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__cache__ls)
            opts="-h --help [CHAINS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__clean)
            opts="-h --root --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__completions)
            opts="-h --help bash elvish fish powershell zsh"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__config)
            opts="-C -R -o -w -f -v -h --basic --json --fix --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --names --sizes --skip --watch --no-restart --run-all --watch-delay --rpc-url --fork-url --fork-block-number --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --verbosity --gas-limit --code-size-limit --chain-id --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__coverage)
            opts="-m -f -v -C -R -o -h --report --match --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --rpc-url --fork-url --fork-block-number --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --verbosity --gas-limit --code-size-limit --chain-id --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --report)
                    COMPREPLY=($(compgen -W "summary lcov debug" -- "${cur}"))
                    return 0
                    ;;
                --match)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -m)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__create)
            opts="-C -R -o -r -e -c -f -i -l -t -h --constructor-args --constructor-args-path --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --gas-limit --gas-price --priority-gas-price --value --nonce --legacy --rpc-url --flashbots --etherscan-api-key --chain --from --interactive --private-key --mnemonic --mnemonic-passphrase --mnemonic-derivation-path --mnemonic-index --keystore --password --password-file --ledger --trezor --aws --json --verify --unlocked --verifier --verifier-url --retries --delay --help <CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --priority-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --value)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nonce)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --from)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-passphrase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-derivation-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-index)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__debug)
            opts="-s -C -R -o -f -v -h --tc --target-contract --sig --debug --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --rpc-url --fork-url --fork-block-number --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --verbosity --gas-limit --code-size-limit --chain-id --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --help <PATH> [ARGS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --target-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sig)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__doc)
            opts="-o -b -s -p -h --root --out --build --serve --hostname --port --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --hostname)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --port)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__flatten)
            opts="-o -C -R -h --output --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help <TARGET_PATH>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__fmt)
            opts="-r -h --root --check --raw --help [PATH]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__geiger)
            opts="-h --root --check --ignore --full --help [PATH]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__generate__fig__spec)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help)
            opts="test script coverage bind build debug update install remove remappings verify-contract verify-check create init completions generate-fig-spec clean cache snapshot config flatten fmt inspect upload-selectors tree geiger doc help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__bind)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__build)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__cache)
            opts="clean ls"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__cache__clean)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__cache__ls)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__clean)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__completions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__config)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__coverage)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__create)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__debug)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__doc)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__flatten)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__fmt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__geiger)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__generate__fig__spec)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__init)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__inspect)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__install)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__remappings)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__remove)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__script)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__snapshot)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__test)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__tree)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__update)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__upload__selectors)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__verify__check)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__help__verify__contract)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__init)
            opts="-t -q -h --template --no-git --no-commit --quiet --no-deps --offline --force --vscode --help [ROOT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --template)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -t)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__inspect)
            opts="-C -R -o -h --pretty --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --help <CONTRACT> <FIELD>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__install)
            opts="-q -h --no-git --no-commit --quiet --root --help [DEPENDENCIES]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__remappings)
            opts="-h --root --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__remove)
            opts="-h --root --help [DEPENDENCIES]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__script)
            opts="-s -g -C -R -o -w -i -l -t -a -f -v -h --tc --target-contract --sig --legacy --broadcast --skip-simulation --gas-estimate-multiplier --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --names --sizes --skip --watch --no-restart --run-all --watch-delay --interactives --private-keys --private-key --mnemonics --mnemonic-passphrases --mnemonic-derivation-paths --mnemonic-indexes --keystores --keystore --password --password-file --ledger --trezor --aws --froms --rpc-url --fork-url --fork-block-number --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --verbosity --gas-limit --code-size-limit --chain-id --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --unlocked --resume --multi --debug --slow --etherscan-api-key --verify --verifier --verifier-url --json --with-gas-price --retries --delay --help <PATH> [ARGS]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --target-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sig)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-estimate-multiplier)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -g)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --skip)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --interactives)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -i)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-keys)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonics)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-passphrases)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-derivation-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mnemonic-indexes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystore)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keystores)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --froms)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --with-gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__snapshot)
            opts="-m -j -f -v -C -R -o -w -l -h --match --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --debug --gas-report --allow-failure --json --rpc-url --fork-url --fork-block-number --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --verbosity --gas-limit --code-size-limit --chain-id --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --etherscan-api-key --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --watch --no-restart --run-all --watch-delay --list --fuzz-seed --asc --desc --min --max --diff --check --format --snap --tolerance --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --match)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -m)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --min)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --max)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --diff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --check)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --snap)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tolerance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__test)
            opts="-m -j -f -v -C -R -o -w -l -h --match --mt --match-test --nmt --no-match-test --mc --match-contract --nmc --no-match-contract --mp --match-path --nmp --no-match-path --debug --gas-report --allow-failure --json --rpc-url --fork-url --fork-block-number --fork-retry-backoff --no-storage-caching --initial-balance --sender --ffi --verbosity --gas-limit --code-size-limit --chain-id --gas-price --base-fee --block-base-fee-per-gas --tx-origin --block-coinbase --block-timestamp --block-number --block-difficulty --block-prevrandao --block-gas-limit --memory-limit --compute-units-per-second --no-rate-limit --no-rpc-rate-limit --etherscan-api-key --force --libraries --evm-version --optimize --optimizer-runs --extra-output --extra-output-files --ignored-error-codes --deny-warnings --no-auto-detect --use --offline --via-ir --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --out --revert-strings --silent --build-info --build-info-path --watch --no-restart --run-all --watch-delay --list --fuzz-seed --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --match)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -m)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-test)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmt)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-contract)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmc)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --mp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --no-match-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --nmp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --debug)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rpc-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fork-retry-backoff)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --initial-balance)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sender)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --gas-price)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-base-fee-per-gas)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base-fee)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tx-origin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-coinbase)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-timestamp)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-number)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-difficulty)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-prevrandao)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --block-gas-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --memory-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compute-units-per-second)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --evm-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --extra-output-files)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ignored-error-codes)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --use)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revert-strings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --build-info-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -w)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --watch-delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --fuzz-seed)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__tree)
            opts="-C -R -h --no-dedupe --charset --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --charset)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__update)
            opts="-h --help [LIB]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__upload__selectors)
            opts="-C -R -h --all --root --contracts --remappings --remappings-env --cache-path --lib-paths --hh --hardhat --config-path --help [CONTRACT]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --contracts)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -C)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -R)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remappings-env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cache-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --lib-paths)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__check)
            opts="-e -c -h --retries --delay --etherscan-api-key --chain --verifier --verifier-url --help <ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        forge__verify__contract)
            opts="-e -c -f -h --constructor-args --constructor-args-path --compiler-version --optimizer-runs --num-of-optimizations --etherscan-api-key --chain --flatten --force --watch --retries --delay --libraries --root --verifier --verifier-url --show-standard-json-input --help <ADDRESS> <CONTRACT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --constructor-args)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --constructor-args-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --compiler-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --num-of-optimizations)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --optimizer-runs)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --etherscan-api-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -e)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --chain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --retries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --libraries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --verifier)
                    COMPREPLY=($(compgen -W "etherscan sourcify blockscout" -- "${cur}"))
                    return 0
                    ;;
                --verifier-url)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

complete -F _forge -o bashdefault -o default forge
