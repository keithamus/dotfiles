# docker-machine
if [ (docker-machine status default) = "Running" ];
    eval (docker-machine env default)
end

# nvm
nvm use default --silent

# npm
set PATH $PATH ./node_modules/.bin

# cargo
set PATH $PATH ~/.cargo/bin
