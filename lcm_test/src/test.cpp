#include <iostream>
#include <lcm/lcm-cpp.hpp>
#include "drc_lcmtypes/string_t.hpp"

class MyMessageHandler
{
public:
    void onMessage(const lcm::ReceiveBuffer* rbuf, const std::string& channel, const drc::string_t* msg)
    {
        std::cout << "Received message \"" << msg->data <<"\"\n";
    }
};

int main(int argc, char **argv)
{
    lcm::LCM lcm;
    if(!lcm.good()) return 1;

    drc::string_t msg;
    msg.utime = 0;
    msg.data = "Hello World";

    MyMessageHandler handlerObject;
    lcm.subscribe("EXAMPLE", &MyMessageHandler::onMessage, &handlerObject);

    std::cout << "Sending example message...\n";
    lcm.publish("EXAMPLE", &msg);

    return lcm.handle();
}
