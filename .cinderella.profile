PATH="/Users/quellhorst/Developer/bin:/Users/quellhorst/Developer/sbin:$PATH"; export PATH
MANPATH="/Users/quellhorst/Developer/share/man:$MANPATH"; export MANPATH
CFLAGS="-I/Users/quellhorst/Developer/include"; export CFLAGS
CPPFLAGS="-I/Users/quellhorst/Developer/include"; export CPPFLAGS
CXXFLAGS="-I/Users/quellhorst/Developer/include"; export CXXFLAGS
LDFLAGS="-L/Users/quellhorst/Developer/lib"; export LDFLAGS
NODE_PATH="/Users/quellhorst/Developer/lib/node"; export NODE_PATH

export CONFIGURE_ARGS="--with-cflags='$CFLAGS' --with-ldflags='$LDFLAGS'"

export rvm_path=/Users/quellhorst/Developer/.rvm
if [[ -s /Users/quellhorst/Developer/.rvm/scripts/rvm ]] ; then
  source /Users/quellhorst/Developer/.rvm/scripts/rvm
fi

if [[ -d /Users/quellhorst/Developer/Cellar/python/2.7/bin ]]; then
  export PATH=~/Developer/Cellar/python/2.7/bin:$PATH
fi

if [[ -f /Users/quellhorst/.cinderella.profile.custom ]]; then
  source ~/.cinderella.profile.custom
fi
