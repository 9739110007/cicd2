
#!/bin/bash

# Extracting version from pom.xml
tag1=$(sed -n '7s/.*<version>\(.*\)<\/version>/\1/p' pom.xml | awk -F '-' '{print $1}')

# Display Docker version
docker version

# Build Docker image
docker build -t hello .

# Tag Docker image
docker tag hello container548/hello:"$tag1"

# Push Docker image to registry
docker push container548/hello:"$tag1"

# Update deployment.yml with the new tag
sed -i "s/latest/$tag1/g" deployment.yml

#########################################################################################################

#sed -n '7s/.*<version>\(.*\)<\/version>/\1/p' pom.xml:
# explaination of command

#sed :is the stream editor, used for text transformations.
#-n :option suppresses automatic printing of pattern space.
##7s/.*<version>\(.*\)<\/version>/\1/p: This sed command looks for the 7th line in the file pom.xml, matches the pattern between <version> and </version>, and prints only that matched part.
# .*<version>\(.*\)<\/version>: This is the regular expression to match the entire line containing <version> tags, and it captures the content between the tags.
#\1: In the replacement part, it refers to the content captured within the parentheses.
#p: Prints the result.
# | awk -F '-' '{print $1}':| is the pipe operator, which takes the output of the preceding command and passes it as input to the following command.
#awk is a text processing tool that operates on fields within a line.
#-F '-': Specifies that the field separator is the hyphen ("-").
#{print $1}: Prints the first field (the part before the hyphen).
 # So, in summary, this command extracts the version information from the 7th line of the pom.xml file, then uses awk to extract the part before the hyphen in case there is a hyphenated version (common in version strings like "1.0-SNAPSHOT"). The result is stored in the variable tag1.





