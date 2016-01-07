function ip -d "Get your externally facing IP"
  dig +short myip.opendns.com @resolver1.opendns.com
end
