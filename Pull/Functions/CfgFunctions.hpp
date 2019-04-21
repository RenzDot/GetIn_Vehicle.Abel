class Renz_Pull_Functions
{
	tag = "Renz";

	class Renz
	{
		file = "Pull\Functions";
		class pull
		{
			headerType = -1;
		}

		class serverPush 
		{
			headerType = -1;
		}

		class clientPush 
		{
			headerType = -1;
		}

		class getFunctionNames 
		{
			headerType = -1;
		}

		class serverPull 
		{
			headerType = -1;
			preInit = 1;
		}

		class clientPull
		{
			headerType = -1;
			postInit = 1;
		}
	
	}

}