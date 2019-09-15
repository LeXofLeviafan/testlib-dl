#include "testlib.h"
#include <string>

using namespace std;

int main(int argc, char * argv[])
{
    setName("DL interactive player checker");
    registerTestlibCmd(argc, argv);

    std::string result = ouf.readLine();
    std::string comment = ouf.readLine();

    quitf((result == "1" ? _ok : _fail), "%s", comment.c_str());
}
