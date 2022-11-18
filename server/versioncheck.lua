Citizen.CreateThread( function()
    function checkVersion(err,responseText, headers)
        json = json.decode(responseText)
        if json == nil then
            print("Error checking version.")
            return;
        end
        if not json['success'] == true then
            print("Error checking version.")
            return;
        end
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version")


       if json['response']['latest_version']['version'] == curVersion then
            print("You are using the latest version. Version: ".. curVersion)
        else
            print("You are using an outdated version. Current-Version: ".. curVersion .. " | Latest-Version: " .. json['response']['latest_version']['version'])
            print("Download it here: https://github.com/MaticRP/scenemenu")
        end
    end
    PerformHttpRequest("https://01-services.the-systems.eu/api/v1/service/6", checkVersion, "GET")
end)