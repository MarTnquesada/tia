package roadproblem;

import org.opt4j.core.problem.ProblemModule;

public class RoadModule extends ProblemModule 
{

	@Override
	protected void config() 
	{
		// mostrar� errores mientras ProyectoCreator, ProyectoDecoder y ProyectoEvaluator no est�n completos
		bindProblem(RoadCreator.class, RoadDecoder.class, RoadEvaluator.class);
	}

}

