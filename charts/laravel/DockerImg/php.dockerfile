FROM php:8.2-cli

# ENTRYPOINT ["/bin/bash"]
# CMD ["tail", "-f","/*/**/*.log"]

ENTRYPOINT ["bash", "-c","tail -f /*/**/*.log" ]
# CMD ["-f","/dev/null"]
WORKDIR /usr/src/www
CMD [ "sh", "/start.sh" ]

# ENTRYPOINT ["tail"]
# CMD ["-f","/*/**/*.log"]
