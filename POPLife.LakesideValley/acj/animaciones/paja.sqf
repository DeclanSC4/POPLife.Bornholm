/////////////////////////////
// TDR ACJ
// Animaciones 
//////////////////////////

if (!isNil "life_fnc_animsync") then 
{
[[player,"CL3_anim_Wank"],"life_fnc_animsync",true,false] spawn life_fnc_MP;
} else
{
player switchmove "CL3_anim_Wank"
};

[] spawn 
{
sleep 6;
[[player,""],"life_fnc_animsync",true,false] spawn life_fnc_MP;
A3L_isDancing = false;
};		