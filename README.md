# cygwin-scripts
Useful scripts for development under cygwin

## javapausetimes.sh ##
When java does a garbage collection it can pause all threads. This script quickly prints the minimum, maximum, average and counts for both young and old collections based on a verbose GC log. Java must be started with the following arguments to produce a log with the necessary information ``-verbose:gc,gcheuristic,gcpause,gcreport,systemgc -XverboseTimeStamp -Xverboselog:/path/to/gc.log`` (example relevant to Oracle JRockit).

### Example Usage ###
    $ javapausetimes.sh /path/to/gc.log
    [YC] Min: 46.165000             Max: 2038.904000        Average: 167.135334             Count: 1159
    [OC] Min: 123.226000            Max: 413.757000         Average: 248.258250             Count: 4

## recentlymodified.sh ##
Outputs the ten most recently changed files in the directory provided and any sub-directories.
Example usage: ``$ recentlymodified.sh /path/to/directory``
