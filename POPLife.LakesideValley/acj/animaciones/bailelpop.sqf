/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then 
{
[[player,"cl3_dubstepPop"],"life_fnc_animsync",true,false] spawn life_fnc_MP;
} else
{
player switchmove "cl3_dubstepPop"
};

[] spawn 
{
sleep 50;
[[player,""],"life_fnc_animsync",true,false] spawn life_fnc_MP;
A3L_isDancing = false;
};	